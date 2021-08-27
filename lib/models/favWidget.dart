import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flitill/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavrouitWidget extends StatefulWidget {
  final title;
  final price;
  final imgPath;
  final index;

  const FavrouitWidget(
      {Key key,
      @required this.title,
      @required this.price,
      @required this.imgPath,
      @required this.index})
      : super(key: key);

  @override
  _FavrouitWidgetState createState() => _FavrouitWidgetState();
}

class _FavrouitWidgetState extends State<FavrouitWidget> {
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    final myMedia = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white,
                    //border: Border.all(width: 0.5, color: kSubColor),
                    boxShadow: [
                      BoxShadow(
                        color: kSubColor,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                      height: 200,
                      width: myMedia.width * 0.4,
                      child: Image.network('${widget.imgPath}'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: myMedia.width * 0.52,
                          child: Text(
                            '${widget.title}',
                            style: detailsTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${widget.price} \$',
                          style: detailsPrice,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top: 2, right: 2),
                  child: Icon(
                    Icons.cancel_rounded,
                    color: Colors.amber,
                    size: 32,
                  ),
                ),
                onTap: () {
                  CounterBloc.get(context)
                      .add(DeleteFavourites(product: this.widget));
                  CounterBloc.get(context)
                      .add(MinusTotalPrice(price: widget.price));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.close();
  }
}
