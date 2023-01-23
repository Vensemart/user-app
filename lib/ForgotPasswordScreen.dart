import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:vensemart/services/provider/provider_services.dart';

import 'apiservices/validator.dart';

class ForgotPasswordScreen extends StatefulWidget {
   ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  TextEditingController controller3 = TextEditingController();

  TextEditingController controller4 = TextEditingController();

  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;

  String currentText = "";

  final formKey = GlobalKey<FormState>();

  ProviderServices? providerServices;

  final _globalFormKey = GlobalKey<FormState>();

  String otpNumber = '';

  void verifyOtp(context) async {
    if (_globalFormKey.currentState!.validate()) {
      otpNumber = textEditingController.text.trim();
      setState(() {});
      providerServices?.verifyOTP(context: context, otpNumber: otpNumber);
    }
  }

  @override
  void initState() {
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network('https://vensemart.com/assets/images/logo.png'),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                // child: RichText(
                //   text: TextSpan(
                //       text: "Enter the code sent to ",
                //       children: [
                //         TextSpan(
                //             text: "${otpNumber}",
                //             style: const TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15)),
                //
                //       ],
                //       style:
                //       const TextStyle(color: Colors.black54, fontSize: 15)),
                //   textAlign: TextAlign.center,
                // ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _globalFormKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        validator: Validators.validateEmail(),
                        controller: controller1,
                        decoration: InputDecoration(
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
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email_rounded),
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            fillColor: const Color.fromRGBO(250, 250, 254, 1)),
                      ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(
              //       "Didn't receive the code? ",
              //       style: TextStyle(color: Colors.black54, fontSize: 15),
              //     ),
              //     TextButton(
              //       onPressed: () => snackBar("OTP resend!!"),
              //       child: const Text(
              //         "RESEND",
              //         style: TextStyle(
              //             color: Color(0xFF91D3B3),
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16),
              //       ),
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                  onTap: () => verifyOtp(context),
                  child: Consumer<ProviderServices>(
                    builder: (_, provider, __) => Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        child: provider.isLoading == true
                            ? const SpinKitCircle(
                          color: Colors.white,
                        )
                            : const Center(
                          child: Text('Reset Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500)),
                        )),
                  )),
              const SizedBox(
                height: 16,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Flexible(
              //         child: TextButton(
              //           child: const Text("Clear"),
              //           onPressed: () {
              //             textEditingController.clear();
              //           },
              //         )),
              //     // Flexible(
              //     //     child: TextButton(
              //     //       child: const Text("Set Text"),
              //     //       onPressed: () {
              //     //         setState(() {
              //     //           textEditingController.text = "1234";
              //     //         });
              //     //       },
              //     //     )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
