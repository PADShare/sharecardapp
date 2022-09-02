
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharecard_app/ui/pages/home/home.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  TextEditingController _agentID = new TextEditingController();
  TextEditingController _agentPIN = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Color(0xff4B3A70),),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          // reverse: true,
          children: <Widget>[

            Padding(padding: const  EdgeInsets.only(top: 10),),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: new Container(
                child: Image(
                    width: MediaQuery.of(context).size.width *.30,
                    height: MediaQuery.of(context).size.width *.30,
                    image: AssetImage(
                        "assets/images/screen_logo.png"
                    )),
              ),
            ),


            Center(
              child: Form(
                key: _globalKey,
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        new Container(
                          width: MediaQuery.of(context).size.width * .81,
                          margin: const EdgeInsets.only(bottom: 15),

                          child: new TextFormField(
                            style: TextStyle(color: Colors.white60),
                            controller: _agentID,
                            validator: (value){
                              if( value.length < 3){
                                return "Please Enter ID";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Color(0xff432D5B),

                              filled: true,
                              labelText: "Agent ID",
                              hintText: "234234",
                              hintStyle:  TextStyle(color: Colors.white24, fontSize: 12, fontWeight: FontWeight.w300),
                              contentPadding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                              labelStyle: TextStyle(color: Colors.white24, fontSize: 18, fontWeight: FontWeight.w400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(49),
                                  borderSide: BorderSide(
                                      color: Color(0xff402E58)
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(49),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff402E58)
                                  )
                              ),



                            ),
                          ),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width * .81,
                          margin: const EdgeInsets.only(bottom: 1),

                          child: new TextFormField(
                            obscureText: true,
                            controller: _agentPIN,
                            style: TextStyle(color: Colors.white60),
                            validator: (value){
                              if( value.length < 3){
                                return "Please Enter PIN";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                              labelStyle: TextStyle(color: Colors.white24, fontSize: 18, fontWeight: FontWeight.w400),
                              fillColor: Color(0xff432D5B),
                              filled: true,
                              labelText: "PIN",
                              hintText: "0000",
                              hintStyle:  TextStyle(color: Colors.white24, fontSize: 12, fontWeight: FontWeight.w400),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(49),
                                  borderSide: BorderSide(
                                      color: Color(0xff402E58)
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(49),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff402E58)
                                  )
                              ),



                            ),
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                          child: new FlatButton(
                              onPressed: (){

                              },
                              child: new Text("Forgot Your PIN?", style: TextStyle(color: Color(0xffC5BFCC), fontSize: 15),)),
                        ),

                        FlatButton(
                            onPressed: () async {
                              // Navigator.of(context).pushReplacement(
                              //   MaterialPageRoute(builder: (_) => Home())
                              // );
                              print("first Click");

                              if(_globalKey.currentState.validate()){
                                showProgressDialog(context);
                                print(_agentID.text);
                                print(_agentPIN.text);
                                var userData = jsonEncode({
                                  "agent_id": int.parse(_agentID.text),
                                  "pin": int.parse(_agentPIN.text)
                                });

                                var params ={
                                  "agent_id": int.parse(_agentID.text),
                                  "pin": int.parse(_agentPIN.text)
                                };

                                // Response response =  await Dio().post(
                                //      "https://padshare.herokuapp.com/api/card/agent_login/",
                                //     options: Options(
                                //       contentType: Headers.jsonContentType
                                //       ),
                                //   queryParameters: params,
                                //     onSendProgress: (int sent , int total){
                                //       debugPrint("sent${sent.toString()}" + " total${total.toString()}");
                                //
                                //       Navigator.of(context).pushReplacement(
                                //           MaterialPageRoute(builder: (_) => Home())
                                //       );
                                //      }
                                //
                                //
                                //
                                //
                                //
                                // ).whenComplete(() {
                                //   debugPrint("complete");
                                //
                                //    // debugPrint(response)
                                // }).then((value){
                                //
                                //   print(value.statusCode);
                                //   debugPrint("SUCCESS");
                                //
                                // }).catchError( (onError){
                                //   debugPrint("error:${onError.message}");
                                // });


                                final response = await http.post(
                                  // https://sharecardsapp.herokuapp.com/
                                 // Uri.http("padshare.herokuapp.com", "api/card/agent_login/"),
                                 //  Uri.https("padshareapp.com", "api/card/agent_login/"),
                                  Uri.http('159.203.177.220',"api/card/agent_login"),
                                  headers: {
                                    'Content-Type': 'application/json',
                                    'Accept' : 'application/json',
                                  },
                                    // "pin": _agentPIN.text
                                  body: jsonEncode(<String,String>{
                                    "agent_id":  _agentID.text,
                                    "agent_pin": _agentPIN.text
                                  }),

                                );
                                print("RESPONSE: ${response}");


                                Navigator.pop(context);

                                if(response.statusCode == 200 || response.statusCode == 201 ){
                                  var data = jsonDecode(response.body);

                                  print("Surcess Logged in ${data['agent_id']}");


                                  StorageToken(data['agent_id'], data['token']);

                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) => Home())
                                  );

                                } else{

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));

                                  Fluttertoast.showToast(
                                    msg: "Incorrect Agent ID/PIN:${_agentPIN.text }",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 20,
                                    fontSize: 15

                                  );

                                  throw Exception("ERROR LOGIN");

                                }



                              }



                            },
                            child: new Container(
                              width: 320,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(49),
                                color: Color(0xffFD65A3),

                              ),
                              child:  Center(child: new Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19),)),
                            )),
                        // new Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                        //   child: new FlatButton(
                        //       onPressed: (){
                        //       Navigator.of(context).push(
                        //         MaterialPageRoute(builder: (_)=> SignUp())
                        //       );
                        //       },
                        //       child: new Text("Don't have an Account?", style: TextStyle(color: Color(0xffC5BFCC), fontSize: 15),)),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }


  showProgressDialog(BuildContext context){
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        color: Colors.transparent,
        child: Center(

          child: CircularProgressIndicator(backgroundColor: Colors.transparent),
        ),
      ),


    );
    showDialog( barrierDismissible: false,
        context: context, builder: (BuildContext context){
          return alert;
        });
  }


  StorageToken(agent,authToken) async{
    final storage = new FlutterSecureStorage();
    // await storage.deleteAll();
    await storage.write(key: 'agentID', value: agent.toString(), );
    await storage.write(key: 'authtoken', value: authToken, );

  }

  Future PostLoginUser(agentID, pin) async {
    try{
      final response = await http.post(
        //  Uri.http("https://padshare.herokuapp.com", "api/card/agent_login/"),
        Uri.http("http://159.203.177.220", "api/card/agent_login/"),
        headers: {
            'Content-Type': 'application/json',
          },
         body: jsonEncode(<String,String>{
            "agent_id": agentID,
            "pin": pin
          }),

      );
      print(response.statusCode);

      if(response.statusCode == 200 || response.statusCode == 201 ){

        print("Surcess Logged in");

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => Home())
        );

      } else{
        throw Exception("ERROR LOGIN");
      }

      if(response.statusCode == 400 ){

        AlertDialog alertDialog = new AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),

          ),
          title: Text('Failed to Login',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
          content: Text("no Agent Found;",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
          ],
        );

        showDialog(context: context,
            builder: (_) => alertDialog
        );

      }

    }catch(e){

    }
  }
}