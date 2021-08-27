import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDetailsDiver extends StatefulWidget {
  const ShowDetailsDiver({Key key}) : super(key: key);

  @override
  _ShowDetailsDiverState createState() => _ShowDetailsDiverState();
}

class _ShowDetailsDiverState extends State<ShowDetailsDiver> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Divider(
                    height: 1,
                    color: subColor,
                  ),
                ),
                SizedBox(width: 20),
                InkWell(
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.amber,
                    ),
                    child: CounterBloc.get(context).isDetails
                        ? Icon(Icons.arrow_drop_up_outlined)
                        : Icon(Icons.arrow_drop_down_sharp),
                  ),
                  onTap: () {
                    CounterBloc.get(context).add(ChangeDetailsBoolen());
                  },
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
          ],
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
