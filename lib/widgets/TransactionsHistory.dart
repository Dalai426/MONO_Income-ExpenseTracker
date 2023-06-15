import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../model/transaction.dart';
import '../Provider/Provider.dart';

class HistoryTransaction extends StatefulWidget {
  const HistoryTransaction({Key? key}) : super(key: key);

  @override
  State<HistoryTransaction> createState() => _Transaction();
}

class _Transaction extends State<HistoryTransaction> {



  @override
  Widget build(BuildContext context) {

    return Padding(
    padding: new EdgeInsets.symmetric(horizontal: 20),
        child:Column(
      children: [
        Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text('Transactions history',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),),
            TextButton(onPressed:(){}
                ,child:
            Text('See all',
            style:TextStyle(
              color: Color(0xFF666666),
              fontWeight: FontWeight.w400
            ),)
            )
          ],
        ),

        Container(

          height: 225,
          child:SingleChildScrollView(
          child: Column(
            children: context.read<ProviderP>().transaction_items.map((t) {
              return  Padding(padding:new EdgeInsets.only(bottom: 10),
                  child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(

              children:[
                    Container(
                      padding: new EdgeInsets.all(10),
                      margin: new EdgeInsets.only(right: 20),

              child:ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
              '${t.img}',
              width: 25,
              ),
              ),
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFF0F6F5),
                      ),

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            t.name!,
                            style: TextStyle(
                              fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().format(t.date!),
                          style: TextStyle(color: Color(0xFF666666),
                          fontSize: 13,
                          ),
                        ),
                      ],
                    )
                      ]),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        t.amount! > 0 ? ' + \$ ${t.amount!.toStringAsFixed(2)}' : '- \$ ${(t.amount!*-1).toStringAsFixed(2)}'

                        ,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: () {
                            if (t.amount! < 0) {
                              return Color(0xFFF95B51); // green color for negative amounts
                            } else {
                              return Color(0xFF25A969); // blue color for positive amounts
                            }
                          }(),
                        ),
                      ),
                    ),
                  ],
              )
              );
            }).toList(),
          ),
        ),
        )
      ],
    )
    );
  }
}
