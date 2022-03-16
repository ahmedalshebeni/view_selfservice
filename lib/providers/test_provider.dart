
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_selfservice/model/edited.dart';
import 'package:view_selfservice/model/models.dart';
import 'package:view_selfservice/shared/share.dart';




class TestProvider with ChangeNotifier{

  String _ipaaddress;
  String _username;
  String _password;
  String _userLogin;
  String _passwordLogin;
  String _org;
  String _comp;
  String _branch;
  List<orgs> selectedItem=[orgs("org_id", "group_name")] ;
  // List<orgs> allItems = [];
  String  get ipaaddress{
    return _ipaaddress;
  }

  String get username{
    return _username;
  }

  String  get password{
    return _password;
  }

  String get userlogin{
    return _userLogin;
  }

  String  get passwordlogin{
    return _passwordLogin;
  }

  // String  get org{
  //   return _org;
  // }
  //
  // String get comp{
  //   return _comp;
  // }
  //
  // String  get branch{
  //   return _branch;


  // }
  orgs itemss;

  setItem(orgs item,int index){
    selectedItem[index]=item;
    itemss=item;
    // getorgs();

    notifyListeners();

  }
  //
  // getorgs() async {
  //
  //   http.Response _res = await http.get(
  //       "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27$userlogin%27)%20order%20by%20org_id"
  //   );
  //
  //   Map<String, dynamic> _data = json.decode(_res.body);
  //
  //   _data['data'].forEach((i) {
  //     orgs _newItem = orgs(i['item_id'], i['item_name']);
  //       allItems.add(_newItem);
  //   });
  //   selectedItem[0]=allItems[0];
  //   selectedItem.add(allItems[0]);
  //   notifyListeners();
  // }



  // Future<dynamic> getDataInfo() async {
  //   var address,name,password,userlogin,passwordlogin;
  //
  //   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.getString('address');
  //   sharedPreferences.getString('name');
  //   sharedPreferences.getString('password');
  //   sharedPreferences.getString('userlogin');
  //   sharedPreferences.getString('passwordlogin');
  //
  //   try {
  //
  //     var response = await http.get(
  //       // "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27view%27)%20order%20by%20org_id"
  //       // "http://41.32.222.242/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27view%27)%20order%20by%20org_id"
  //         "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select%20org_id,decode(1,2,eorg_name,org_name)%20group_name%20from%20orgs%20where%20org_id%20in%20(select%20%20org_id%20from%20user_org%20where%20user_name%20=%20%27$userlogin%27)%20order%20by%20org_id"
  //     );
  //     // debugPrint("address:;"+address);
  //     //   var res = await http.get(
  //     //       "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20comp_code,decode(1,2,ecomp_name,comp_name)%20comp_name%20from%20company%20where%20comp_code%20in(select%20comp_code%20from%20user_comp%20where%20user_name=%27view%27%20and%20org_id=1)and%20org_id=1%20order%20by%20comp_code");
  //     //   var resp = await http.get(
  //     //       "http://$ipaaddress/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20%20branch_code,decode(1,2,ebranch_name,branch_name)%20branch_name%20from%20branches%20where%20org_id=1%20and%20comp_code=1%20and%20branch_code%20in%20(select%20branch_code%20from%20user_branch%20where%20user_name=%27view%27%20and%20org_id=1%20and%20comp_code=1%20)order%20by%20branch_code");
  //     payload = payloadFromJson(response.body);
  //     debugPrint(response.body);
  //
  //     // dynamic v= Provider.of<TestProvider>(context, listen: false).getIp(address,context);
  //     // debugPrint(v);
  //     //   payload2 = payloadFromJson(res.body);
  //     //   payload3 = payloadFromJson(resp.body);
  //
  //     return 'success';
  //   }
  //   catch (err) {
  //     debugPrint(err);
  //     throw err;
  //   }
  // }


