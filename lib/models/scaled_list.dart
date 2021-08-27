import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:flitill/constants.dart';

class ScaleListWidget extends StatefulWidget {
  final prodData;
  const ScaleListWidget({Key key, @required this.prodData}) : super(key: key);

  @override
  _ScaleListWidgetState createState() => _ScaleListWidgetState();
}

class _ScaleListWidgetState extends State<ScaleListWidget> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    final myMdeia = MediaQuery.of(context).size;
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return ScaledList(
          itemCount: widget.prodData.length,
          itemColor: (index) {
            return kSubColor;
          },
          itemBuilder: (index, selectedIndex) {
            final category = widget.prodData[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: selectedIndex == index
                      ? myMdeia.height * 0.33
                      : myMdeia.height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: Colors.white,
                  ),
                  child: Image.network(category['image']),
                ),
                SizedBox(
                  height: 2.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${category['price']} \$',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: selectedIndex == index ? 25 : 20),
                    ),
                    InkWell(
                      onTap: () {
                        var newProductDetails = {
                          'title': '${category['title']}',
                          'price': '${category['price']}',
                          'description': '${category['description']}',
                          'image': '${category['image']}',
                        };
                        CounterBloc.get(context).add(
                            ChangeProductDetails(product: newProductDetails));
                        if (CounterBloc.get(context).isDetails == false)
                          CounterBloc.get(context).add(ChangeDetailsBoolen());
                      },
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: Colors.amber,
                        ),
                        child: Center(
                          child: Text('Details'),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15)
              ],
            );
          },
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
