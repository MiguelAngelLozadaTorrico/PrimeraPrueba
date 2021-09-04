import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert'; // se pone en azul si no lo utilizamos
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


void main()=>runApp(MiApp());

class MiApp extends StatelessWidget
 {
   
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: "Mi App",
      debugShowCheckedModeBanner: false,
      home: Inicio(),
    );
  }
}


class Inicio extends StatefulWidget 
{
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> 
{
  TextEditingController apiNameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController catController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
       appBar: AppBar
       (
        title: Text("App de Miguel"),
       ),
       body: ListView(
         children: <Widget> [
            Center
       (
         child: 
         Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:<Widget>[
               Text("tkm cami"),
              FutureBuilder(
                  future: getData(), 
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                   {
                     if(snapshot.hasData)
                   {return Text(snapshot.data);}
                   else
                   {return CircularProgressIndicator();}
                     },



              )
               

           ]


         )
         
         
       ),
       Column(
             children: [
                
               Container(
                 padding: EdgeInsets.all(15),
                 child: TextField( 
                   keyboardType: TextInputType.number,
                   cursorColor: Colors.red,
                   cursorRadius: Radius.circular(20),

                   decoration: const InputDecoration(
                     icon: Icon(Icons.notifications_active,color:Colors.lightBlue),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    hintText: "UserID",
                    fillColor: Colors.white,
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),


          
                 ),   
               )
             

             ],

       ),


       
       ElevatedButton(
         
         onPressed: getData, 
         child: Text("Obtener datos")),
         

         ],
         
       )
       
    );
  }
}
  Future<dynamic> getData() async{
    var response= await get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
     );
      var decodeData= jsonDecode(response.body);
          String usuario= decodeData["userId"];
          return usuario;

  }