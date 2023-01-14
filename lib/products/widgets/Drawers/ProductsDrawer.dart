import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/products/widgets/full_pages/ProductsHome.dart';
import 'package:vensemart/services/screens/ServicesHome.dart';
import 'package:vensemart/services/screens/ServicesHomeScreen.dart';

import '../../../services/provider/provider_services.dart';
import '../../../services/widgets/full_pages/ServiceHome.dart';

class ProductsDrawer extends StatefulWidget {
  const ProductsDrawer({Key? key}) : super(key: key);

  @override
  State<ProductsDrawer> createState() => _ProductsDrawerState();
}

class _ProductsDrawerState extends State<ProductsDrawer> {

  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    providerServices?.userDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Consumer<ProviderServices>(
    builder: (_, provider, __) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Color(0xff1456f1),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/images/profileimg.png"),
                  ),
                ),


                Positioned(
                  top: 140,
                  left: 20,
                  child: Text('${provider.userDetailsModel?.data?.name}', style: TextStyle(
                      fontSize: 22.0, fontWeight: FontWeight.bold),),
                ),


              ],
            ),

            Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Your Profile', style: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.normal),)),
            SizedBox(height: 20.0,),
            Container(
              color: Color.fromRGBO(237, 234, 234, 22),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsHome(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.menu),
                        title: Text('Home'),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                    ),

                    const ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Booking History'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesHomeScreen(),
                          ),
                        );
                      },
                      child: const ListTile(
                        leading: Icon(Icons.compare_arrows),
                        title: Text('Switch to Services'),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('contact'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                    ),

                    const ListTile(
                      leading: Icon(Icons.chat),
                      title: Text('Feedback'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.rate_review_rounded),
                      title: Text('Rate our app'),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.logout_outlined, color: Colors.redAccent,),
                      title: Text('Logout'),
                    ),

                  ],
                ),
              ),
            )

          ],
        ),
      );
    }
          ),
        ),
      );
  }
}
