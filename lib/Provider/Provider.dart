import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:lab11/model/transaction.dart';

import '../model/Bills.dart';
import '../model/people.dart';
import 'package:http/http.dart' as http;

import 'Database.dart';

class ProviderP with ChangeNotifier, DiagnosticableTreeMixin {
  var _userid = "";
  var _name = "";
  var _balance = 0.0;
  var _income = 0.0;
  var _exp = 0.0;
  final List<Transaction> list_transaction = [];
  final List<People> list_people = [];
   List<Bills> bills = [];
  var paying_bill = null;
  int ind = -1;

  String cardNumber = '****    ****    ****    ****';
  String cardHolderName = '';
  String cvvNumber = '';
  String expiryDate = '';
  String zip = '';
  bool showBackView = false;

  final url_user = Uri.https(
      'monotran-default-rtdb.asia-southeast1.firebasedatabase.app',
      'user.json');

  DAO dao = new DAO();

  ProviderP() {
    print("onprovider");
    list_people.addAll([
      People(img: "img/image 7 (1).png"),
      People(img: "img/image 8.png"),
      People(img: "img/image 9.png"),
      People(img: "img/image 10.png"),
      People(img: "img/image 11.png"),
    ]);
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(url_user);
      if (response.statusCode == 200) {
        final Map<String, dynamic> user = jsonDecode(response.body);
        _userid = user.keys.first;
        _name = user[_userid]['name'];
        _balance = user[_userid]['balance'];

        if(user[_userid]['Upcomingbills']!=null){
          Map<String, dynamic> billsData = user[_userid]['Upcomingbills'];
          bills.clear();
          billsData.forEach((key, element) => {
            bills.add(Bills(
              amount: element['amount'],
              date: new DateFormat("yyyy-MM-dd")
                  .parse(element['date'].replaceAll(',', '')),
              id: key,
              img: element['img'],
              name: element['name'],
            ))
          });

        }

        if(user[_userid]['Transaction']!=null){
          Map<String, dynamic> transaction = user[_userid]['Transaction'];
          list_transaction.clear();
          transaction.forEach((key, element) => {
            list_transaction.add(Transaction(
              amount: element['amount'],
              date: new DateFormat("yyyy-MM-dd")
                  .parse(element['date'].replaceAll(',', '')),
              id: key,
              img: element['img'],
              name: element['name'],
            )),
            print(element)
          });
          _income=0;
          _exp = 0;
          calculateInExp();
        }
        // notifyListeners();
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<List<Bills>> fetchBills() async {
    List<Bills>billsa=[];
    try {
      final url_bills = Uri.https('monotran-default-rtdb.asia-southeast1.firebasedatabase.app','user/${_userid}/Upcomingbills.json');
      final response = await http.get(url_bills);
      if (response.statusCode == 200){
        final Map<String,dynamic> billsData = jsonDecode(response.body);
        print(billsData);
        billsData.forEach((key,element)=>{
          billsa.add(Bills(
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
    return billsa;
  }

  Future<List<Transaction>> fetchTransactions() async {
    List<Transaction>trans=[];
    try {
      final url_bills = Uri.https('monotran-default-rtdb.asia-southeast1.firebasedatabase.app','user/${_userid}/Transaction.json');
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


  List<Transaction> get transaction_items => list_transaction;

  List<People> get list_peoples => list_people;

  List<Bills> get list_bills => bills;

  get balance => _balance;

  get name => _name;

  get income => _income;

  get exp => _exp;

  get payingbill => paying_bill;
  get id=>_userid;


  void addTransaction(Transaction t) {
    final url_tran = Uri.https(
        'monotran-default-rtdb.asia-southeast1.firebasedatabase.app',
        'user/${_userid}/Transaction.json');

    http.post(url_tran,
        body: json.encode({
          'id': t.id,
          'name': t.name,
          'amount': t.amount,
          'date': (t.date.toString()!),
          'img': t.img
        })).then((value) =>{
          t.id=jsonDecode(value.body)["name"],
      transaction_items.add(t),
      calculateInExp(),
      notifyListeners()
    });
  }

  void addInvoice(Bills b) {
    var url_bills = Uri.https(
        'monotran-default-rtdb.asia-southeast1.firebasedatabase.app',
        'user/${_userid}/Upcomingbills.json');
    http.post(url_bills,
        body: json.encode({
          'id': b.id,
          'name': b.name,
          'amount': b.amount,
          'date': (b.date.toString()!),
          'img': b.img
        })).then((value) =>{
          b.id=jsonDecode(value.body)["name"],
      bills.add(b),
      notifyListeners()
    });
  }


  updateBills(List<Bills>a){
    this.bills=a;
    notifyListeners();
  }

  calculateInExp() {
    _exp=0;
    _income=0;
    list_transaction.forEach((e) {
      if (e.amount! < 0) {
        _exp += e.amount! * -1;
      } else {
        _income += e.amount!;
      }
    });
  }

  setPayingBillPaymentMethod(String method) {
    paying_bill.paymentmethod = method;
    notifyListeners();
  }

  void setPay(Bills b) {
    paying_bill = new PayingBills();
    paying_bill.id = b.id;
    paying_bill.name = b.name;
    paying_bill.amount = b.amount;
    paying_bill.setImage(b.img as String);
    paying_bill.fee = b.amount! * 16.59 / 100;
    paying_bill.total = b.amount! + paying_bill.fee!;
    paying_bill.date = DateTime.now();
    print(paying_bill.amount);
    print(paying_bill.name);
    ind =bills.indexOf(b);
    notifyListeners();
  }

  Future<void> paymentSuccesfully() async {
    Transaction t = new Transaction(
        id: paying_bill.id,
        name: paying_bill.name,
        amount: -1.0 * (paying_bill.total),
        date: paying_bill.date,
        img: paying_bill.img);
    addTransaction(t);
    _balance = _balance - paying_bill.total;

    final balance_url = Uri.https(
        'monotran-default-rtdb.asia-southeast1.firebasedatabase.app',
        'user/${_userid}.json');

    http.patch(balance_url,
        body: json.encode({
          'balance':_balance,
        })
    ).then((value) => {
      print(value.body),
      _balance=jsonDecode(value.body)["balance"],
      notifyListeners()
    });

    final delete_url = Uri.https(
        'monotran-default-rtdb.asia-southeast1.firebasedatabase.app',
        'user/${_userid}/Upcomingbills/${paying_bill.id}.json');


    http.delete(delete_url).then((response) =>{
    if (response.statusCode != 200) {
        throw Exception('Failed to delete bill.')
      }else{
      print(response.body)
    }
    });

    if (ind != -1) {
      bills.removeAt(ind);
    }
    ind = -1;
  }

  void payingBillNull() {
    paying_bill = null;
  }


  setCard(){
    var url_bills = Uri.https('monotran-default-rtdb.asia-southeast1.firebasedatabase.app', 'user/${_userid}/Card.json');
    http.patch(url_bills,
        body: json.encode({
          'cardname': cardHolderName,
          'cardnumber': cardNumber.replaceAll(" ",''),
          'cvvnumber': cvvNumber,
          'date': expiryDate,
          'zip':zip
        }));
  }


  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}


// addTransaction(Transaction(
// id: '1',
// name: 'Upwork',
// amount: 850.00,
// date: DateTime.now(),
// img:"img/image 13.png"
//
// ));
// addTransaction(Transaction(
// id: '2',
// name: 'Transfer',
// amount: -85,
// date: DateTime.now(),
// img:"img/image 7 (1).png"
// ));
// addTransaction(Transaction(
// id: '3',
// name: 'Paypall',
// amount: -3.99,
// date: DateTime.now(),
// img:"img/image 5.png"
// ));
// addTransaction(Transaction(
// id: '4',
// name: 'Youtube',
// amount: 4.99,
// date: DateTime.now(),
// img:"img/image 6.png"
// ));

