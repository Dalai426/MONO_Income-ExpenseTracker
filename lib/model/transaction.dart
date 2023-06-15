import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Transaction {
  String? id;
  String? name;
  double? amount;
  DateTime? date;
  String? img;

  Transaction(
      {@required this.id,
      @required this.name,
      @required this.amount,
      @required this.date,
      @required this.img}
      );

  getAmount(){
    return amount;
  }
}
