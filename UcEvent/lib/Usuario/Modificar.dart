import 'dart:convert';
import 'dart:async';  
import 'package:flutter/material.dart';
import 'package:segundaentrega/Usuario/InicioSesion.dart';
import 'package:segundaentrega/Usuario/Principal.dart';
import 'package:http/http.dart' as http;

//Metodo principal para crear la clase  modificar
//@param Clase Modificar

void main() => runApp(new Modificar());

String username='';

Future<persona> fetchPost() async{
final response = await http.get('https://localhost:44309/api/usuario');
if(response.statusCode==200){
 return persona.fromJson(json.decode(response.body));

}else {
  throw Exception('error conexion');
}
}
//clase persona para poder generar el json para poder validar en la base de datos
class persona{
final int id;
final String nombre;
final String apellido;
final String usuario;
final String password;
persona({this.id,this.nombre,this.apellido,this.usuario,this.password});
factory persona.fromJson(Map<String,dynamic> Json){
  return persona(
    id: Json['id'],
    nombre: Json['nombre'],
    apellido: Json['apellido'],
    usuario: Json['usuario'],
    password: Json['password']
  );
}
}
//clase Modificar para poder crearla sin  estado
class Modificar extends StatelessWidget {
   //Future<persona> persona;
  //MyApp({Key key, this.persona}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Software III',     
      home: new Ingresar(),
      routes: <String,WidgetBuilder>{
        '/InicioSesion': (BuildContext context)=> new InicioSesion(),
        
      },
    );
  }
}

//clase ingresar para crear el estado

class Ingresar extends StatefulWidget {
  @override
  _IngresarState createState() => _IngresarState();
}

class _IngresarState extends State<Ingresar> {

TextEditingController nombre=new TextEditingController();
TextEditingController contrasena=new TextEditingController();
TextEditingController apellido=new TextEditingController();
TextEditingController usuario=new TextEditingController();

String mensaje='';

//El metodo futuro sincroniza informacion con la base de datos

Future<List> _login() async {
  final response = await http.post("http://192.168.0.20/software3/login.php", body: {
    "username": usuario.text,
    "password": contrasena.text,
  });

  var datauser = json.decode(response.body);

  if(datauser.length==0){
    setState(() {
          mensaje ="error de modificacion";
        });
  }else{
    if(datauser[0]['nivel']=='Vendedor'){
       Navigator.pushReplacementNamed(context, '/InicioSesion');
    }else if(datauser[0]['nivel']=='Usuario'){
      Navigator.pushReplacementNamed(context, '/Principal');
    }

    setState(() {
          username= datauser[0]['username'];
        });

  }
return datauser;
}

//Metodo build para crear los campos de modificar
//@param  BuildContext context

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Center(child: Text('Modificar Informacion',style:TextStyle(fontSize: 22) ,)),backgroundColor: Colors.black ,),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Nombre",style: TextStyle(fontSize: 17),),
              TextField(   
                controller: nombre,                
                decoration: InputDecoration(
                  hintText: 'Nombre'
                ),           
                ),
              Text("Nuevo nombre",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: apellido,                  
                 decoration: InputDecoration(
                  hintText: 'Nuevo nombre'
                ),                
                ),
               Text("Apellido",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: usuario,                                 
                 decoration: InputDecoration(
                  hintText: 'Apellido'
                ),                
                ),
                Text("Nuevo apellido",style: TextStyle(fontSize: 17),),
              TextField(  
                controller: contrasena,              
                
                 decoration: InputDecoration(
                  hintText: 'Nuevo Apellido'
                ),                
                ),

              RaisedButton(
                child: Text("Modificar",style: TextStyle(fontSize: 20),),
                onPressed: webservice,
              ),

              Text(mensaje,style: TextStyle(fontSize: 20.0,color: Colors.red),)
             

            ],
          ),
        ),
      ),
    );
}

void webservice(){
Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context){
      return Scaffold(appBar: AppBar(title: Text('Modificacion exitosa'),
      ),
      body: Center(child: FutureBuilder<persona>( builder :(context,snapchot){
        if(snapchot.hasData){
        return Text(snapchot.data.nombre);
        }else if (snapchot.hasError){
          return Text('error de modificacion');
        }
       return CircularProgressIndicator();
      },
      
      ),)
      );
    }
)
);
 

}
}