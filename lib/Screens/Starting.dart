import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/Arguments.dart';
import 'package:lab11/widgets/BalanceCard.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:lab11/widgets/homepage.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';


// void main() {
//   runApp(const MonoStarting());
// }
//
// class MonoStarting extends StatelessWidget {
//   const MonoStarting({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const StartMono(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class StartMono extends StatefulWidget {
  const StartMono({super.key, required this.title});

  final String title;

  @override
  State<StartMono> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StartMono> {



  TextStyle style1=TextStyle(
    color: Color(0xFF438883),
    fontSize: 35,
    fontWeight:FontWeight.w700
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(

      child:Stack(
        alignment: Alignment.topCenter,
        children: [
          Image(
              image: AssetImage("img/Group 2.png"),),
    Container(
      margin: EdgeInsets.only(top: 110, right: 200),
      child:Image(
        image: AssetImage("img/Coint.png"),
        width: 70,
      ) ,
    ),

          Container(
            margin: EdgeInsets.only(top: 150, left: 180),
            child:Image(
              image: AssetImage("img/Donut.png"),
              width: 70,
            ) ,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height:110),
              Image(height: 400,image: AssetImage("img/Group 38.png")),

              Column(
                children: [
                  Text('Spend Smarter',
                      style: style1),
                  Text('Save More',
                    style: style1,),
                ],
              ),


    GestureDetector(
      
      onTap: (){
        Navigator.pushNamedAndRemoveUntil(context,'/home',(Route<dynamic> route) => false,arguments:Arguments(MyHome(title: "home"),0));
      },
      child:Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
        ),
        elevation: 7,
        shadowColor:Color(0xFF2F7E79),
        child: Container(

          width: 300,
          padding: EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF69AEA9),
                Color(0xFF3F8782),
              ],
            ),
          ),
            child:Text(
          'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
        )
        ),
      )
    ),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have Account ?',style: TextStyle(color: Color(0xff444444)),),
                  TextButton(onPressed: (){}, child:Text('Log in',style: TextStyle(color: Color(0xFF438883)),))
                ],
              ),
              SizedBox(height: 10,)



            ],
          )
        ],


      ),
      )
    );
  }
}


