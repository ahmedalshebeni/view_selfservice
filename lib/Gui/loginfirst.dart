import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_selfservice/model/models.dart';
import 'package:view_selfservice/providers/test_provider.dart';
import 'package:view_selfservice/shared/Services.dart';
import 'package:view_selfservice/shared/share.dart';


class first extends StatefulWidget {
  @override
  firstState createState() => firstState();
}

TextEditingController ipaddress = TextEditingController();
TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController userlogin = TextEditingController();
TextEditingController passwordlogin = TextEditingController();

class firstState extends State<first> {

dynamic orgs;

  // void getsharedData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString('address') == null&&prefs.getString('name') == null&&prefs.getString('password') == null
  //       &&prefs.getString('userlogin') == null&&prefs.getString('passwordlogin') == null) {
  //     setState(() async {
  //       try {
  //          orgs = await http.get(
  //             "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27$userlogin%27)%20order%20by%20org_id"
  //         );
  //         payload = payloadFromJson(orgs.body);
  //         debugPrint(orgs.body);
  //         return 'success';
  //       }
  //       catch (err) {
  //         debugPrint(err);
  //         throw err;
  //       }
  //
  //           // DateTime.tryParse(prefs.getString('attendData'));
  //     });
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getsharedData();
  // }

  bool isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      getData().then((value) {
        debugPrint(value);
        setState(() {
          isInit = false;
        });
      });
    }
    super.didChangeDependencies();
  }
 // @override
 //  void initState() {
 //    // TODO: implement initState
 //   setState(() {
 //     isInit=false;
 //   });
 //    super.initState();
 //  }



  @override
  Widget build(BuildContext context) {
    return
      Consumer<TestProvider>(
          builder: (context, testProvider, child) =>
      Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple, title: const Text('first Page')),
      body:
      isInit
          ? Center(child: CircularProgressIndicator())
          :
      SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      child:   Column(
                        children: [
                          TextField(
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple),
                            controller: ipaddress,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.deepPurple,
                                  size: 15.0,
                                ),
                                hintText: 'Ip address:'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple),
                            controller: userlogin,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.deepPurple,
                                  size: 15.0,
                                ),
                                hintText: ' User Name:'),
                            keyboardType: TextInputType.text,

                          ),
                          TextField(
                            style: const TextStyle(
                                fontSize: 15.0, color: Colors.deepPurple),
                            controller: passwordlogin,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                  size: 15.0,
                                ),
                                hintText: 'User Password:'),
                            obscureText: true,
                          ),
                          TextField(
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple),
                            controller: userController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.deepPurple,
                                  size: 15.0,
                                ),
                                hintText: ' User Login:'),
                            keyboardType: TextInputType.number,
                          ),
                          TextField(
                            style: const TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple),
                            controller: passwordController,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                  size: 10.0,
                                ),
                                hintText: 'Password Login:'),
                            obscureText: true,
                          ),
                          // if (orgs == null )

                          Container(
                            child: DropdownButton<dynamic>(
                              //isDense: true,
                              hint: Text('ChooseOrg'),
                              value: dropdownValue,
                              isExpanded: true,
                              icon: Icon(Icons.check_circle_outline),
                              iconSize: 15,
                              // elevation: 15,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.blue[300],
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  debugPrint(dropdownValue.org_id);
                                  debugPrint(ipaddress.text);
                                }
                                );
                              },
                              items: payload.data
                                  .map<DropdownMenuItem<Datum>>((value) {
                                return DropdownMenuItem<Datum>(
                                    value: value,
                                    child: Text(' ${value.group_name}'));
                              }).toList(),
                            ),
                          ),

                          Container(
                            child: DropdownButton<Datum>(
                              hint: Text('ChooseCompany'),
                              value: dropdownValue2,
                              isExpanded: true,
                              icon: Icon(Icons.check_circle_outline),
                              iconSize: 15,
                              // elevation: 5,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.blue[300],
                              ),
                              onChanged: (Datum newValue) {
                                setState(() {
                                  dropdownValue2 = newValue;
                                  debugPrint(dropdownValue2.comp_code);
                                });
                              },
                              items: payload2.data
                                  .map<DropdownMenuItem<Datum>>((Datum value) {
                                return DropdownMenuItem<Datum>(
                                    value: value,
                                    child: Text(' ${value.comp_name}'));
                              }).toList(),
                            ),
                          ),
                          Container(
                            child: DropdownButton<Datum>(
                              //isDense: true,
                              hint: Text('Choose.Branch'),
                              value: dropdownValue3,
                              isExpanded: true,
                              icon: Icon(Icons.check_circle_outline),
                              iconSize: 15,
                              elevation: 16,
                              style: TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.blue[300],
                              ),
                              onChanged: (Datum newValue) {
                                setState(() {
                                  dropdownValue3 = newValue;
                                  debugPrint(dropdownValue3.branch_code);
                                });
                              },
                              items: payload3.data
                                  .map<DropdownMenuItem<Datum>>((Datum value) {
                                return DropdownMenuItem<Datum>(
                                    value: value,
                                    child: Text(' ${value.branch_name}'));
                              }).toList(),
                            ),
                          ),
                          // dropbox(),
                        ],
                      ),
                    ),
                      ],
              ),
            ),
      bottomNavigationBar: ElevatedButton(
          onPressed:

              ()async
          {
         // await getData(context);
            // debugPrint("userlogin:"+userlogin.text);
            // debugPrint("userpassword:"+passwordlogin.text);
            // Provider.of<TestProvider>(context, listen: false).getIp(ipaddress.text,context);
            Provider.of<TestProvider>(context, listen: false).onLogin(
                          ipaddress.text,
                         userController.text,
                          passwordController.text,
                          userlogin.text,
                          passwordlogin.text,
                          // dropdownValue.org_id,
                          // dropdownValue2.comp_code,
                          // dropdownValue3.branch_code,
                          context);
            // Navigator.of(context).pushNamed('/First');
            debugPrint(ipaddress.text);
          },
          child: Text("Login")
      ),
    )
      );
  }
}
