import 'package:flutter/material.dart';

final url = 'http://10.0.2.2:3001';

final colorsApp = {
 'color1' : Color.fromRGBO(174, 132, 172, 0.85),
 'color2' : Color.fromRGBO(165, 94, 162, 0.5),
 'color3' : Color.fromRGBO(135, 51, 130, 0.7),
 'color4' : Color.fromRGBO(107, 9, 102, 0.8),
};

final styleHintText= TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final styleTextWhite = TextStyle(
  color: Colors.white,
  fontFamily: 'OpenSans',
);

final titleStyle =  TextStyle(
      color: Colors.white,
      fontFamily: 'OpenSans',
      fontSize: 30.0,
      fontWeight: FontWeight.bold
);
  

final labelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final boxDecorationStyle = BoxDecoration(
  color: colorsApp['color4'],
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);