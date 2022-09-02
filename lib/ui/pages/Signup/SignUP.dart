import 'package:flutter/material.dart';
import 'package:sharecard_app/ui/pages/Login.dart';

class SignUp extends StatefulWidget{

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(canvasColor: Color(0xffae93ce)),
      child: new Scaffold(
        body: SafeArea(
          child: Wrap(
            children: [
              Column(
                children: <Widget>[

                  Padding(padding: const  EdgeInsets.only(top: 100),),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: new Container(
                      child: Image(
                          width: MediaQuery.of(context).size.width *.60,
                          image: AssetImage(
                              "assets/images/PADSHARE.png"
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
                                  controller: _email,
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Agent ID",
                                    hintText: "23432",
                                    contentPadding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            color: Color(0xffa598b4)
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff9b8aaf)
                                        )
                                    ),



                                  ),
                                ),
                              ),
                              new Container(
                                width: MediaQuery.of(context).size.width * .81,
                                margin: const EdgeInsets.only(bottom: 15),
                                child: new TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Email",
                                    contentPadding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w400),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            color: Color(0xffa598b4)
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff9b8aaf)
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
                                  controller: _password,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 40, top: 20, bottom: 20),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w400),
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Password",
                                    hintText: "***********",

                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            color: Color(0xffa598b4)
                                        )
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(49),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0xff9b8aaf)
                                        )
                                    ),



                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 15,
                              ),

                              FlatButton(
                                  onPressed: (){},
                                  child: new Container(
                                    width: 320,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(49),
                                      color: Color(0xff388774),

                                    ),
                                    child:  Center(child: new Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19),)),
                                  )),
                              new Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                                child: new FlatButton(
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        new Text("Do you have an Account?", style: TextStyle(color: Color(0xffC5BFCC), fontSize: 15),),
                                        InkWell(

                                            onTap: (){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(builder: (_)=> Login())
                                              );
                                            },
                                            child: new Text("Login", style: TextStyle(color: Color(0xff388774), fontSize: 16, fontWeight: FontWeight.bold),))
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}