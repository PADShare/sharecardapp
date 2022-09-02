import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';


void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class Homeds extends StatefulWidget{

  @override
  _HomedsState createState() => _HomedsState();
}

class _HomedsState extends State<Homeds>  with TickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String UserID ;

  String result = "QR";

  bool circular = true;

  var listfeed;
  var listDateStatic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserID();

    // listDateStatic = fetchAgentScanList();

    fetchData();
  }

  fetchData() async{
    final fetch =  await fetchAgentScanList();
    setState(() {
      listfeed = fetch;
    });
    print("REST ${listfeed['packages_distributed']}");
  }

  Future fetchUserID()async{


    try{
      final savedtokken = new FlutterSecureStorage();
      final Map<String,String> token = await savedtokken.readAll();
      print("USERTOKE ${token}");

      Future.delayed(Duration(seconds: 2)).then((value){
        setState(() {
          circular = false;
          UserID = token['agentID'].toString();
        });



        print("USERAGENT $UserID");
      });

    }catch(e){

    }

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return circular ? Container(
        color: Colors.deepPurpleAccent,
        child: Center( child:  CircularProgressIndicator(),)) : Theme(
        data: new ThemeData(canvasColor: Color(0xffe7edf7)),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: new GestureDetector(
              onTap: (){},
              child: FlatButton(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios , size: 30, color: Color(0xff070a4f), ),
              ),
            ),

            actions: <Widget>[
              GestureDetector(
                onTap: (){},
                child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Icon(Icons.menu, color: Colors.black, size: 30, ),
                    )
                ),
              )
            ],
          ),
          body: Center(
              child: new NestedScrollView(

                headerSliverBuilder: (BuildContext context,
                    bool boxIsScrolled) {
                  return <Widget>[

                    SliverToBoxAdapter(
                      child: new Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 242,
                          decoration: BoxDecoration(
                            color: Color(0xfff0f5fc),

                          ),
                          child: HeaderSection(context)
                      ),

                    )
                  ];
                },

                body: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff6952ed),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(38),
                          topLeft: Radius.circular(38),
                        )
                    ),
                    child: ListItems(context)
                ),


              )
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff158557),
            child: Icon(Icons.qr_code_scanner),

            onPressed: _futureScanQR,
            // QrcodeScanner();
            //   Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) => QRViewExample())
            //   );
            // print("clicked HERE ");
            // new QRReaderPreview(controller);
            // QreaderCode();





          ),
        )
    );


  }

  ListItems(context) {

    return CustomScrollView(
      slivers: <Widget>[

        SliverPadding(

          padding: EdgeInsets.only(left: 30,right: 30, top: 40, bottom: 10),

          sliver: SliverGrid(

            delegate: SliverChildListDelegate(
                [
                  // new Padding(padding: EdgeInsets.only(top: 12)),

                  new Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Color(0xff7d67f9)
                        color: Color(0xff7d67f9)
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(listfeed['packages_distributed'] == List.empty() ? "NO DATA" : listfeed['packages_distributed'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Packs Given", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  new Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Color(0xff7d67f9)
                        color: Color(0xff7d67f9)
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(listfeed['cards_scanned_today'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Scanned", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                  new Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Color(0xff7d67f9)
                        color: Color(0xff7d67f9)
                    ),

                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Text(listfeed['packages_distributed'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Account", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),

                ]
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 40 ),
          ),

        ),



        SliverToBoxAdapter(
            child: new Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(38),
                      topLeft: Radius.circular(38),
                    )
                ),

                child: FutureBuilder(
                  future: downloadData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){

                    if(snapshot.connectionState == ConnectionState.waiting){

                      return  Center(child: Text('Please wait its loading...'));

                    }else{
                      if (snapshot.hasError)
                        return Center(child: Text('Error: ${snapshot.error}'));
                      else
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index){

                            // return new Text(snapshot.data[index]['beneficiary']);
                            return snapshot.data[index] == null ? Center(child: Text("No scanned Cards yet", style:TextStyle(color: Colors.black54, fontSize: 19, fontWeight: FontWeight.w400))) : Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                              child: new Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffe2dff5),
                                    border: Border.all(color: Color(0xfff1f5fa), width: 1, style: BorderStyle.solid)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left:8.0, right: 8),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.qr_code, size: 20, color: Color(0xff394e62),) ,
                                      new Text("|", style: TextStyle(color: Color(0xff394e62)),),
                                      new Text(snapshot.data[index]['card_scanned'], style: TextStyle(color: Color(0xff394e62), fontSize: 15),),
                                      new Text(snapshot.data[index]['delivered_at'], style: TextStyle(color: Color(0xff394e62), fontSize: 13),),
                                      Icon(Icons.check_circle, color: Colors.green,)
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },

                        );  // snapshot.data  :- get your object which is pass from your downloadData() function
                    }

                    return new Center(child: CircularProgressIndicator(),);

                  },
                )

              // child: new ListView(
              //
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              //       child: new Container(
              //         height: 40,
              //         width: MediaQuery.of(context).size.width,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(20),
              //             color: Color(0xffe2dff5),
              //             border: Border.all(color: Color(0xfff1f5fa), width: 1, style: BorderStyle.solid)
              //         ),
              //         child: Padding(
              //           padding: const EdgeInsets.only(left:8.0, right: 8),
              //           child: new Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Icon(Icons.qr_code, size: 20, color: Color(0xff394e62),) ,
              //               new Text("|", style: TextStyle(color: Color(0xff394e62)),),
              //               new Text("300495784839384930", style: TextStyle(color: Color(0xff394e62), fontSize: 15),),
              //               new Text("Mar 02,2021", style: TextStyle(color: Color(0xff394e62), fontSize: 13),),
              //               Icon(Icons.check_circle, color: Colors.green,)
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

            )
        ),

      ],
    );
  }

  HeaderSection(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[




          new Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),

            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: new Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Color(0xff2CA985), width: 3),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/avatarUserProfile.png")
                        )
                    ),
                  ),
                ),
                new Container(
                  padding: EdgeInsets.only(top: 13, left: 15)
                  ,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 6.51),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text("Pads Agent", style: GoogleFonts.roboto(color: Color(0xff515587), fontSize: 19, fontWeight: FontWeight.w600),),
                        new Text("AGENT ID:${UserID.toString()}", style: GoogleFonts.roboto(color: Color(0xff515587), fontSize: 12, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )

        ],
      ),
    );
  }


  Future _futureScanQR() async{

    try{
      var  qrResult = await BarcodeScanner.scan();

      setState(() {
        result = qrResult as String;
      });

      print("DATA RESITTT:::: $result");

      var params = {
        "agent_id":3072,
        "card_scanned":result
      };

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
        Uri.http("padshareapp.com", "api/card/scan/"),
        headers: {
          'Content-Type': 'application/json',
        },

        body: jsonEncode(<String,String>{
          "agent_id":  UserID,
          "card_scanned": result
        }),

      );

      print("FILECODE:${response.statusCode}");
      print("FILE:${jsonDecode(response.body)}");
      final data = jsonDecode(response.body);
      if(response.statusCode == 400){

        print(data['error']);

        AlertDialog alertDialog = new AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),

          ),
          title: Text('Wrong Card Scanned',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
          content: Text("Scanning Card: ${data['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
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


  Future<dynamic> fetchAgentScanList () async{

    final savedtokken = new FlutterSecureStorage();
    final Map<String,String> token = await savedtokken.readAll();
    print("USERDDDDD ${token['agentID']}");

    // print("HERE $UserID");

    try{

      final resultd  =  await http.get(
        Uri.https(
          "padshareapp.com","api/card/distribution_metrics/${token['agentID']}/",
        ),
      );

      var data = jsonDecode(resultd.body);
      print("RESULT ${resultd.statusCode}");
      if(resultd.statusCode == 200){

        return json.decode(resultd.body);

      }else{

        // throw Exception("Not Able to Fetch Data...");

        print (data);
      }

    }
    catch(e){
      print(e);

    }


  }


  Future<dynamic> downloadData()async{
    final savedtokken = new FlutterSecureStorage();
    final Map<String,String> token = await savedtokken.readAll();
    print("USERDDDDD ${token['agentID']}");

    // var response =  await http.get('http://padshareapp.com/api/card/scan_summary/${token['agentID']}/');
    var response =  await http.get(Uri.parse('padshareapp.com/api/card/scan_summary/${token['agentID']}/'));
    return jsonDecode(response.body);//  return your response
  }



// void _onQRViewCreated(QRViewController _qrviewController){
//   this.controller = _qrviewController;
//   controller.scannedDataStream.listen((scan) {
//     setState(() {
//       result = scan;
//     });
//
//   });
// }
// @override
// void dispose() {
//   // TODO: implement dispose
//   controller?.dispose();
//   super.dispose();
// }


}