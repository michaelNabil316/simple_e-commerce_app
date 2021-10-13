import 'package:flitill/presentation/screens/home.dart';
import 'package:flitill/presentation/widgets/sign_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../constants.dart';

class SignUp extends StatefulWidget {
  static const id = "sign_up";

  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var phone;
  var userName = '';
  var userEmail = '';
  bool isName = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final myMedia = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0),
              //   child: Image.asset(
              //     'assets/images/fictionApp.jpg',
              //     height: myMedia.height * 0.2,
              //     width: myMedia.width * 0.8,
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(top: myMedia.height * 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: TextFormField(
                          onChanged: (value) {
                            userName = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: 'name:',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 80,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            phone = number.phoneNumber;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputDecoration: kTextFieldDecoration,
                          spaceBetweenSelectorAndTextField: 0,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter number';
                            } else if (value.length != 12) {
                              return '10 numbers only';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        height: 80,
                        child: TextFormField(
                          onChanged: (value) {
                            userEmail = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: 'email:',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            } else if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(value)) {
                              return 'Not valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SignButton(
                        label: 'sign up',
                        fun: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushReplacementNamed(
                                context, MyHomePage.id);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
