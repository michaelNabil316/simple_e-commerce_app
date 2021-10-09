import 'package:flutter/material.dart';
import 'package:flitill/constants.dart';

class MyMainCard extends StatelessWidget {
  final title;
  final subtitle;
  final imgPath;
  final moreSize;
  const MyMainCard(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.imgPath,
      this.moreSize = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myMdeia = MediaQuery.of(context).size;
    return Container(
        height: myMdeia.height * 0.20,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            Container(
              height: myMdeia.height * 0.20,
              width: myMdeia.width * 0.8,
              margin: new EdgeInsets.only(left: 46.0),
              decoration: new BoxDecoration(
                color: subColor,
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: shadoSubColor,
                    blurRadius: 10.0,
                    offset: new Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  title,
                  style: mainCardsText,
                ),
              ),
            ),
            Container(
              margin: new EdgeInsets.symmetric(vertical: 16.0),
              alignment: FractionalOffset.centerLeft,
              child: new Image(
                image: new AssetImage(imgPath),
                height: myMdeia.height * 0.18 + moreSize,
                width: myMdeia.height * 0.12 + moreSize,
              ),
            )
          ],
        ));
  }
}
