import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/widgets/BalanceCard.dart';
import 'package:lab11/widgets/SendAgain.dart';
import 'package:lab11/widgets/TransactionsHistory.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

import 'package:http/http.dart' as http;

import '../model/transaction.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.title});

  final String title;

  @override
  State<MyHome> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHome> {
  var getGreeting = () {
    final now = DateTime.now();
    final formatter = DateFormat('HH');
    final hour = int.parse(formatter.format(now));

    String greeting;

    if (hour < 12) {
      greeting = 'Good morning,';
    } else if (hour < 18) {
      greeting = 'Good afternoon,';
    } else {
      greeting = 'Good evening,';
    }

    return greeting;
  };

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 80,
      ),
      Padding(
          padding: new EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getGreeting(),
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    '${context.read<ProviderP>().name}',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.06),
                  child: IconButton(
                    onPressed: () {
                      context.read<ProviderP>().addTransaction(Transaction(
                          id: '1',
                          name: 'Upwork',
                          amount: 850.00,
                          date: DateTime.now(),
                          img: "img/image 13.png"));
                    },
                    icon: Icon(
                      Icons.add_alert_rounded,
                      color: Colors.white,
                    ),
                    // color: Color.fromRGBO(255, 255, 255, 0.06),
                    padding: new EdgeInsets.all(5),
                  ))
            ],
          )),
      BalanceCard(),
      Container(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [HistoryTransaction(), SendAgain()],
          ),
        ),
      )
    ]);
  }
}
