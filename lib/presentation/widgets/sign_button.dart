import 'package:flutter/material.dart';

import '../../constants.dart';

class SignButton extends StatelessWidget {
  final label;
  final fun;
  const SignButton({Key key, @required this.fun, @required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Text(
            label,
            style: addStyle,
          ),
        ),
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: fun,
      ),
    );
  }
}
