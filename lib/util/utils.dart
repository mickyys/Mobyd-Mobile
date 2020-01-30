import 'package:flutter/material.dart';

void mostrarAlerta(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        // backgroundColor: colorsApp['color1'],
        title: Text('Información incorrecta', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
}