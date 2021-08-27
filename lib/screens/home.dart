import 'package:flitill/models/mainCard.dart';
import 'package:flitill/models/scaled_list.dart';
import 'package:flitill/screens/favProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flitill/bloc/bloc.dart';
import 'package:flitill/bloc/states.dart';
import 'package:flitill/bloc/events.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:flitill/screens/products.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    //var degree = CounterBloc.get(context).counter.toString();
    return BlocBuilder(
      bloc: _counterBloc,
      builder: (BuildContext context, CounterState state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Michael Shop'),
            actions: [
              shoppingCart(
                CounterBloc.get(context).favProducts.length,
                () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => FavProducts()));
                },
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Products(urlChild: '/women\'s clothing')));
                    },
                    child: MyMainCard(
                      title: 'Women\'s clothing',
                      subtitle: 'ssss',
                      imgPath: "assets/images/woman.png",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Products(urlChild: '/men\'s clothing')));
                    },
                    child: MyMainCard(
                      title: 'Men\'s clothing',
                      subtitle: 'ssss',
                      imgPath: "assets/images/mens.png",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Products(urlChild: '/jewelery')));
                    },
                    child: MyMainCard(
                      title: 'Jewelery',
                      subtitle: 'ssss',
                      imgPath: "assets/images/jewellery.png",
                      moreSize: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              Products(urlChild: '/electronics')));
                    },
                    child: MyMainCard(
                      title: 'Electronics',
                      subtitle: 'ssss',
                      imgPath: "assets/images/Electronics.png",
                      moreSize: 40,
                    ),
                  ),
                  SizedBox(height: 50)
                  //ScaleListWidget(),
                ],
              ),
            ),
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

Widget shoppingCart(num, func) {
  return Stack(
    children: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        onPressed: func,
      ),
      Positioned(
        right: 8,
        top: 6,
        child: Container(
          height: 16,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.amber,
          ),
          child: Center(child: Text(' $num ')),
        ),
      )
    ],
  );
}
// Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       Text(
//         'City Name',
//         style: TextStyle(fontSize: 40),
//       ),
//       Text(
//         '$degree °C',
//         style: TextStyle(fontSize: 40),
//       ),
//       FlatButton(
//         onPressed: () {
//           CounterBloc.get(context).add(WeatherDegree());
//         },
//         child: Text('Change'),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(100.0),
//         child: TextField(
//           onChanged: (value) {},
//           //onSubmitted: ,
//           decoration: InputDecoration(
//             hintText: 'Enter a city',
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             suffixIcon: Icon(Icons.search),
//           ),
//         ),
//       ),
//       SizedBox(height: 1)
//     ],
//   ),
// ),
