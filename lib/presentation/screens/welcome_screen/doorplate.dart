import 'package:flutter/material.dart';

import '../../../constants.dart';

class Doorplate extends StatelessWidget {
  final label;
  const Doorplate({Key key, @required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      child: Transform(
        alignment: AlignmentDirectional.center,
        transform: Matrix4.identity()..rotateZ(330 * 3.1415927 / 180),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          decoration: doorpatelBord,
          child: Text(
            label,
            style: doorpatelTxtStyle,
          ),
        ),
      ),
    );
  }
}
