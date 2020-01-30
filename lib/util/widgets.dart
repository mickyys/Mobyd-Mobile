  import 'package:flutter/material.dart';
import 'package:hamp/bloc/login_bloc.dart';

import 'constants.dart';

  Widget iconApp(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/img/logo.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration gradient() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          colorsApp['color1'],
          colorsApp['color2'],
          colorsApp['color3'],
          colorsApp['color4'],
        ],
            stops: [
          0.1,
          0.4,
          0.7,
          0.9
        ]));
  }

  Widget emailTextField(LoginBloc bloc, TextEditingController textEditingController) {
    return StreamBuilder<Object>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Correo', style: labelStyle),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: boxDecorationStyle,
                height: 60.0,
                child: TextField(
                  controller: textEditingController,
                  keyboardType: TextInputType.emailAddress,
                  style: styleTextWhite,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(107, 9, 102, 0.8),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: 'contacto@mobyd.cl',
                    hintStyle: styleHintText,
                  ),
                  onChanged: bloc.changeEmail,
                ),
              ),
            ],
          );
        });
  }

  Widget emailError(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          alignment: Alignment.centerRight,
          child: snapshot.hasError
              ? Text(
                  snapshot.error,
                  style: TextStyle(color: Colors.white),
                )
              : null,
        );
      },
    );
  }