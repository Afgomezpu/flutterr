import 'package:flutter/material.dart';

//Metodo main para crear la clase ModificarEstablecimiento
//@param  clase InicioSesion

void main() => runApp(ModificarEstablecimiento());
//clase ModificarEstablecimiento para poder crearla sin  estado 
class ModificarEstablecimiento extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'UCEventos'), 
    );
  }
}
//clase MyhomePage para crear el estado 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

//Metodo build para crear los campos de ModificarEstablecimiento 
//@param  BuildContext context

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        title: Text(widget.title),
      ),
      resizeToAvoidBottomPadding: false,
      body: Center(
     
        child: SingleChildScrollView(
          child: Column(
        
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                child: Stack(
                  children:<Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text(
                        'Modificar Establecimiento',
                        style: TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold
                        )
                      ),
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Tipo de Establecimiento',
                          labelStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: TextStyle(
                          fontFamily: 'Monstserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                        )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Dirección',
                          labelStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Departamento',
                          labelStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Precio',
                          labelStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Descripción',
                          labelStyle: TextStyle(
                              fontFamily: 'Monstserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                          )
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.build),
      ), 
    );
  }
}
