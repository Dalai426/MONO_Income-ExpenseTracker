


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

class BalanceCard extends StatelessWidget {




  TextStyle myTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  Color myColor = Color.fromRGBO(255, 255, 255, 0.15);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5, // set the elevation (depth) of the shadow
        shadowColor:Color(0xFF2F7E79) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
      color: Color(0xFF2F7E79),
        
        child:Padding(
          padding: new EdgeInsets.symmetric(horizontal: 20,vertical: 25),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Total Balance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                    fontWeight:FontWeight.w600

                ),
                ),
                Icon(Icons.keyboard_arrow_up,
                color: Colors.white,)
              ],
            ),
            Text(
                '\$${context.read<ProviderP>().balance.toStringAsFixed(2)}',
              style: myTextStyle
            ),
            SizedBox(height: 20,)
            ,
            Row(

              children: <Widget>[
                Flexible(
                  flex: 1,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: new EdgeInsets.only(right: 10),
                          padding: new EdgeInsets.all(5),
                            child:Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            size: 15,
                            ),
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color:myColor
                          ),
                        )
                        ,Text('Income',
                        style: TextStyle(
                          color: Colors.white
                              ,
                            fontSize: 16
                            ,
                            fontWeight:FontWeight.w300
                        ),)
                      ],
                    ),
                    Text('\$${context.read<ProviderP>().income.toStringAsFixed(2)}',
                    style:TextStyle(
                      color:Colors.white,
                        fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                )
                ),
                Flexible(
                    flex: 1,
                    child:Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        Container(
                            padding: new EdgeInsets.all(5),
                            margin: new EdgeInsets.only(right: 10),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color:myColor
                            ),
                            child:Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                                size: 15)
                        )
                        ,Text('Expenes',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            fontWeight:FontWeight.w300
                          ),)
                      ],
                    ),

                    Text('\$${context.read<ProviderP>().exp.toStringAsFixed(2)}',
                    style: TextStyle(
                      color:Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                )
                )
              ],
            )
          ]
        )
        )
    );
  }
}