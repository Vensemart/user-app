import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/models/services_model.dart';
import 'package:vensemart/services/provider/provider_services.dart';
import 'package:vensemart/services/screens/AvailableServicesListScreen.dart';

class ServicesGridScreen extends StatefulWidget {
  const ServicesGridScreen({Key? key}) : super(key: key);

  @override
  State<ServicesGridScreen> createState() => _ServicesGridScreenState();
}

class _ServicesGridScreenState extends State<ServicesGridScreen> {
  ProviderServices? providerServices;
  TextEditingController controller = TextEditingController();
  String _query = '';
  List searchItem = [];

  int intval = 0;

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.services();
    searchItem.clear();
    super.initState();
  }

  @override
  void dispose() {
    searchItem.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),

        title: const Text(
          'Services',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
        elevation: 0.00,
      ),

      backgroundColor: const Color.fromRGBO(234, 234, 234, 2),
      body: Consumer<ProviderServices>(
        builder: (_, provider, __) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: controller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (v) {
                      // searchItem.clear();
                      setState(() => _query = v);
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      hintText: 'what service are you looking for',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      fillColor: const Color.fromRGBO(250, 250, 254, 1),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    crossAxisCount: 3,
                    children: <Widget>[
                      if (provider.isAvailable)
                        ...provider.servicesModel!.data!
                            .where((element) => element.categoryName!
                                .toLowerCase()
                                .contains(_query.toLowerCase()))
                            .map((e) {
                          // if (e.categoryName!
                          //     .toString()
                          //     .toLowerCase()
                          //     .contains(_query.toLowerCase())) {
                          //   searchItem.add(e);
                          //   intval = searchItem.length-1;
                          //   print('int val $intval');

                          //   print(
                          //       'object an image ${searchItem[intval].toJson().toString()}');
                          // }
                          return contentContainer(
                              homeId: e.id,
                              text: e.categoryName, image: e.categoryIcon);
                        }).toList()
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  contentContainer({int? homeId,String? text, String? image}) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            title: Center(
                child: Text(
              text ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
            backgroundColor: Colors.black54,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AvailableServicesListScreen(lat: 8.toString(),long: 9.toString(),id: homeId.toString()),
                ),
              );
            },
            child: CachedNetworkImage(
              imageUrl: image.toString(),
              fit: BoxFit.cover,
              placeholder: (
                context,
                url,
              ) =>
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: const SpinKitCircle(
                        color: Colors.grey,
                      )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      );
}
