import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab11/WalletWidgets/AddYourDebit.dart';

import 'AccountsTab.dart';
import 'Transactions.dart';
import 'UpcomingBills.dart';

class WalletWidgetConnect extends StatefulWidget {
  const WalletWidgetConnect({super.key, required this.title});
  final String title;

  @override
  State<WalletWidgetConnect> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<WalletWidgetConnect> with SingleTickerProviderStateMixin {



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

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 1300,
          child:
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xFFF4F7F6),
                    borderRadius: BorderRadius.circular(40)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.all(3),
                      child: TabBar(
                        controller: tabController,
                        labelColor: Color(0xFF666666),
                        indicatorColor: Colors.white,
                        indicator: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        tabs: [
                          new Container(
                            height: 30.0,
                            // color: Colors.red,
                            child: new Tab(text: 'Cards'),
                          ),
                          new Container(
                            height: 30.0,
                            // color: Colors.red,
                            child: new Tab(text: 'Accounts'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30,),
        Container(
            height:450,
            child: TabBarView(
              controller: tabController,
              children: [
                AddYourDebitCard(),
                AccountsTab(),
              ],
            )
        ),
      ],
    );
  }
}
