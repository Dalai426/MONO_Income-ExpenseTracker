import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab11/Navigation.dart';
import 'package:lab11/Provider/Provider.dart';
import 'package:lab11/Screens/AddExpenceScreen.dart';
import 'package:lab11/Screens/MyWalletScreen.dart';
import 'package:lab11/widgets/homepage.dart';
import 'package:provider/provider.dart';

import '../Arguments.dart';




class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});
  final String title;
  @override
  State<MyHomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeScreen> {


  int currenTab=0;
  
  
  
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Arguments;
    currenTab=args.current;
    Gradient myGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1.0],
      colors: [
        Color(0xFF429690),
        Color(0xFF2A7C76),
      ],
      transform: GradientRotation(138.73 * 3.14 / 180),
    );

    return Scaffold(
      body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: myGradient,
                  borderRadius:BorderRadius.only(
                      bottomLeft: Radius.elliptical(200,20),
                      bottomRight: Radius.elliptical(200,20)
                  )
              ),
              height: MediaQuery.of(context).size.height<800?MediaQuery.of(context).size.height/2:MediaQuery.of(context).size.height/3,
              //   width: MediaQuery.of(context).size.width,
              //
              // child:Stack(
              //   children: [
              //     Container(
              //       width: 150,
              //       decoration: BoxDecoration(
              //         shape: BoxShape.circle,
              //         border: Border.all(
              //           width: 15.0,
              //           color: Color.fromRGBO(255, 255, 255, 0.1),
              //         ),
              //       ),
              //
              //     ),
              //   ],
              // )
            )
            ,

            Container(

                height:150,
                margin: EdgeInsets.only(top: 50),
                child:Image(image: AssetImage("img/Ellipse 7.png")
                ))
            ,
            Container(
                height:100,
                margin: EdgeInsets.only(left: 50,top: 20),
                child:Image(image: AssetImage("img/Ellipse 8.png")
                ))
            ,
            Container(
                height:60,
                margin:EdgeInsets.only(left: 110),
                child:Image(image: AssetImage("img/Ellipse 9.png")
                ))
            ,
            SingleChildScrollView(
                child:args.wid,
              ),
          ]
      ),



      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child:getNavbarElement()
        ),
      ),
      floatingActionButton: currenTab == 0
          ? FloatingActionButton(
        backgroundColor: Color(0xFF438883),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),2));
        },
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }



  getNavbarElement(){
    if( MediaQuery.of(context).size.height>900 || currenTab==0){
      return Row(
          mainAxisAlignment: currenTab==0?MainAxisAlignment.spaceBetween:MainAxisAlignment.spaceEvenly,
          children:[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context,'/home',(Route<dynamic> route) => false,arguments:Arguments(MyHome(title: "home"),0));
                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image:AssetImage(currenTab==0?"img/home (1).png":"img/home.png"),
                        width: 25,)
                    ],
                  ),),
                MaterialButton(onPressed: (){
                  Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),1));
                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image:AssetImage(currenTab==1?"img/graph (1).png":"img/graph.png"),
                        width: 25,)
                    ],
                  ),)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(onPressed: (){
                  Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),2));

                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image:AssetImage(currenTab==2?"img/wallet (1).png":"img/wallet.png"),
                        width: 25,)
                    ],
                  ),),
                MaterialButton(onPressed: (){
                  Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),3));
                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image:AssetImage(currenTab==3?"img/user (2).png":"img/user (1).png"),
                        width: 25,)
                    ],
                  ),)
              ],
            ),
          ]
      );
    }else{
      return
        Row(
            mainAxisAlignment: currenTab==0?MainAxisAlignment.spaceBetween:MainAxisAlignment.spaceEvenly,
            children:[
              MaterialButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context,'/home',(Route<dynamic> route) => false,arguments:Arguments(MyHome(title: "home"),0));
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image:AssetImage(currenTab==0?"img/home (1).png":"img/home.png"),
                      width: 25,)
                  ],
                ),),
              MaterialButton(onPressed: (){
                Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),1));
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image:AssetImage(currenTab==1?"img/graph (1).png":"img/graph.png"),
                      width: 25,)
                  ],
                ),),

              MaterialButton(onPressed: (){
                Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),2));

              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image:AssetImage(currenTab==2?"img/wallet (1).png":"img/wallet.png"),
                      width: 25,)
                  ],
                ),),
              MaterialButton(onPressed: (){
                Navigator.pushNamed(context,'/home',arguments:Arguments(AddExpenceScreen(title: "home"),3));
              },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image:AssetImage(currenTab==3?"img/user (2).png":"img/user (1).png"),
                      width: 25,)
                  ],
                ),)

            ]
        );
    }
  }
}


