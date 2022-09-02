import 'dart:convert';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:sharecard_app/ui/pages/home/home.dart';

class RegisterBeneficiary extends StatefulWidget{

  @override
  _RegisterBeneficiaryState createState() => _RegisterBeneficiaryState();
}

class _RegisterBeneficiaryState extends State<RegisterBeneficiary> {


  GlobalKey<FormState> _globalKey = new GlobalKey<FormState>();

  TextEditingController _fullNames = new TextEditingController();
  TextEditingController _age = new TextEditingController();
  TextEditingController _gender = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _partner = new TextEditingController();
  TextEditingController _nationality = new TextEditingController();
  TextEditingController _acre  = new TextEditingController();
  TextEditingController _village  = new TextEditingController();
  TextEditingController _ownership = new TextEditingController();
  TextEditingController _memberships = new TextEditingController();

  String UserID;
  bool isLoading = false;

  String result = "QR";

  var gender = [
     "Male",
     "Female",
    "select Options"
  ];

  var defaultval = "select Options";

  Map<String, String> token;


  gettoken()async{
    final savedtokken = new FlutterSecureStorage();
    final Map<String,String> tokenss = await savedtokken.readAll();
    setState(() {
      token = tokenss;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettoken();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: ThemeData(canvasColor: Color(0xffae93ce)),
      child: new Scaffold(
        extendBodyBehindAppBar: true,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: (){
              // Navigator.pop(context);
              // Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> Home()));
              Navigator.push(context, MaterialPageRoute(builder:(_)=> Home()));
            },
            child: Icon(Icons.arrow_back_ios, size: 21,color: Colors.purple,)
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Padding(padding: const  EdgeInsets.only(top: 70),),

              new Container(
                   height:50,
                   width:50,
                 decoration: BoxDecoration(
                   image:DecorationImage(
                     image: AssetImage(
                         "assets/images/PADSHARE-LOGO.png"
                     )
                   )
                 ),
                // child: Image(
                //     image: ),
              ),
              new Text('Create Beneficiary', style:TextStyle(fontSize: 14,color: Colors.purple, fontWeight: FontWeight.w500)),
          SizedBox(height:10),
              Center(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      new Container(
                        width: MediaQuery.of(context).size.width * .81,
                        margin: const EdgeInsets.only(bottom: 15),
                        child: new TextFormField(
                          controller: _fullNames,
                          validator: (value){
                            if(value.isEmpty){
                              return "Benefcially Names Requird";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: Color(0xffE9DCF8),
                            filled: true,
                            labelText: "Full Names",
                            hintText: "23432",
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                            contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
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

                      Container(
                        width: MediaQuery.of(context).size.width * .81,
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: new Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: new TextFormField(
                                  controller: _age,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "Age Requird";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Age",
                                    hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                                    contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
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
                            ),
                            Expanded(
                              flex:2,
                              child: new Container(
                                // width: MediaQuery.of(context).size.width * .81,
                                  margin: const EdgeInsets.only(bottom: 15),

                                  child: Container(
                                    padding: EdgeInsets.only(right: 8, left: 8),
                                    decoration: BoxDecoration(
                                        color:Color(0xffE9DCF8),
                                        borderRadius: BorderRadius.circular(49),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xff9b8aaf)
                                        )

                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        style: TextStyle(fontSize: 15, color: Colors.black38),
                                        items: gender.map<DropdownMenuItem<String>>((val) {
                                          return DropdownMenuItem<String>(
                                            value: val,
                                            child: Text(val),
                                          );
                                        },
                                        ).toList(),
                                        value: defaultval,
                                        onChanged: (value){
                                          print('Res $value');
                                          setState(() {
                                            defaultval = value;
                                          });
                                        },
                                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                                        elevation: 16,
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                      ,
                      Container(
                        width: MediaQuery.of(context).size.width * .81,
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: new Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: new TextFormField(
                                  controller: _ownership,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "ownership";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Ownership",
                                    hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                                    contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
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
                            ),
                            Expanded(
                              flex:2,
                              child: new Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: new TextFormField(
                                  controller: _memberships,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "memberships";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Memberships",
                                    hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                                    contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
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
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width * .81,
                        margin: const EdgeInsets.only(bottom: 12),

                        child: new TextFormField(
                          controller: _phone,
                          validator: (value){
                            if(value.isEmpty || value.length < 6){
                              return "Benefcially phone requird";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
                            fillColor: Color(0xffE9DCF8),
                            filled: true,
                            labelText: "Phone",
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                            hintText: "+256-111-111",

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
                        margin: const EdgeInsets.only(bottom: 10),

                        child: new TextFormField(
                          controller: _nationality,
                          validator: (value){
                            if(value.isEmpty){
                              return "Nationality requird";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                            contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
                            fillColor: Color(0xffE9DCF8),
                            filled: true,
                            labelText: "Nationality",
                            hintText: "nationality",

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
                        margin: const EdgeInsets.only(bottom: 12),

                        child: new TextFormField(
                          controller: _address,
                          maxLines: 2,
                          validator: (value){
                            if(value.isEmpty){
                              return "Address requird!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                            contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
                            fillColor: Color(0xffE9DCF8),
                            filled: true,
                            labelText: "Adress 1",
                            hintText: "P.O.Box 111",

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
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
                      Container(
                        width: MediaQuery.of(context).size.width * .81,
                        child: Row(
                          children: [
                            Expanded(
                              flex:2,
                              child: new Container(
                                margin: const EdgeInsets.only(bottom: 15),
                                child: new TextFormField(
                                  controller: _village,
                                  validator: (value){
                                    if(value.isEmpty){
                                      return "village";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    fillColor: Color(0xffE9DCF8),
                                    filled: true,
                                    labelText: "Village",
                                    hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                                    contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                                    labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
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
                            ),
                            Expanded(
                              flex:2,
                              child: new Container(
                                // width: MediaQuery.of(context).size.width * .81,
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Container(
                                      padding: EdgeInsets.only(right: 8, left: 8),
                                      decoration: BoxDecoration(
                                          color:Color(0xffE9DCF8),
                                          borderRadius: BorderRadius.circular(49),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xff9b8aaf)
                                          )

                                      ),
                                      child: new TextFormField(
                                        controller: _acre,
                                        validator: (value){
                                          if(value.isEmpty){
                                            return "Acre is required";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          // fillColor: Color(0xffE9DCF8),
                                          // filled: true,
                                          labelText: "Acres",
                                          disabledBorder: InputBorder.none,
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                                          contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                                          labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
                                          // enabledBorder: OutlineInputBorder(
                                          //     borderRadius: BorderRadius.circular(49),
                                          //     borderSide: BorderSide(
                                          //         color: Color(0xffa598b4)
                                          //     )
                                          // ),
                                          // focusedBorder: OutlineInputBorder(
                                          //     borderRadius: BorderRadius.circular(49),
                                          //     borderSide: BorderSide(
                                          //         width: 1,
                                          //         color: Color(0xff9b8aaf)
                                          //     )
                                          // ),



                                        ),
                                      )
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width * .81,
                        margin: const EdgeInsets.only(bottom: 12),

                        child: new TextFormField(
                          controller: _partner,
                          validator: (value){
                            if(value.isEmpty){
                              return "Family Size requird!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            hintStyle: TextStyle(color: Colors.black38, fontSize: 11, fontWeight: FontWeight.w400) ,
                            labelStyle: TextStyle(color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w400),
                            fillColor: Color(0xffE9DCF8),
                            filled: true,
                            labelText: "Family Size",
                            hintText: "",

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
                          onPressed: ()async{
                            _onLoading(context);
                            print("UUU ${token['agentID'].toString()}");

                            setState(() {
                              UserID = token['agentID'].toString();
                            });
                            if(_globalKey.currentState.validate()){

                            // $beneficiary ->family_size = $request ->family_size;
                            // $beneficiary ->assigned_Inspectors = $request -> assigned_Inspectors;
                            // $beneficiary ->certifications = $request -> certifications;
                              var data = {
                                "fullName":_fullNames.text,
                                "age":_age.text,
                                "gender": defaultval,
                                "phoneNumber":_phone.text,
                                "nationality": _nationality.text,
                                "acres" : _acre.text,
                                "village": _village.text,
                                "ownership" : _ownership.text,
                                "memberships": _memberships.text,
                                "address":_address.text,
                                "family_size":_partner.text,
                                "agent_id" : UserID,
                              };


                              final result = await http.post(
                                  // Uri.parse('https://padshareapp.com/api/card/create_beneficiary/${UserID}/'),
                                  Uri.parse('http://159.203.177.220/api/card/create_beneficiary/${UserID}'),

                                  headers: {
                                    'Accept':'application/json',
                                    'Content-Type':'application/json',
                                    'Authorization': 'Bearer ${token['authtoken']}'
                                  },
                                  body:jsonEncode(data)
                              );
                              print('User Created ${result.statusCode}');
                              final user = json.decode(result.body);
                              if(result.statusCode == 200 || result.statusCode ==  201){



                                print('User Created ${user}');
                                Navigator.pop(context);
                                showtoast(user['message']);
                                alertDialogs(user['data']['uuid']);
                                // Future.delayed(Duration(seconds: 1)).then((value) =>_AddBeneficiaryCard(user['data']['uuid'] ?? ""));


                              }else{

                                if(result.statusCode == 409){
                                  // Navigator.of(context).pop();
                                  Navigator.pop(context);
                                  AlertDialog alertDialog = new AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),

                                    ),
                                    title: Text('Error Registering',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
                                    content: Text("${user['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> Home()));
                                          }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
                                    ],
                                  );

                                  showDialog(context: context,
                                      builder: (_) => alertDialog
                                  );

                                  print('ERRRO Creating User::: ${result.body}');

                                }

                                if(result.statusCode == 400){
                                  Navigator.pop(context);
                                  AlertDialog alertDialog = new AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),

                                    ),
                                    title: Text('Error Registering',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
                                    content: Text("please check all Fields are filled in Correctly",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
                                    actions: <Widget>[
                                      FlatButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> Home()));
                                          }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
                                    ],
                                  );

                                  showDialog(context: context,
                                      builder: (_) => alertDialog
                                  );
                                  print('ERRRO Creating User ${result.statusCode}::: ${result.body}');
                                }
                                print('ERRRO Creating User::: ${result.body}');
                                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                                //     builder: (_)=> Home()
                                // ));
                                setState(() {
                                  isLoading = false;
                                });
                              }

                              print('REDATA ::${data}');

                            }
                          },
                          child: new Container(
                            width: 320,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0xff388774),

                            ),
                            child:  Center(child: new Text("Create", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 19),)),
                          )),
                      // new Padding(padding: const EdgeInsets.only(left: 20,right: 20),
                      //   child: new FlatButton(
                      //       child: new Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           new Text("Do you have an Account?", style: TextStyle(color: Color(0xffC5BFCC), fontSize: 15),),
                      //           InkWell(
                      //
                      //               onTap: (){
                      //                 Navigator.of(context).push(
                      //                     MaterialPageRoute(builder: (_)=> Login())
                      //                 );
                      //               },
                      //               child: new Text("Login", style: TextStyle(color: Color(0xff388774), fontSize: 16, fontWeight: FontWeight.bold),))
                      //         ],
                      //       )),
                      // ),
                    ],
                  ),
                ),
              )




            ],
          ),
        ),
      ),
    );
  }


  Widget progressIndictor() {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Text('Creating...', style: GoogleFonts.roboto(color: Colors.grey, fontSize: 8),),
        SpinKitFadingCircle(
          size: 40.0,
          color:Colors.green
        ),
      ],
      // )
    );
  }

  void _onLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return showProgressDialog(context);
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              progressIndictor(),
              SizedBox(height: 5,),
              new Text("Creating...", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Future _AddBeneficiaryCard(verification) async{
     var tokens = await token;
    try{
      var   qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult as String;
      });

      print("DATA RESITTT:::: $result");

      var params = {
        "agent_id":3072,
        "card_scanned":result
      };

      final response = await http.post(
        // Uri.http("padshare.herokuapp.com", "api/card/scan/"),
        // Uri.https("padshareapp.com", "api/card/attach_card/"),
        Uri.https("159.203.177.220", "api/card/attach_card"),

        headers: {
          'Accept':"application/json",
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${token['authtoken']}'
        },

        body: jsonEncode(<String,String>{
          "agent":UserID,
          "card_sequence":result,
          "beneficiary_id":verification.toString()
        }),

      );

      print("FILECODE:${response.statusCode}");
      print("FILE:${jsonDecode(response.body)}");
      print("Body${response.body}");
      final data = jsonDecode(response.body);
      // setState(() {
      //   _userVerification.text = "";
      // });

      if(response.statusCode == 200){
        AlertDialog alertDialog = new AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),

          ),
          title: new Text("Card Attached"),
          content: Text(" ${data['success']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> Home()));
                }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
          ],
        );

        showDialog(context: context,
            builder: (_) => alertDialog
        );
      }

      if(response.statusCode == 400){
        debugPrint(data['error']);
        AlertDialog alertDialog = new AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),

          ),
          title: Text('Wrong Identification ID',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
          content: Text("no such ID: ${ data['error'] == null ? data['card_sequence'][0]==null?"There was an Unknown error Capturing this Card" : "${data['card_sequence'][0]} 'CARD QRCODE'" : data['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
          actions: <Widget>[
            FlatButton(
                onPressed: (){
                   Navigator.pop(context);
                   Navigator.pushReplacement(context, MaterialPageRoute(builder:(_)=> Home()));
                }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
          ],
        );

        showDialog(context: context,
            builder: (_) => alertDialog
        );

      }

      // if(response.statusCode == 500){
      //   debugPrint(data['error']);
      //   AlertDialog alertDialog = new AlertDialog(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(25),
      //
      //     ),
      //     title: Text('Wrong Identification ID',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
      //     content: Text("no such ID: ${data['message']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
      //     actions: <Widget>[
      //       FlatButton(
      //           onPressed: (){
      //             Navigator.pop(context);
      //           }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
      //     ],
      //   );
      //
      //   showDialog(context: context,
      //       builder: (_) => alertDialog
      //   );
      //
      // }
      // if(response.statusCode == 400){
      //
      //   print(data['error']);
      //
      //   AlertDialog alertDialog = new AlertDialog(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(25),
      //
      //     ),
      //     title: Text('Wrong Card Scanned',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
      //     content: Text("Scanning Card: ${data['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
      //     actions: <Widget>[
      //       FlatButton(
      //           onPressed: (){
      //             Navigator.pop(context);
      //           }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
      //     ],
      //   );
      //
      //   showDialog(context: context,
      //       builder: (_) => alertDialog
      //   );
      //
      // }

      //
      // if(response.statusCode == 200 || response.statusCode == 201 ){
      //
      //   print("CARD SCANNED in");
      //
      //   Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (_) => Home())
      //   );
      //
      // } else{
      //   throw Exception("ERROR LOGIN");
      // }






    }on PlatformException catch(e){
      if(e.code == BarcodeScanner.cameraAccessDenied){
        result = "Camera Permission Denied";
      } else{
        setState(() {
          result = "Unkwon Error $e";
        });
      }
    } on FormatException{
      setState(() {
        result = "You pressed the back Button";
      });
    }catch(ex){
      setState(() {
        result = "Unknown Errro $ex";
      });
    }
  }

  Widget showtoast(msg){
    var toast = Fluttertoast.showToast(
        msg: msg,//'Beneficiary created successfully!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    // throw toast;
  }

  Widget alertDialogs(id){
    AlertDialog alert = AlertDialog(
      title: Text("Beneficiary Successfully created"),
      content: Text("UID:${id}"),
      actions: [


        TextButton(
          child: Text("Yes continue"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => Home())
            );

          },
        ),

      ],


    );


    showDialog(context: context, builder: (_)=> alert);



  }
}