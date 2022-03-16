import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_selfservice/model/models.dart';
import 'package:view_selfservice/providers/test_provider.dart';

// ignore: non_constant_identifier_names
var name;
var pass;
Payload payload;
bool isInit = true;
Payload payload2;
Payload payload3;
Datum dropdownValue;
Datum dropdownValue2;
Datum dropdownValue3;

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());


popinfo(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('تم تسجيل الحضور'),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

pop(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('تم تسجيل الحضورمن قبل'),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

popinfoend(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('تم تسجيل الانصراف'),
    action: SnackBarAction(
      label: 'ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


Future<dynamic> getData() async {
  var address,name,password,userlogin,passwordlogin;

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getString('address');
  sharedPreferences.getString('name');
  sharedPreferences.getString('password');
  sharedPreferences.getString('userlogin');
  sharedPreferences.getString('passwordlogin');

  try {

    var response = await http.get(
      "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27view%27)%20order%20by%20org_id"
      // "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27view%27)%20order%20by%20org_id"
      //   "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27$userlogin%27)%20order%20by%20org_id"
    );
    // debugPrint("address:;"+address);
      var res = await http.get(
          "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20comp_code,decode(1,2,ecomp_name,comp_name)%20comp_name%20from%20company%20where%20comp_code%20in(select%20comp_code%20from%20user_comp%20where%20user_name=%27view%27%20and%20org_id=1)and%20org_id=1%20order%20by%20comp_code");
      var resp = await http.get(
          "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20%20branch_code,decode(1,2,ebranch_name,branch_name)%20branch_name%20from%20branches%20where%20org_id=1%20and%20comp_code=1%20and%20branch_code%20in%20(select%20branch_code%20from%20user_branch%20where%20user_name=%27view%27%20and%20org_id=1%20and%20comp_code=1%20)order%20by%20branch_code");
    payload = payloadFromJson(response.body);
    debugPrint(response.body);

    // dynamic v= Provider.of<TestProvider>(context, listen: false).getIp(address,context);
    // debugPrint(v);
      payload2 = payloadFromJson(res.body);
      payload3 = payloadFromJson(resp.body);

    return 'success';
  }
  catch (err) {
    debugPrint(err);
    throw err;
  }
}
