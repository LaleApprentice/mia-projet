import 'package:flutter/material.dart';
import 'package:flutterfbauth/MapUtils.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

 return Scaffold(
   backgroundColor: Color.fromRGBO(143, 148, 251, 1),

    body:Container(

      child:Center( child: TextButton(
          style:TextButton.styleFrom(
              backgroundColor: Colors.blueAccent
          ),
          onPressed: (){
            MapUtils.openMap(41.7151,44.8271);
          },
          child:Text(
              'ყუთის პოვნა',
              style:TextStyle(color:Colors.white)
          )
      ))

    ),

  );

  }
  Future<void>_launchUrl(String urlString) async{

      await launchUrl(Uri.parse(urlString));


  }





}