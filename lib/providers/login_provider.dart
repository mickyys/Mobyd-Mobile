import 'dart:convert';

import 'package:hamp/util/constants.dart';
import 'package:http/http.dart' as http;

class LoginProvider{

  Future<Map<String, dynamic>> login(String email, String password, bool rememberMe) async {
    
    final headers = { 'Content-Type' : 'application/json' };
    final params  = { 'email' : email, 'password' : password };

    final resp = await http.post('$url/auth', headers: headers, body: json.encode(params));
    final data = json.decode(resp.body);

    if(resp.statusCode == 200){
      return { 'ok': true, 'token': data['token'] };
    }else{
      return { 'ok': false, 'mensaje': data['message'] };
    }
  }

}