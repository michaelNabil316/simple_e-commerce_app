import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/bloc/events.dart';
import 'package:flutter/material.dart';
import 'package:flitill/screens/home.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: BlocConsumer<CounterBloc, CounterState>(
        listener: (BuildContext context, CounterState state) {},
        builder: (BuildContext context, CounterState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: kPrimaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryTextTheme: TextTheme(
                headline6: TextStyle(color: Colors.white),
              ),
            ),
            home: MyHomePage(),
          );
        },
      ),
    );
  }
}