  Future<void> getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('address')){
     return;
    }
    _ipaaddress= prefs.getString("address");
    notifyListeners();
    debugPrint ("addres :" + _ipaaddress);

     if(!prefs.containsKey('name')){
return;
    }
    _username = prefs.getString('name');
    debugPrint("user :" +_username);
    notifyListeners();

    if(!prefs.containsKey('password')){
      return;
    }
    _password= prefs.getString("password");
    notifyListeners();
    debugPrint ("password :" + _password);

    if(!prefs.containsKey('userlogin')){
      return;
    }
    _userLogin= prefs.getString("userlogin");
    notifyListeners();
    debugPrint ("userlogin :" + _userLogin);

    if(!prefs.containsKey('passwordlogin')){
      return;
    }
    _passwordLogin= prefs.getString("passwordlogin");
    notifyListeners();
    debugPrint ("passwordlogin :" + _passwordLogin);

    // if(!prefs.containsKey('org')){
    //   return;
    // }
    // _org= prefs.getString("org");
    // notifyListeners();
    // debugPrint ("org :" + _org);
    //
    // if(!prefs.containsKey('comp')){
    //   return;
    // }
    // _comp= prefs.getString("comp");
    // notifyListeners();
    // debugPrint ("comp :" + _comp);
    //
    //
    // if(!prefs.containsKey('branch')){
    //   return;
    // }
    // _branch= prefs.getString("branch");
    // notifyListeners();
    // debugPrint ("branch :" + _branch);



  }


 Future<void> setpref(String address,String name,String password ,String userlogin,String passwordlogin
     // ,String org,String comp ,String branch
     )async {
   _ipaaddress=address;
   _username=name;
   _password=password;
   _userLogin=userlogin;
   _passwordLogin =passwordlogin;
   // _org=org;
   // _comp=comp;
   // _branch=branch;
   notifyListeners();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('address', address);
   sharedPreferences.setString('name', name);
   sharedPreferences.setString('password', password);
   sharedPreferences.setString('userlogin', userlogin);
   sharedPreferences.setString('passwordlogin', passwordlogin);
   // sharedPreferences.setString('org', org);
   // sharedPreferences.setString('comp', comp);
   // sharedPreferences.setString('branch', branch);


}


Future<void>logout()async{
  _ipaaddress = null;
  _username = null;
  _password=null;
  _userLogin=null;
  _passwordLogin=null;
  notifyListeners();
  final pref = await   SharedPreferences.getInstance();

  pref.clear();
notifyListeners();
}


getdata(String  adress, String name,String password ,String userlogin ,String passwordlogin
    // ,String org ,String comp,String branch
    ) async {
      String url =
          'http://$adress/php_rest_myblog/api/data/dyn_sel.php?user=$userlogin&password=$passwordlogin&select=select count(*) from hr_emp where emp_id=$name and v_flex10=$password';
      http.Response response = await http.get(url);
      // debugPrint ("password:"+password +"adress"+adress+"name" +name +"userlogin"+userlogin+"passwordlogin"+passwordlogin);
      debugPrint(url);
      return json.decode(response.body);
    }


// getsysdate(String adress,String userlogin,String passwordlogin) async {
//       String date =
//            'http://$adress/php_rest_myblog/api/data/dyn_sel.php?user=view&password=1&select=select%20sysdate%20from%20dual';
//       http.Response response = await http.get(date);
//       return json.decode(response.body);
//     }

// ignore: missing_return


Future<String> onLogin( String address,String name,String password,String userlogin,String passwordlogin
    // , String org, String comp,String branch,
   , BuildContext context ) async {
      Map datamap = await getdata(address, name,password,userlogin,passwordlogin
          // ,org,comp,branch
      );
      // Map datemap = await getsysdate(address,userlogin,passwordlogin);
      String check = datamap["data"][0]["count(*)"];
      // String chkdate = datemap["data"][0]["sysdate"];
      debugPrint(check);
      // debugPrint(chkdate);
          if (check != '0' ) {
             await setpref(address, name,password,passwordlogin,userlogin
                 // ,org,comp,branch
             );
          // Navigator.of(context).pushNamed('/main');
          // Navigator.pushReplacementNamed(context, '/Second');
        }
          else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invalid Id or Password..', style: TextStyle(color: Colors.white))));

          }

    }








}
