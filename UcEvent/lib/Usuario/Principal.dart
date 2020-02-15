import 'package:flutter/material.dart';

//Clase principal de la aplicacion despues de ingresar  sin estado
class Principal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar: new AppBar(title: Text('Bienvenido'),),
    body: new Column(children: <Widget>[new Text('Lista de establecimientos')],),
    );
    
  }



}