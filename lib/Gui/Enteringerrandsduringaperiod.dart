import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

    class Enteringerrandsduringaperiod extends StatefulWidget {

      @override
      _EnteringerrandsduringaperiodState createState() => _EnteringerrandsduringaperiodState();
    }

    // ignore: camel_case_types
    class _EnteringerrandsduringaperiodState extends State<Enteringerrandsduringaperiod> {

      final _formKey = GlobalKey<FormState>();
      // String _password = '';
      // String _confirmPassword = '';
      bool _isObscure = true;
      String txt;
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: new AppBar(
              backgroundColor: Colors.deepPurple,
              title: new Text('Entering Errands During Aperiod Page')),

        );
      }
    }

