import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab11/model/people.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../Provider/Provider.dart';

class SendAgain extends StatefulWidget {
  const SendAgain({Key? key}) : super(key: key);

  @override
  State<SendAgain> createState() => _Transaction();
}

class _Transaction extends State<SendAgain> {




  double transactionHistoryHeight=300.0;


  void _incrementhHeight() {
    setState(() {
      if(200<transactionHistoryHeight) {
        transactionHistoryHeight = 200;
      }else{
        transactionHistoryHeight =context.read<ProviderP>().list_people.length*70;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: new EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Text('Send Again',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
                TextButton(onPressed:_incrementhHeight
                    ,child:
                    Text('See all',
                      style:TextStyle(
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w400
                      ),)
                )
              ],
            ),



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:context.read<ProviderP>().list_people.map((t) {
        return
          Container(

            width: 60,
            height: 62,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('${t.img}'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          );

        }).toList(),
          ),

          ],
        )
    );
  }
}
