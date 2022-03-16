import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class LoansTransaction extends StatefulWidget {
  @override
  _LoansTransactionState createState() => _LoansTransactionState();
}

// ignore: camel_case_types
class _LoansTransactionState extends State<LoansTransaction> {


  Future<void> getin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Loans Transaction Page'),
      ),
      body:  Center(
              child: Container(
                padding: EdgeInsets.all(50.50),
                margin: EdgeInsets.only(right: 40.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'img/viewsoft.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed:
                              getin,
                          child: const Text("تسجيل الحضور"),
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
