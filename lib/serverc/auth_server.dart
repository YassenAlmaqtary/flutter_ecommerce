import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';


class Network{

 final String _url= url+"api";
  var token;

 Future _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    if(localStorage.getString('token').isNotEmpty)
    token= jsonDecode(localStorage.getString('token'));
  }


 Future authData(data, apiUrl) async {
    String fullUrl = _url + apiUrl;
     //await _getToken();
     return await http.post(
      fullUrl,
       body:data,
       // headers: _setHeaders()
    );

  }


 Future getData({apiUrl}) async {
   var fullUrl = _url + apiUrl;
    await _getToken();
   return await http.get(
       fullUrl,
       headers: _setHeaders()
   );
 }



 Future cheekTokrn(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(
        fullUrl,
        headers: _setHeaders()
    );
  }


 Map<String,String> _setHeaders() => {
    'auth-token': '$token',
    'Authorization' : 'Bearer $token'
  };


}




