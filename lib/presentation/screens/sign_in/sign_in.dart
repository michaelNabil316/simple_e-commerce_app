import 'package:flitill/presentation/screens/sign_up/sign_up.dart';
import 'package:flitill/presentation/widgets/sign_button.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../home.dart';

class SignIn extends StatefulWidget {
  static const id = "sign_in";

  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int phone = 0;
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
        title: const Text('Sign in'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: myMedia.height * 0.1),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        height: 80,
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            userEmail = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            labelText: 'password:',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your password';
                            } else if (value.length < 8) {
                              return 'less than 8 digit';
                            }
                            return null;
                          },
                        ),
                      ),
                      SignButton(
                        label: 'sign in',
                        fun: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushReplacementNamed(
                                context, MyHomePage.id);
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: myMedia.height * 0.05),
                        child: InkWell(
                          child: const Text('or create new account'),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, SignUp.id);
                          },
                        ),
                      )
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
