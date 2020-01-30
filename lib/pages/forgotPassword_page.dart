import 'package:flutter/material.dart';
import 'package:hamp/bloc/login_bloc.dart';
import 'package:hamp/bloc/provider.dart';
import 'package:hamp/util/widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController emailTextController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _form(context));
  }

  _form(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height,
          decoration: gradient(),
        ),
        Container(
          height: size.height,
          width: size.width,
          child: _scrollView(context),
        )
      ],
    );
  }

  Widget _buildForgotPasswordBtn(LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () =>
                  snapshot.hasData ? _forgotPassword(bloc, context) : null,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                'Recuperar contraseña',
                style: TextStyle(
                  color: Color.fromRGBO(107, 9, 102, 0.8),
                  letterSpacing: 1.0,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          );
        });
  }

  _scrollView(BuildContext context) {
    final bloc = Provider.of(context);
    setState(() {
      if(bloc.email != null){        
        emailTextController.value = TextEditingValue(text : bloc.email);  
      }      
    });    

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconApp(context),
          SizedBox(
            height: 30.0,
          ),
          emailTextField(bloc, emailTextController),
          SizedBox(
            height: 5.0,
          ),
          emailError(bloc),
          SizedBox(
            height: 10.0,
          ),
          _buildForgotPasswordBtn(bloc)
        ],
      ),
    );
  }

  _forgotPassword(LoginBloc bloc, BuildContext context){
    print('forgotPassword - ${bloc.email}');
  }
  
}