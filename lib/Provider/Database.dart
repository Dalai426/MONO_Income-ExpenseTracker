import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lab11/model/transaction.dart';

import '../model/Bills.dart';


class DAO{



  // static List<Bills>?getBills(){
  //
  //   return null;
  // }



  Future<List<Transaction>> getTrans(id) async {
    List<Transaction>trans=[];
    try {
      final url_bills = Uri.https('monotran-default-rtdb.asia-southeast1.firebasedatabase.app','user/${id}/Transaction.json');
      final response = await http.get(url_bills);
      if (response.statusCode == 200){
        final Map<String,dynamic> billsData = jsonDecode(response.body);
        billsData.forEach((key,element)=>{
          trans.add(Transaction(
            amount:element['amount'],
            date: new DateFormat("yyyy-MM-dd").parse(element['date'].replaceAll(',', '')),
            id: key,
            img: element['img'],
            name: element['name'],
          ))
        });
      }
    } catch (error) {
      throw (error);
    }
    return trans;
  }


}