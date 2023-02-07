import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/apiservices/validator.dart';
import 'package:vensemart/services/provider/provider_services.dart';

import '../widgets/image_picker_widget.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({Key? key}) : super(key: key);

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ninController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();


  ProviderServices? providerServices;
  final _globalFormKey = GlobalKey<FormState>();



  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);

    super.initState();
  }



  void updateProfile(context) async {
    if (_globalFormKey.currentState!.validate()) {
      providerServices?.sendSupportMessage(map: {
        "email": nameController.text,
        "subject": emailController.text,
        "message": phoneController.text,
      }, context: context);

    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(234, 234, 234, 1),
        appBar: AppBar(
          backgroundColor: const Color(0xff1456f1),
          title: const Text("Customer Support"),
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
        ),
        body: Form(
          key: _globalFormKey,
          child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      const SizedBox(height: 10.0),
                      const Text('Email'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        controller: nameController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                          // label: Text(
                          //     provider.userDetailsModel?.data?.name ?? ''),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Subject'),
                      const SizedBox(height: 4.0),
                      TextFormField(

                        controller: emailController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                          // label: Text(
                          //     provider.userDetailsModel?.data?.email ?? ''),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),
                      const Text('Message'),
                      const SizedBox(height: 4.0),
                      TextFormField(
                        maxLines: 6,
                        minLines: 3,
                        controller: phoneController,
                        validator: Validators.validateString(),
                        decoration: InputDecoration(
                          // label: Text(
                          //     provider.userDetailsModel?.data?.mobile ?? ''),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[600]),
                            fillColor: Colors.white),
                      ),
                      const SizedBox(height: 14.0),

                      const SizedBox(
                        height: 30.0,
                      ),
                      Center(
                        child:  GestureDetector(
                          onTap: () => updateProfile(context),
                          child: Consumer<ProviderServices>(
                            builder: (_, value, __) => Center(
                              child: Container(
                                height:MediaQuery.of(context).size.height / 14,
                                width: MediaQuery.of(context).size.width / 1.10,
                                decoration: BoxDecoration(
                                  color: const Color(0xff1456f1),
                                  borderRadius: BorderRadius.circular(90.0),
                                ),
                                child: value.isLoading == true
                                    ? const SpinKitCircle(
                                  color: Colors.white,
                                )
                                    : const Center(
                                  child: Text(
                                    'Send Message',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

          ),
        ),

    );
  }
}
