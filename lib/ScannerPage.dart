import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'FadeAnimation.dart';

import 'Leaderboard.dart';

class ScannerPage extends StatefulWidget{
  @override
  _Scanner createState() => _Scanner();
}






class _Scanner extends State<ScannerPage> {
  String score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('lib/images/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/images/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/images/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('lib/images/clock.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("სკანირება", style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, 1),
                                ]
                            )
                        ),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:Color.fromRGBO(143, 148, 251, 1),
                              // Background color
                            ),


                            onPressed: () async {
                              //Pick an image
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.camera);


                              //OCR implementation
                              final FirebaseVisionImage visionImage = FirebaseVisionImage
                                  .fromFile(File(pickedFile.path));

                              final TextRecognizer textRecognizer = FirebaseVision
                                  .instance.textRecognizer();

                              final VisionText recognizedText = await textRecognizer
                                  .processImage(visionImage);
                              score = recognizedText.text;
                            },
                            child: const Text('დაწყება'),
                          ),

                        )),
                      SizedBox(height: 70,),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );


    Widget build(BuildContext context) =>
        Scaffold(
          backgroundColor: Colors.lightGreen,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              ],
            ),
          ),
        );
  }


}