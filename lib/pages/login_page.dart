import 'package:flutter/material.dart';
import 'package:hamp/bloc/login_bloc.dart';
import 'package:hamp/bloc/provider.dart';
import 'package:hamp/providers/login_provider.dart';
import 'package:hamp/util/constants.dart';
import 'package:hamp/util/utils.dart';
import 'package:hamp/util/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  LoginProvider loginProvider = new LoginProvider();
  bool _rememberMe = false;

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

  _passwordField(LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Contraseña',
                style: labelStyle,
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerRight,
                decoration: boxDecorationStyle,
                height: 60.0,
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    hintText: '************',
                    hintStyle: styleHintText,
                  ),
                  onChanged: bloc.changePassword,
                ),
              ),
            ],
          );
        });
  }

  _passwordError(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          alignment: Alignment.centerRight,
          child: snapshot.hasError
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      snapshot.error,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              : null,
        );
      },
    );
  }

  _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, 'forgotPassword'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          '¿Olvidaste tu contraseña?',
          style: labelStyle,
        ),
      ),
    );
  }

  _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Recordarme',
            style: labelStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginBtn(LoginBloc bloc) {
    return StreamBuilder<Object>(
        stream: bloc.formValidStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            width: double.infinity,
            child: RaisedButton(
              elevation: 5.0,
              onPressed: () =>
                  snapshot.hasData ? _login(bloc, context) : null,
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                'Iniciar sesión',
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
          emailTextField(bloc, TextEditingController()),
          SizedBox(
            height: 5.0,
          ),
          emailError(bloc),
          SizedBox(
            height: 10.0,
          ),
          _passwordField(bloc),
          _passwordError(bloc),
          _buildForgotPasswordBtn(),
          _buildRememberMeCheckbox(),
          _buildLoginBtn(bloc)
        ],
      ),
    );
  }

  _login(LoginBloc bloc, BuildContext context) async {
    print(bloc.email);
    print(bloc.password);
    Map info = await loginProvider.login(bloc.email, bloc.password, _rememberMe);

    if ( info['ok'] ) {
       Navigator.pushReplacementNamed(context, 'home');
    } else {
       mostrarAlerta( context, info['mensaje'] );
    }
  }
}
