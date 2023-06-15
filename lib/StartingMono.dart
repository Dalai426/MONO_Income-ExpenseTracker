import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/widgets/BalanceCard.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:lab11/widgets/homepage.dart';
import 'package:provider/provider.dart';

import 'Provider/Provider.dart';



// class StartingP extends StatelessWidget {
//   const StartingP({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     callDelay(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Start(title: 'Flutter Demo Home Page'),
//     );
//   }
//
//   Future callDelay(BuildContext context) async  {
//     await Future.delayed(const Duration( milliseconds: 3000), () {});
//     Navigator.pushNamed(context, '/start');
//   }
//
// }

class Start extends StatefulWidget {
  const Start({super.key, required this.title});

  final String title;

  @override
  State<Start> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Start> {

  @override
  Widget build(BuildContext context) {
    context.read<ProviderP>().fetchData();

    callDelay(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff69AEA9),
                    Color(0xff3F8782),
                  ],
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              )
          ),
          Text('mono',
            style: TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.w700

            ),)
        ],


      ),

    );
  }
  Future callDelay(BuildContext context) async  {
    await Future.delayed(const Duration( milliseconds: 2000), () {});
    Navigator.pushReplacementNamed(context,'/start');
  }
}


