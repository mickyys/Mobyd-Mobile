import 'package:flutter/material.dart';
import 'package:hamp/pages/home_page.dart';
import 'package:hamp/pages/login_page.dart';
import 'package:hamp/pages/forgotPassword_page.dart';
import 'bloc/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
        title: 'Mobyd',
        debugShowCheckedModeBanner: false,
        initialRoute: 'login',
        routes: {
          'login'          : (BuildContext context) => LoginPage(),
          'forgotPassword' : (BuildContext context) => ForgotPasswordPage(),
          'home'           : (BuildContext context) => HomePage(),
        },
        theme: ThemeData(
          primaryColor: Colors.purple
        ),
      ),
    );
  }
}