import 'package:flitill/presentation/screens/sign_in/sign_in.dart';
import 'package:flitill/presentation/screens/sign_up/sign_up.dart';
import 'package:flitill/presentation/widgets/sign_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'doorplate.dart';

class Welcome extends StatefulWidget {
  static const id = "welcome";
  const Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50),
          decoration: weclomeBoxDec,
          child: Column(
            children: [
              const Doorplate(label: 'Michael shop'),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: SignButton(
                    label: 'sign in',
                    fun: () {
                      Navigator.of(context).pushNamed(SignIn.id);
                    },
                  ),
                ),
              ),
              Center(
                child: SignButton(
                  label: 'sign up',
                  fun: () {
                    Navigator.of(context).pushNamed(SignUp.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
