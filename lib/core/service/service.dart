import 'dart:convert';
import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharecard_app/models/packages.dart';
import 'package:sharecard_app/models/trainings.dart';
import 'package:sharecard_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Service{
 // static const uploadurl = 'https://padshareapp.com/api/card/update_agent/';
 // static const uploadurl = 'padshareapp.com';
  static const uploadurl = '159.203.177.220';
 static final savedtokken = new FlutterSecureStorage();
 static final  token = savedtokken.readAll();

 static const  Map<String, String>  headers = {
   "Accept": 'Application/json',
   "Content-type": "multipart/form-data"
 };
  static final cloudinary = Cloudinary.full(
      apiKey: Constants.shareCardKey,
      apiSecret: Constants.shareCardSecret,
      cloudName: Constants.shareCardName);


 static  updateAgentprofile(userID,profile)async {
   var tokens = await token;
   Map<String, String>  headers1 = {
     // "Accept": 'Application/json',
     "Content-type": "application/json",
    'Authorization': 'Bearer ${tokens['authtoken']}'
   };
   // var url = Uri.parse('http://sharecardsapp.herokuapp.com/api/card/update_agent/${userID}?_method=PATCH');
  Map data = {
     'profile_pic': profile
   };
   var body = json.encode(data);

   var uploadresponse = await http.patch(Uri.http( uploadurl, 'api/card/update_agent/${userID}'  ), headers: headers1,
   body: body
   );
   if(uploadresponse.statusCode == 200 || uploadresponse.statusCode == 201){

     print('FILE UPLOADED');

     print("RES ${uploadresponse.body}");
     return json.decode(uploadresponse.body);

   }else{

     print('Upload Failed : ${uploadresponse.body}');

   }
 }

 static  updateUserprofile(userID,profile)async {
    var tokens = await Service.token;
   // var data = {
   //   'profile_pic': profile
   // };
  // var url = Uri.parse('https://padshareapp.com/api/card/update_agent/5330/');?_method=PATCH
    var url = Uri.parse('http://159.203.177.220/api/card/update_agent/${userID}?_method=PATCH');

   var uploadresponse = http.MultipartRequest("PATCH", url)
       ..headers.addAll({
         'Content-Type': 'application/x-www-form-urlencoded',
         'Accept' : 'application/x-www-form-urlencoded',
         'Authorization': 'Bearer ${tokens['authtoken']}'
       })
       ..files.add(await http.MultipartFile.fromPath(
           'profile_pic', profile,
           // contentType: MediaType('image', 'jpeg')
       ));
    //   ..files.add(await http.MultipartFile.fromBytes('profile_pic', await File.fromUri(profile).readAsBytes(),contentType: MediaType('image', 'jpeg') ));
   // var response = await uploadresponse.send();
   //
   // if(response.statusCode == 200 || response.statusCode == 201){
   //   print('UPLOADED HERE SEE');
   //   print(response.request);
   // }else{
   //   print(response.request);
   // }

   uploadresponse.send().then((response) {
     http.Response.fromStream(response).then((onValue) {
       try {
         print('RESPONSE:: ${response.request}');
         print('RESPONSE:: ${response.contentLength}');
         print('FILE UPLOADED SEE');
       } catch (e) {
         print("EXCEPTION :$e");
       }
     });
   });
 }

 static   Future<List<Training>> getTrainings(userID) async {
   var tokens = await token;
   var questionsResponse = await http.get(
       // Uri.parse("https://padshareapp.com/training/get_training/$userID/"));
       Uri.parse("http://159.203.177.220/api/training/get_training/$userID"),
      headers: {
   'Accept':"application/json",
   'Content-Type': 'application/json',
   'Authorization': 'Bearer ${tokens['authtoken']}'
   },
   );


   if (questionsResponse.statusCode == 200) {
     final List dataReturned = json.decode(questionsResponse.body);

     return dataReturned.map((json) => Training.fromJson(json)).toList();
   } else {
     throw Exception();
   }
 }


  static   Future getPackages(userID) async {
   print("PACKA 0001");
    var tokens = await token;
    var questionsResponse = await http.get(
      // Uri.parse("https://padshareapp.com/training/get_training/$userID/"));
      Uri.parse("http://159.203.177.220/api/card/get_packages/$userID"),
      headers: {
        'Accept':"application/json",
        'Content-Type': 'application/json',
        // 'Authorization': 'Bearer ${tokens['authtoken']}'
      },
    );

    print("PACK : ${questionsResponse}");


    if (questionsResponse.statusCode == 200) {
      print("PACK 0020: ${json.decode(questionsResponse.body)}");
      var dataReturned = json.decode(questionsResponse.body)['packages'];

      // print("PACKA 1 : ${dataReturned}");

      return dataReturned.map((json) => Packages.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static   Future sendFarmerAssementFeedback(userresponse,userID,benficiary) async {
    print("PACKA 0001");
    var tokens = await token;
    var questionsResponse = await http.post(
      // Uri.parse("https://padshareapp.com/training/get_training/$userID/"));
      //http://159.203.177.220
      Uri.parse("http://159.203.177.220/api/agent/create_farmer_assessment/$userID"),
      headers: {
        'Accept':"application/json",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokens['authtoken']}'
      },
      body: jsonEncode(userresponse),
    );

    print("PACK : ${questionsResponse.body}");


    if (questionsResponse.statusCode == 200) {
      print("PACK 0020: ${json.decode(questionsResponse.body)}");
      var dataReturned = json.decode(questionsResponse.body);

      // print("PACKA 1 : ${dataReturned}");

      return dataReturned;
    } else {
      throw Exception(json.decode(questionsResponse.body));
      // return json.decode(questionsResponse.body);
    }
  }

  static   Future sendAssementFeedback(userresponse,userID,benficiary) async {
    print("PACKA 0001");
    var tokens = await token;
    var questionsResponse = await http.post(
      // Uri.parse("https://padshareapp.com/training/get_training/$userID/"));
      Uri.parse("http://159.203.177.220/api/agent/create_assessment/$userID"),
      headers: {
        'Accept':"application/json",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${tokens['authtoken']}'
      },
      body: jsonEncode(userresponse),
    );

    print("PACK : ${questionsResponse.body}");


    if (questionsResponse.statusCode == 200) {
      print("PACK 0020: ${json.decode(questionsResponse.body)}");
      var dataReturned = json.decode(questionsResponse.body);

      // print("PACKA 1 : ${dataReturned}");

      return dataReturned;
    } else {
      throw Exception(json.decode(questionsResponse.body));
      // return json.decode(questionsResponse.body);
    }
  }



 static Future<dynamic> downloadData()async{
   final savedtokken = new FlutterSecureStorage();
   final Map<String,String> token = await savedtokken.readAll();
   print("USERDDDDD ${token['agentID']}");

   // var response =  await http.get('https://padshare.herokuapp.com/api/card/scan_summary/${token['agentID']}/');
   // var response =  await http.get(Uri.parse('https://padshareapp.com/api/card/scan_summary/${token['agentID']}/'), headers: headers);

   var response =  await http.get(Uri.parse('http://159.203.177.220/api/card/scan_summary/${token['agentID']}'), headers: {
     'Accept':'application/json',
     'Authorization': 'Bearer ${token['authtoken']}'
   });

   return jsonDecode(response.body);//  return your response
 }


 static   Future addBeneficiaryCard(userId,result,userVerification,context) async{
   var tokens = await token;
   try{
     var qrResult = await BarcodeScanner.scan(); //await BarcodeScanner.scan();

      var results = qrResult.rawContent;


     print("DATA RESITTT:::: ${results.toString()}");

     var params = {
       "agent":userId,
       "card_sequence":results.toString(),
       "beneficiary_id":userVerification
     };
     print("DATA RESITTT @:::: $params");

     // Response response =  await Dio().post(
     //     "https://padshare.herokuapp.com/api/card/agent_login/",
     //     options: Options(
     //         contentType: Headers.jsonContentType
     //     ),
     //     queryParameters: params,
     //     onSendProgress: (int sent , int total){
     //       debugPrint("sent${sent.toString()}" + " total${total.toString()}");
     //     }
     //
     //
     // ).whenComplete(() {
     //   debugPrint("complete");
     //
     //   // debugPrint(response)
     // }).then((value){
     //
     //   print(value.statusCode);
     //   debugPrint("SUCCESS");
     //
     // }).catchError( (onError){
     //   debugPrint("error:${onError.message}");
     // });

     final response = await http.post(
       // Uri.http("padshare.herokuapp.com", "api/card/scan/"),
       // Uri.https("padshareapp.com", "api/card/attach_card/" http://159.203.177.220
       Uri.http("159.203.177.220", "api/card/attach_card"),

       // http://159.203.177.220//cards/

       headers: {
         'Accept':"application/json",
         'Content-Type': 'application/json',
         'Authorization': 'Bearer ${tokens['authtoken']}'
       },

       body: jsonEncode(<String,String>{
         "agent":userId.toString(),
         "card_sequence":results.toString(),
         "beneficiary_id":userVerification.toString()


       }),

     );

     print("FILECODE:${response}");
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
         content: Text(" ${data['message']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
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

     if(response.statusCode == 400){
       debugPrint(data['error']);
       AlertDialog alertDialog = new AlertDialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(25),

         ),
         title: Text('Wrong Identification ID',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
         content: Text("no such ID: ${data['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
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
       // setState(() {
         result = "Unkwon Error $e";
       // });
     }
     print('ER');
   } on FormatException{

       result = "You pressed the back Button";

   }catch(ex){
     // setState(() {
       result = "Unknown Errro $ex";
     // });

       print('ER :: ${ex}');
   }
 }


 static  Future<dynamic> fetchAgentScanList () async{

   final savedtokken = new FlutterSecureStorage();
   final Map<String,String> token = await savedtokken.readAll();

   print("USERDDDDD ${token['agentID']}");

   // print("HERE $UserID");

   try{

     final resultd  =  await http.get(
       Uri.https(
         // "padshare.herokuapp.com","api/card/distribution_metrics/${token['agentID']}/",
         // "padshareapp.com","api/card/distribution_metrics/${token['agentID']}/",
         // "padshareapp.com","api/card/distribution_metrics/5330/",
          '159.203.177.220','api/card/distribution_metrics/${token['agentID']}'
       ),
       headers: {
         'Accept':'application/json',
         'Authorization': 'Bearer ${token['authtoken']}'
       }
     );

     var data = jsonDecode(resultd.body);
     print("RESULT ${resultd.statusCode}");

     if(resultd.statusCode == 200){

     return json.decode(resultd.body);

     }else{
       print (data);
     }

   }
   catch(e){
     print(e);

   }


 }

 static Future getfeedbacks() async {
   var questionsResponse = await http.get(Uri.parse('https://padshareapp.com/feedback/questions/5330/'));

   if (questionsResponse.statusCode == 200) {
     var dataReturned = json.decode(questionsResponse.body);

     return dataReturned;
   }


   // print("$dataReturned DATA;-");
   // return dataReturned;

 }


  static Future registerPackage({cardSerialNo,user_packageID,UserID }) async{

    var token = await Service.token;
    // var BASE_URL = "https://padshareapp.com/training/create_attendance/${UserID}/";
    var BASE_URL = "http://159.203.177.220/api/card/package_distribution/${UserID}";

    try {
      print("PACKAGE USER : ${user_packageID} ${cardSerialNo} ${UserID}");
      final response = await http.post(
          Uri.parse(BASE_URL),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token['authtoken']}"
          },
          body: jsonEncode(<String, String>{
            "package_id": user_packageID.toString(),
            "serial_no": cardSerialNo,
            "agent_id": UserID
          })
      );
      print("PACKAGE USER  111: ${user_packageID} ${cardSerialNo} ${UserID}");
      //
      print("Returned-BENFICIALLY::: ${response.statusCode}");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print("Returned-BENFICIALLY::: ${result}");
        showtoast();
        // _futureScanQR();
        return response;
      } else {
        var result = jsonDecode(response.body);
        print("ERROR : ${response.statusCode}");
        // showtoastError();
        print("ERROR REGISTER : ${response.body}");
        // throw Exception();
        AlertDialog alert = AlertDialog(
          title: Text("Confirmed Package Distribution"),
          content: Text("you have successfully given out a package.."),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                // Navigator.pop(context);
              },
            ),

            // TextButton(
            //   child: Text("Create a Beneficiary"),
            //   onPressed: () {
            //     Navigator.pop(context);
            //     Navigator.of(context).pushReplacement(
            //         MaterialPageRoute(builder: (_) => RegisterBeneficiary())
            //     );
            //
            //   },
            // ),

          ],


        );

        // showDialog(context: context, builder: builder)

        Fluttertoast.showToast(
            msg: result['error'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );


       }
    }catch (e) {
      print("The exception thrown is ${e}");
    }
  }


  static  Widget showtoast(){
    var toast = Fluttertoast.showToast(
        msg: 'Packages Successfully Distributed!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    // throw toast;
  }

  static Future SendPackageScanQR({user_packageID,UserID}) async {
    try {

      var  qrResult = await BarcodeScanner.scan();
      var    result = qrResult.rawContent;
      print("DATA RESITTT:::: $result");

      registerPackage(cardSerialNo:  result.toString(),user_packageID: user_packageID,UserID: UserID);


    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
       var  result = "Camera Permission Denied";
      } else {
        print("Unkwon Error $e");
        // setState(() {
        //   result = "Unkwon Error $e";
        // });
      }
    } on FormatException {
      // setState(() {
      //   result = "You pressed the back Button";
      // });
    } catch (ex) {
      print("Unknown Errro $ex");
      // setState(() {
      //   result = "Unknown Errro $ex";
      // });
    }
  }


}
