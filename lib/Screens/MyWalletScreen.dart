import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab11/WalletWidgets/Wallet.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:lab11/widgets/homepage.dart';

import '../Navigation.dart';




class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key, required this.title});
  final String title;

  @override
  State<MyWalletScreen> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletScreen> with SingleTickerProviderStateMixin {




  late TabController tabController;
  @override
  void initState(){
    tabController=TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Column(
        children: <Widget>[
          SizedBox(height:80,)
          ,
          
          Padding(padding: EdgeInsets.symmetric(horizontal: 20),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [



              GestureDetector(onTap: (){

                Navigator.pop(context);
              },
                child: Icon(Icons.arrow_back_ios_new,
                  size: 17,
                  color: Colors.white,),
              ),
              Text("Wallet",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17
                ),),
              CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.06),
                  child:IconButton(

                    onPressed:(){},
                    icon:Icon(Icons.add_alert_rounded,
                      color: Colors.white,),
                    // color: Color.fromRGBO(255, 255, 255, 0.06),
                    padding: new EdgeInsets.all(5),
                  )
              )
            ],
          ),),
          SizedBox(
            height: 50,
          )
          ,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              color: Colors.white,
            ),

           padding: EdgeInsets.symmetric(horizontal: 0, vertical: 40),
           child:WalletWidget1(title: 'Wallet1',)
          )
          
        ]
      );
  }
}


