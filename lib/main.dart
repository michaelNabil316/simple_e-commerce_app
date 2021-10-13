import 'package:flitill/presentation/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'bussiness_logic/bloc/bloc.dart';
import 'bussiness_logic/fetch_data_bloc/bloc/fetch_data_bloc.dart';
import 'constants.dart';
import 'presentation/screens/sign_in/sign_in.dart';
import 'presentation/screens/sign_up/sign_up.dart';
import 'presentation/screens/welcome_screen/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FetchDataBloc>(
          create: (context) => FetchDataBloc(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          ),
        ),
        initialRoute: Welcome.id,
        routes: {
          Welcome.id: (context) => const Welcome(),
          SignIn.id: (context) => const SignIn(),
          SignUp.id: (context) => const SignUp(),
          MyHomePage.id: (context) => const MyHomePage(),
        },
      ),
    );
  }
}
