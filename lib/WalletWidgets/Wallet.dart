import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab11/WalletWidgets/UpcomingBills.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:lab11/widgets/homepage.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
import 'Transactions.dart';




class WalletWidget1 extends StatefulWidget {
  const WalletWidget1({super.key, required this.title});
  final String title;

  @override
  State<WalletWidget1> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<WalletWidget1> with SingleTickerProviderStateMixin {


  int currentElement=2;

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
              children: [
                Text('Total Balance',
                  style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight:FontWeight.w400
                  ),),
                SizedBox(height: 10,),
                Text('\$${context.read<ProviderP>().balance.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 30,
                      fontWeight:FontWeight.w600
                  ),),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            child:Image(
                                height: 50,image: AssetImage("img/Frame 21.png")) ,
                          ),
                          SizedBox(height: 5,)
                          ,
                          Text('Add')
                        ],
                      ),),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            child:Image(
                                height: 50,image: AssetImage("img/Frame 21 (1).png")) ,
                          ),
                          SizedBox(height: 5,)
                          ,
                          Text('Pay')
                        ],
                      ),),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            child:Image(
                                height: 50,image: AssetImage("img/Frame 21 (2).png")) ,
                          ),
                          SizedBox(height: 5,)
                          ,
                          Text('Send')
                        ],
                      ),)

                  ],
                ),
                SizedBox(height: 30,),
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
                                  child: new Tab(text: 'Transactions'),
                                ),
                                new Container(
                                  height: 30.0,
                                  // color: Colors.red,
                                  child: new Tab(text: 'Upcoming Bills'),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,)
                ,
                Container(
                    height: 260,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        TransactionW(),
                        UpComingBill(),
                      ],
                    )
                )

              ],
    );
  }
}


