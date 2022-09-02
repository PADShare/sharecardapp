import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharecard_app/core/service/service.dart';
import 'package:sharecard_app/models/packages.dart';
import 'package:sharecard_app/models/profile.dart';
import 'package:sharecard_app/models/questions_model.dart';
import 'package:sharecard_app/models/trainings.dart';
import 'package:sharecard_app/ui/pages/assessment/assessments.dart';
import 'package:sharecard_app/ui/pages/assessment/farm_assess/farm_assessment_form_1.dart';
import 'package:sharecard_app/ui/pages/assessment/farm_assess/farm_assessment_form_2.dart';
import 'package:sharecard_app/ui/pages/assessment/questions_assessment.dart';
import 'package:sharecard_app/ui/pages/register_beneficiary_detail/beneficiary_detail.dart';
import 'package:sharecard_app/utils/custom_dialogBox.dart';
import 'package:sharecard_app/utils/networkservice.dart';


void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class Home extends StatefulWidget{

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with TickerProviderStateMixin{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final ValueNotifier<double> onclick = ValueNotifier<double>(0.33);
  final ValueNotifier<int> questions = ValueNotifier<int>(0);
  TextEditingController _questionAswerController = TextEditingController();
  var totalquestions;
  bool isdiabledClick;
  var listDateStatic;
  var defaultQuestion = 0;
  bool _isPressed;
  List<dynamic> results;
  int _counts = 0;
  List numberedCounts = [];
  List<Questions_model> FinalQuestion = List<Questions_model>();

  var onclickvalue = 0.3;

  Map<String, String> headers = {
    'Access':'application/json',
    'Content-Type': 'application/json'
  };

  String UserID ;

  String result = "QR";

  bool circular = true;
  bool isloading = true;

  var listfeed;
  // var listDateStatic;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _userVerification  =  TextEditingController();

  Profile profile;

  File image;

  List list;

  List<Packages> packs;

  String defaultValue = "select Category";

  int user_packageID;
  int packageId;

  _result() async {
    var reponse = await Service.getfeedbacks();

    Future.delayed(Duration(milliseconds: 20)).then((value) =>
    {
      setState(() {
        results = reponse;
      })
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getpic();
    _result();
    super.initState();
    fetchUserID();
    fetchData();

  }

  fetchData() async{
    final fetch =  await Service.fetchAgentScanList();
     setState(() {
       listfeed = fetch;
     });
    print("REST ${listfeed['packages_distributed']}");
    Service.getPackages(UserID).then((packages){
      // Packages packs  = value;
      List<Packages> stringList = packages.cast<Packages>();
      print("PACKAGE 2: ${stringList}");
      setState(() {
        packs = stringList;
      });
    });
  }

  Future fetchUserID()async{

 try{
      final savedtokken = new FlutterSecureStorage();
      final Map<String,String> token = await savedtokken.readAll();
      print("USERTOKE ${token}");

      Future.delayed(Duration(seconds: 5)).then((value){
        setState(() {
          UserID = token['agentID'].toString();
          // UserID ='5330';
          // circular= false;
        });



        print("USERAGENT $UserID");

      });

    }catch(e){

    }

  }
  // print("UUID:$UserID");
  getpic()async{
    final savedtokken = new FlutterSecureStorage();
    final Map<String,String> token = await savedtokken.readAll();
    print("UUU ${token['agentID'].toString()}");

    setState(() {
      UserID = token['agentID'].toString();
    });
    print("UUID:$UserID");
    var result = await NetworkService.getProfile(UserID);
    Future.delayed(Duration(seconds: 6)).then((value) =>{
    setState(() {
    profile = result;
    isloading = false;
    circular= false;
    })
    });
    debugPrint("Result:${result}");
  }
  var user_traningID;
  var user_traningSerialID;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('Prod${profile}');

    return circular ? Container(
        color: Colors.deepPurpleAccent,
        child: Center( child:  CircularProgressIndicator(),)) : Theme(
        data: new ThemeData(canvasColor: Color(0xffe7edf7)),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: new AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              Builder(
                builder: (context)=>GestureDetector(
                  onTap:  () => Scaffold.of(context).openDrawer(),
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
                ),
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff2C2063),
                    // image: DecorationImage(
                    //     image: AssetImage("assets/images/PADSAGENT.png"),
                    //     fit: BoxFit.cover)

                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 25,
                    backgroundImage: isloading ? AssetImage("assets/images/sampleAvator.png") : image != null ? FileImage(image) : profile.profile_pic == null ? AssetImage("assets/images/sampleAvator.png"):  NetworkImage(profile.profile_pic)),
                    // backgroundImage: profile.profile_pic == null ? AssetImage(
                    //     "assets/images/avatarUserProfile.png") : NetworkImage(profile.profile_pic),),
                  accountName: Text(profile.agent_name ?? 'ShareCard', style: TextStyle(fontSize: 20),),
                  // accountName: Text('AGENT', style: TextStyle(fontSize: 20),),
                  // accountEmail: Text("ShareCard"),
                ),

                FutureBuilder(
                  // future: Service.getTrainings(profile.agent_id),
                  future: Service.getTrainings(UserID),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;

                      print("TR ${data}");
                      return ExpansionTile(title: Text("Trainings",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight
                            .w600),
                      ),
                          children: List.generate(
                              data.length
                              , (index) {
                            Training training = data[index];
                            print(training.form);
                            return  ExpansionTile(
                                title: Text(training.training_name,
                                  style: TextStyle(fontSize: 16,
                                      fontWeight: FontWeight.w400),),

                                children: List.generate(training.form.length,(index){
                                  var formdata = training.form[index];
                                 return ListTile(
                                   onTap: () {
                                     Navigator.pop(context);
                                     setState(() {
                                       // user_traningID = training.id;
                                       // user_traningSerialID = training.training_uid;
                                       // user_traningSerialID = training.training_id;
                                     });
                                     // alertMessage(training.training_name);
                                     // _futureScanQR();
                                     Navigator.of(context).pushReplacement(MaterialPageRoute(
                                         builder: (_)=> FormAssessments(url: formdata['form'],)
                                     ));
                                   },
                                   title: Text(formdata['title'],
                                     style: TextStyle(fontSize: 16,
                                         fontWeight: FontWeight.w400),),
                                 );
                            }));
                          }
                          )
                      );
                    }

                    return Text("getting Trainings");
                  },
                ),
                FutureBuilder(
                  // future: Service.getTrainings(profile.agent_id),
                  future: Service.getPackages(UserID),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;

                      print(data);
                      return ExpansionTile(title: Text("Package Delivery",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight
                            .w600),
                      ),
                          children: List.generate(
                              data.length
                              , (index) {
                            Packages packages = data[index];

                            return new ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                setState(() {
                                  packageId = packages.id;
                                  // user_traningSerialID = training.training_uid;
                                  user_packageID = packages.id;
                                });
                                alertMessageDistribution(packages.name);
                                // _futureScanQR();
                              },
                              title: Text(packages.name,
                                style: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w400),),
                            );
                          })
                      );
                    }

                    return Text("getting Trainings");
                  },
                ),
                // new ListTile(
                //   onTap:(){
                //      Navigator.of(context).pop();
                //     _futureScanQR();
                //   },
                //   title: Text('Package Delivery',
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                //   trailing: Icon(Icons.keyboard_arrow_down_rounded, size: 25, color:Colors.grey),
                // ),
              ExpansionTile(
                title: Text('Beneficiary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                subtitle: Text('Take assessments'),
                children: [
                  new ListTile(
                    onTap:(){
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => RegisterBeneficiary())
                      );
                    },
                    title: Text('Create Beneficiary',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded, size: 25, color:Colors.grey),
                  ),
                  new ListTile(
                    onTap:(){
                      // Navigator.of(context).pop();
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (_) => RegisterBeneficiary())
                      // );
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (_) => FarmAssessmentFormOne())
                      // );

                      _initiateAssessmentForm();

                    },
                    title: Text('Farm Assessment',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded, size: 25, color:Colors.grey),
                  ),
                  new ListTile(
                    onTap:(){
                      Navigator.of(context).pop();
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (_) => RegisterBeneficiary())
                      // );
                      _initiateFarmAssessment();
                    },
                    title: Text('Farmer Assessment',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                    trailing: Icon(Icons.keyboard_arrow_down_rounded, size: 25, color:Colors.grey),
                  )
                ],
              ),



              ],),
          ),
          body: NestedScrollView(
            key: UniqueKey(),
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
            body: Center(
              child: new Stack(
                children: [

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff6952ed),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(38),
                        topLeft: Radius.circular(38),
                      ),
                    ),
                    child: CustomScrollView(
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
                                        new Text(listfeed == null ? "0" : listfeed['packages_distributed'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text("Packs Given", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                                      ],
                                      // ]
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
                                        // cards_scanned_today
                                        new Text(listfeed == null ? '0' : listfeed['packages_distributed'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
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
                                        //listfeed['packages_distributed'].toString()
                                        new Text('0', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 5,),
                                        Text("Assessment", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
                                      ],
                                    ),
                                  ),

                                ]
                            ),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 40 ),
                          ),

                        ),

                      ],
                    ),
                  ),

                  Container(
                      margin: const EdgeInsets.only(top: 160),
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
                        future: Service.downloadData(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){

                          if(snapshot.connectionState == ConnectionState.waiting){

                            return  Center(child: Text('Please wait its loading...'));

                          }else{
                            if (snapshot.hasError)
                              // return Center(child: Text('Error: ${snapshot.error}'));
                              return Center(child: Text('No Connection..please check your network'));
                            else
                              return ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index){

                                  // return new Text(snapshot.data[index]['beneficiary']);
                                  return snapshot.data[index] == null ? Center(child: Text("No scanned Cards yet", style:TextStyle(color: Colors.black54, fontSize: 19, fontWeight: FontWeight.w400))) : Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                                    child: new Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Color(0xffe2dff5),
                                          border: Border.all(color: Color(0xfff1f5fa), width: 1, style: BorderStyle.solid)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:5.0, right: 5),
                                        child: new Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.qr_code, size: 20, color: Color(0xff394e62),),
                                            new Text("|", style: TextStyle(color: Color(0xff394e62)),),
                                            new Text(snapshot.data[index]['card_scanned'], style: TextStyle(color: Color(0xff394e62), fontSize: 12),),
                                            new Text(snapshot.data[index]['delivered_at'], style: TextStyle(color: Color(0xff394e62), fontSize: 9),),
                                            Icon(Icons.check_circle, color: Colors.green,)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },

                              );  // snapshot.data  :- get your object which is pass from your downloadData() function
                          }

                          // return new Center(child: CircularProgressIndicator(),);

                        },
                      )
                  )


                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: FloatingActionButton(
                    heroTag: null,
                    backgroundColor: Color(0xffcd1313),
                    child: new Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(Icons.add),
                        new Text("attach Card", textAlign: TextAlign.center, style: TextStyle(fontSize: 13),)
                      ],
                    ),

                    // onPressed: _futureScanQR,
                    onPressed:  ()async{

                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //   builder: (_)=> AssessmentQuestions()
                      // ));
                      await  _initiateBeneficiaryQCode();




                     //// await _initiateQCode();
                      //// await _futureScanQR();

                    },
                    // QrcodeScanner();
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (_) => QRViewExample())
                    //   );
                    // print("clicked HERE ");
                    // new QRReaderPreview(controller);
                    // QreaderCode();





                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Color(0xff158557),
                  child: Icon(Icons.qr_code_scanner),

                  // onPressed: _futureScanQR,
                  // onPressed:  _futureScanQR,
                  onPressed: (){
                    _counts += 1;



                    _futureScanQR();

                  },
                      //()async{
                    // await _initiateQCode();
                    // await _futureScanQR();

                 // },
                  // QrcodeScanner();
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (_) => QRViewExample())
                  //   );
                  // print("clicked HERE ");
                  // new QRReaderPreview(controller);
                  // QreaderCode();

                ),
              ],
            ),
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
                        Text(
                          '4'
                        ),
                        // new Text(listfeed['cards_scanned_today'].toString(), style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
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
                        Text("Assessment", style: TextStyle(color: Colors.white38, fontSize: 13, fontWeight: FontWeight.w200), textAlign: TextAlign.center,),
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
                  future: Service.downloadData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot){

                    if(snapshot.connectionState == ConnectionState.waiting){

                      return  Center(child: Text('Please wait its loading...'));

                    }else{
                      if (snapshot.hasError)
                        return Center(child: Text('Snapshot-Error: ${snapshot.error}'));
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
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      new Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Color(0xff2CA985), width: 3),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: isloading ? AssetImage("assets/images/sampleAvator.png") : image != null ? FileImage(image) :profile.profile_pic == null ? AssetImage("assets/images/sampleAvator.png") : NetworkImage(profile.profile_pic)
                                // image:AssetImage("assets/images/sampleAvator.png")
                              // AssetImage("assets/images/avatarUserProfile.png")
                            )
                        ),
                      ),
                      Positioned(
                        top: 23,
                        right: -8,
                        child: InkWell(
                            onTap:Uploadimage,
                            child: Icon(Icons.camera_alt, color: Colors.deepOrangeAccent, size: 24,)),
                      )
                    ],
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
                        new Text("ShareAgent", style: GoogleFonts.roboto(color: Color(0xff515587), fontSize: 19, fontWeight: FontWeight.w600),),
                        new Text("AGENT ID:${UserID.toString()}", style: GoogleFonts.roboto(color: Color(0xff515587), fontSize: 12, fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                ),

              ],
            ),

          ),



        ],
      ),
    );
  }


   Future _initiateBeneficiaryQCode() async{

    try{

      return await showDialog(
          context: context,
          builder: (BuildContext context){
            return CustomDialogBox(
              title: "Verify Beneficiary ID",
              text: Form(
                key: _formKey,
                child: new TextFormField(
                  controller: _userVerification,
                  validator: (value){
                    if(value.isEmpty || value.length < 4){

                      return "please provide verification ID";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Verification",
                     // focusedBorder: InputBorder.none,
                     // focusedErrorBorder: InputBorder.none
                  ),

                ),
              ),

              descriptions: "Exp:{0000}",
              button:FlatButton(
                child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
                onPressed: (){

                  // _futureScanQR();
                  if(_formKey.currentState.validate()){
                    Navigator.of(context).pop();
                    // _futureScanQR();

                    _SeachBeneficiaryID(_userVerification.text.trim());
                  }
                },
              )
              // button: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     FlatButton(
              //       child: Text("Create Beneficialy", style: TextStyle(fontSize: 14, color:Colors.deepOrangeAccent),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         // if(_formKey.currentState.validate()){
              //           // _SeachBeneficiaryID(_userVerification.text.trim());
              //           // Navigator.of(context).pop();
              //           // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //           //   builder: (_)=> RegisterBeneficiary()
              //           // ));
              //           // _futureScanQR();
              //           // _AddBeneficiaryCard();
              //         // }
              //       },
              //     ),
              //     FlatButton(
              //       child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         if(_formKey.currentState.validate()){
              //           Navigator.of(context).pop();
              //           // _futureScanQR();
              //
              //          _SeachBeneficiaryID(_userVerification.text.trim());
              //         }
              //       },
              //     )
              //   ],
              // ),

            );
          }
      );

    }catch(e){

    };
  }

  _AssessmentBeneficiary(verification)async{
    _onLoading(context);
    final result = await http.get(
      // Uri.parse('https://padshareapp.com/api/card/get_id/'),
        Uri.parse('http://159.203.177.220/api/card/check_id/$verification'),
        headers: {
          "Accept":"application/json"
        }
    );
    print('RETURN DATA QQ:: ${json.decode(result.body)}');
    final beneficiarym = json.decode(result.body);
    if(result.statusCode == 200){
      List myBeneficiary = [];
      final beneficiaryIDs = json.decode(result.body);
      print('RETURN DATA QQ:: ${json.decode(result.body)}');
       await Service.addBeneficiaryCard(profile.agent_id,result,verification,context);
        showtoast();

    }
   if(result.statusCode == 400){
      // return  json.decode(result.body);
     Navigator.pop(context);
     alertDialogError(beneficiarym['error']);
     //  alertDialogs();
    }

  }
  _SeachBeneficiaryID(verification)async{
    _onLoading(context);
    final result = await http.get(
      // Uri.parse('https://padshareapp.com/api/card/get_id/'),
      Uri.parse('http://159.203.177.220/api/card/get_id'),
      headers: {
        "Accept":"application/json"
      }
    );

    if(result.statusCode == 200){
       List myBeneficiary = [];
     final beneficiaryIDs = json.decode(result.body);
      print('RETURN DATA:: ${json.decode(result.body)}');

      print("ENTERD ID 0:: ${beneficiaryIDs}");
       print("ENTERD ID 1:: ${beneficiaryIDs.contains(int.parse(verification))}");
       myBeneficiary.addAll(beneficiaryIDs);
       print(myBeneficiary);
       // print("ENTERD ID 2:: ${myBeneficiary.add(beneficiaryIDs).contain(int.parse(verification))}");
     // showtoast();

       if(beneficiaryIDs.contains(int.parse(verification))){
         Navigator.pop(context);
         // await Service.addBeneficiaryCard(profile.agent_id,result,verification,context);
         _AssessmentBeneficiary(int.parse(verification));
         showtoast();
         setState(() {
           _userVerification.text = "";
         });
       }else{
         Navigator.pop(context);
         alertDialogs();
       }


       // for(var i=0; i<beneficiaryIDs.length; i++){
       //   print("CHECK ${int.parse(verification)}");
       //   print("CHECK ${beneficiaryIDs[i]}");
       //   if(beneficiaryIDs[i] == int.parse(verification)){
       //     print("success :: 2");
       //     Navigator.pop(context);
       //     print("PROFILE::${_userVerification.text}");
       //     // showtoast();
       //     await Service.addBeneficiaryCard(profile.agent_id,result,verification,context);
       //     setState(() {
       //       _userVerification.text = "";
       //     });
       //   }else{
       //     Navigator.pop(context);
       //     print("no Match Found Here ${beneficiaryIDs[i].runtimeType}");
       //     // Navigator.of(context).pop();
       //     setState(() {
       //       _userVerification.text = "";
       //     });
       //     // alertDialogs();
       //     // Navigator.of(context).pushReplacement(MaterialPageRoute(
       //     //     builder: (_)=> RegisterBeneficiary()
       //     // ));
       //   }
       // }

    }
  }

  _SeachBeneficiaryIDAssessment(verification)async{
    _onLoading(context);
    final result = await http.get(
      // Uri.parse('https://padshareapp.com/api/card/get_id/'),
        Uri.parse('http://159.203.177.220/api/card/get_id'),
        headers: {
          "Accept":"application/json"
        }
    );

    if(result.statusCode == 200){
      List myBeneficiary = [];
      final beneficiaryIDs = json.decode(result.body);
      print('RETURN DATA:: ${json.decode(result.body)}');

      print("ENTERD ID 0:: ${beneficiaryIDs}");
      print("ENTERD ID 1:: ${beneficiaryIDs.contains(int.parse(verification))}");
      myBeneficiary.addAll(beneficiaryIDs);
      print(myBeneficiary);
      if(beneficiaryIDs.contains(int.parse(verification))){
        Navigator.pop(context);
        // await Service.addBeneficiaryCard(profile.agent_id,result,verification,context);
        //
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => FarmAssessmentFormOne(agent_id:profile.agent_id, beneficiary_id:verification))
        );

        Fluttertoast.showToast(
            msg: 'Beneficiary Found!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
        setState(() {
          _userVerification.text = "";
        });
      }else{
        Navigator.pop(context);
        alertDialogs();
      }


    }
  }
  _SeachFarmAssessment(verification)async{
    _onLoading(context);
    final result = await http.get(
      // Uri.parse('https://padshareapp.com/api/card/get_id/'),
        Uri.parse('http://159.203.177.220/api/form/get_assessment_id'),
        headers: {
          "Accept":"application/json"
        }
    );

    if(result.statusCode == 200){
      List myBeneficiary = [];
      final beneficiaryIDs = json.decode(result.body);
      print('RETURN DATA:: ${json.decode(result.body)}');

      print("ENTERD ID 0:: ${beneficiaryIDs}");
      print("ENTERD ID 1:: ${beneficiaryIDs.contains(int.parse(verification))}");
      myBeneficiary.addAll(beneficiaryIDs);
      print(myBeneficiary);
      if(beneficiaryIDs.contains(int.parse(verification))){
        Navigator.pop(context);
        // await Service.addBeneficiaryCard(profile.agent_id,result,verification,context);
        //
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => FarmAssessmentFormTWO(agent_id:profile.agent_id, code: verification,))
        );

        Fluttertoast.showToast(
            msg: 'Farm Assessment Found!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.blueGrey,
            textColor: Colors.white,
            fontSize: 16.0
        );
        setState(() {
          _userVerification.text = "";
        });
      }else{
        Navigator.pop(context);
        alertDialogs();
      }


    }
  }

  Future _initiateAssessmentForm() async{

    try{

      return await showDialog(
          context: context,
          builder: (BuildContext context){
            return CustomDialogBox(
                title: "Verify Beneficiary ID",
                text: Form(
                  key: _formKey,
                  child: new TextFormField(
                    controller: _userVerification,
                    validator: (value){
                      if(value.isEmpty || value.length < 4){

                        return "please provide verification ID";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Verification",
                      // focusedBorder: InputBorder.none,
                      // focusedErrorBorder: InputBorder.none
                    ),

                  ),
                ),

                descriptions: "Exp:{0000}",
                button:FlatButton(
                  child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
                  onPressed: (){

                    // _futureScanQR();
                    if(_formKey.currentState.validate()){
                      Navigator.of(context).pop();
                      // _futureScanQR();

                      _SeachBeneficiaryIDAssessment(_userVerification.text.trim());
                    }
                  },
                )
              // button: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     FlatButton(
              //       child: Text("Create Beneficialy", style: TextStyle(fontSize: 14, color:Colors.deepOrangeAccent),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         // if(_formKey.currentState.validate()){
              //           // _SeachBeneficiaryID(_userVerification.text.trim());
              //           // Navigator.of(context).pop();
              //           // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //           //   builder: (_)=> RegisterBeneficiary()
              //           // ));
              //           // _futureScanQR();
              //           // _AddBeneficiaryCard();
              //         // }
              //       },
              //     ),
              //     FlatButton(
              //       child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         if(_formKey.currentState.validate()){
              //           Navigator.of(context).pop();
              //           // _futureScanQR();
              //
              //          _SeachBeneficiaryID(_userVerification.text.trim());
              //         }
              //       },
              //     )
              //   ],
              // ),

            );
          }
      );

    }catch(e){

    };
  }
  Future _initiateFarmAssessment() async{

    try{

      return await showDialog(
          context: context,
          builder: (BuildContext context){
            return CustomDialogBox(
                title: "Verify Farm Assessment",
                text: Form(
                  key: _formKey,
                  child: new TextFormField(
                    controller: _userVerification,
                    validator: (value){
                      if(value.isEmpty || value.length < 4){

                        return "please provide verification ID";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Verification",
                      // focusedBorder: InputBorder.none,
                      // focusedErrorBorder: InputBorder.none
                    ),

                  ),
                ),

                descriptions: "Exp:{0000}",
                button:FlatButton(
                  child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
                  onPressed: (){

                    // _futureScanQR();
                    if(_formKey.currentState.validate()){
                      Navigator.of(context).pop();
                      // _futureScanQR();

                      _SeachFarmAssessment(_userVerification.text.trim());
                    }
                  },
                )
              // button: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     FlatButton(
              //       child: Text("Create Beneficialy", style: TextStyle(fontSize: 14, color:Colors.deepOrangeAccent),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         // if(_formKey.currentState.validate()){
              //           // _SeachBeneficiaryID(_userVerification.text.trim());
              //           // Navigator.of(context).pop();
              //           // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //           //   builder: (_)=> RegisterBeneficiary()
              //           // ));
              //           // _futureScanQR();
              //           // _AddBeneficiaryCard();
              //         // }
              //       },
              //     ),
              //     FlatButton(
              //       child: Text("Continue", style: TextStyle(fontSize: 14,color:Colors.green),),
              //       onPressed: (){
              //
              //         // _futureScanQR();
              //         if(_formKey.currentState.validate()){
              //           Navigator.of(context).pop();
              //           // _futureScanQR();
              //
              //          _SeachBeneficiaryID(_userVerification.text.trim());
              //         }
              //       },
              //     )
              //   ],
              // ),

            );
          }
      );

    }catch(e){

    };
  }




 Future _futureScanQR() async{

    try{
      // await _initiateQCode();

      var token = await Service.token;

      var  qrResult = await BarcodeScanner.scan();

       setState(() {
         result = qrResult.rawContent ;
       });

       print("DATA RESITTT:::: ${qrResult.rawContent.toString()}");

      print("COUNTING HERE:${_counts}");


      // GetStorage().write('cardScan', numberedCounts);
      //
      // print('storedLIST: ${numberedCounts.map((e) => e)}');
      // print('stored CARDS LIST: ${numberedCounts.length}');
        numberedCounts.add(qrResult.rawContent);
        GetStorage().write('cardScan', numberedCounts);

     var response  = await GetStorage().read('cardScan');

      print('Stored : ${response}');
      list = new List.from(response)..add(qrResult.rawContent);
      if(list.contains(qrResult.rawContent.toString())){
        GetStorage().write('cardScan', list);

        var response  = await GetStorage().read('cardScan');
        print('Stored : #:  \n ${response}');

        var counting = list.where((element) => element == qrResult.rawContent.toString()).toList();
        print("STORED ${counting.length}: ");
        if(counting.length == 5){

          setState(() {
            _initiateFeedback();
          });
        }
      }

      // if(response == null){
      //
      //   numberedCounts.add(qrResult.rawContent);
      //   GetStorage().write('cardScan', numberedCounts);
      //   print('Value Conatiner \n $list');
      //
      // }else{
      //   list = new List.from(response)..add(qrResult.rawContent);
      //        // list.add(qrResult.rawContent);
      //           await GetStorage().erase();
      //           numberedCounts.add(qrResult.rawContent);
      //           GetStorage().write('cardScan', numberedCounts);
      //       // print('Stored : #:${list}  \n ${list.contains(qrResult.rawContent.toString())}');
      //   if(list.contains(qrResult.rawContent.toString())){
      //
      //     list..add(qrResult.rawContent.toString());
      //
      //     print('Value Conatiner \n $list');
      //     var counting = list.where((element) => element == qrResult.rawContent.toString()).toList();
      //     print('Value Conatiner : $counting');
      //   }else{
      //     setState(() {
      //       numberedCounts.add(qrResult.rawContent);
      //       GetStorage().write('cardScan', numberedCounts);
      //     });
      //
      //   }
      // //   // list.add(qrResult.rawContent);
      // //   // print("NEW LIST ${list.map((e) => e)}");
      // }

        if(response.length == 4){

        setState(() {
          // _initiateFeedback();
        });
      }

       var params = {
         "agent_id":3072,
         "card_scanned":result
       };
      print("PACKAGE 00: ");
    Service.getPackages(UserID).then((packages){
      // Packages packs  = value;
      List<Packages> stringList = packages.cast<Packages>();
      print("PACKAGE 2: ${stringList}");
      setState(() {
        packs = stringList;
      });
    });



      AlertDialog alertDialog = new AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),

        ),
        title: new Text("PADCard Scanned"),
        // content: Text(" ${data['success']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("successfully scanned card, proceed to distribute package",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),



        SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(6)
              ),
              child:         StatefulBuilder(builder: (BuildContext context, StateSetter dropDownState){
                return DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    // value: defaultValue,
                    items:packs.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name) );


                    }).toList() ?? [],

                    onChanged: (String values){

                      dropDownState(() {
                        defaultValue = values;
                      });
                      print("SELETED ITEM :: ${defaultValue}");
                    },
                    value: defaultValue,
                    icon: Icon(Icons.keyboard_arrow_down_sharp,),
                    iconSize: 20,
                    elevation: 1,
                    style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 12
                    ),

                  ),
                );
              })),
          ],
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                );
              }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
        ],
      );

      showDialog(context: context,
          builder: (_) => alertDialog
      );

      // final responses = await http.post(
      //   // Uri.http("padshare.herokuapp.com", "api/card/scan/"),
      //   // Uri.https("padshareapp.com", "api/card/scan/"),
      //   Uri.https("sharecardsapp.herokuapp.com", "api/card/scan/"),
      //   headers: {
      //     "Accept":"application/json",
      //     'Content-Type': 'application/json',
      //     "Authorization" : "Bearer ${token['authtoken']}"
      //   },
      //
      //   body: jsonEncode(<String,String>{
      //     "agent_id":  UserID,
      //     "card_scanned": result.toString()
      //   }),
      //
      // );
      //
      // print("FILECODE:${responses.statusCode}");
      // print("FILE:${jsonDecode(responses.body)}");
      // final data = jsonDecode(responses.body);
      // if(responses.statusCode == 400){
      //
      //   print(data['error']);
      //
      //   AlertDialog alertDialog = new AlertDialog(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(25),
      //
      //     ),
      //     //wrong card scanned
      //
      //     title: Text('PADCard is already Scanned',style: GoogleFonts.roboto(fontWeight: FontWeight.w700, fontSize: 20)),
      //     content: Text("Scanning Card: ${data['error']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
      //     actions: <Widget>[
      //       FlatButton(
      //           onPressed: (){
      //             Navigator.pop(context);
      //             Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(builder: (context) => Home()),
      //                   (Route<dynamic> route) => false,
      //             );
      //           }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
      //     ],
      //   );
      //
      //   showDialog(context: context,
      //       builder: (_) => alertDialog
      //   );
      //
      // }
      // print("RESPONSE :: ${responses}");
      // print("RESPONSE :: ${responses.statusCode}");
      // if(responses.statusCode == 200){
      //   AlertDialog alertDialog = new AlertDialog(
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(25),
      //
      //     ),
      //     title: new Text("PADCard Scanned"),
      //    // content: Text(" ${data['success']}",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
      //     content: Text("successfully scanned card, proceed to distribute package",style: GoogleFonts.openSans(fontWeight: FontWeight.w500, fontSize: 16)),
      //     actions: <Widget>[
      //       FlatButton(
      //           onPressed: (){
      //             Navigator.pop(context);
      //             Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(builder: (context) => Home()),
      //                   (Route<dynamic> route) => false,
      //             );
      //           }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
      //     ],
      //   );
      //
      //   showDialog(context: context,
      //       builder: (_) => alertDialog
      //   );
      // }
      //
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
      //             Navigator.pushAndRemoveUntil(
      //               context,
      //               MaterialPageRoute(builder: (context) => Home()),
      //                   (Route<dynamic> route) => false,
      //             );
      //           }, child: Text("OK",style: GoogleFonts.openSans(fontWeight: FontWeight.w700, fontSize: 18)))
      //     ],
      //   );
      //
      //   showDialog(context: context,
      //       builder: (_) => alertDialog
      //   );
      //
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



  Widget alertDialogs(){
    AlertDialog alert = AlertDialog(
      title: Text("No beneficiary found"),
      content: Text("Please consider creating a new Beneficiary"),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        TextButton(
          child: Text("Create a Beneficiary"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => RegisterBeneficiary())
                  );

          },
        ),

      ],


    );


    showDialog(context: context, builder: (_)=> alert);



  }
  Widget alertDialogError(message){
    AlertDialog alert = AlertDialog(
      title: Text(message),
      content: Text("Please consider taking the Assessment if You haven't already.Thank you"),
      actions: [

        TextButton(
          child: Text("continue,Dashboard"),
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



  Future _SendTrainingScanQR() async {
    try {
      // await _initiateQCode();

     var  qrResult = await BarcodeScanner.scan();

      setState(() {
        result = qrResult.rawContent;
      });

      print("DATA RESITTT:::: $result");

      var params = {
        "agent_id": 3072,
        "card_scanned": result.toString()
      };

      registerAttendace(cardSerialNo:  result.toString());



    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        result = "Camera Permission Denied";
      } else {
        setState(() {
          result = "Unkwon Error $e";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back Button";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Errro $ex";
      });
    }
  }



  Widget alertMessage(String training) {
    AlertDialog alertDialog = AlertDialog(
      title: Center(
          child: Text("COMFIRM YOUR ATTENDANCE")
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Column(
            children: [
              Text(
                  "Please confirm your attendance for this Training :"),
              Text(
                  "$training", style:TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w400)),
            ],
          )),
        ],
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)
            ),

            onPressed: () {
              Navigator.pop(context);

            }, child: Text("Cancel")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
            ),
            onPressed: () {
              Navigator.pop(context);
              // _onLoading(context);
              _onLoad(context);

            }, child: Text("Comfirm",))
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }
  Widget alertMessageDistribution(String training) {
    AlertDialog alertDialog = AlertDialog(
      title: Center(
          child: Text("COMFIRM DISTRIBUTION")
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Row(
            children: [
              Text(
                  "Selected Package :"),
              Text(
                  "$training", style:TextStyle(color: Colors.deepOrangeAccent, fontWeight: FontWeight.w400)),
            ],
          )),
        ],
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black)
            ),

            onPressed: () {
              Navigator.pop(context);

            }, child: Text("Cancel")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepOrangeAccent)
            ),
            onPressed: () {
              Navigator.pop(context);
              // _onLoading(context);
              // _onLoad(context);
              _onloadPackages(context);

            }, child: Text("Comfirm",))
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  Future registerAttendace({cardSerialNo}) async{

    var token = await Service.token;
    // var BASE_URL = "https://padshareapp.com/training/create_attendance/${UserID}/";
    var BASE_URL = "http://159.203.177.220/api/training/create_attendance/${UserID}";

    try {
      final response = await http.post(
          Uri.parse(BASE_URL),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${token['authtoken']}"
          },
          body: jsonEncode(<String, String>{
            "training_id": user_traningID.toString(),
            "serial_no": cardSerialNo,
            "agent_id": UserID
          })
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print("Returned-BENFICIALLY::: ${result}");
        showtoast();
        // _futureScanQR();
      } else {

        print("ERROR : ${response.statusCode}");
        showtoastError();
        print("ERROR REGISTER : ${response.body}");
        // throw Exception();
        AlertDialog alert = AlertDialog(
          title: Text("Confirmed for this Training"),
          content: Text("thank you for taking time off to attend this Training"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
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


        showDialog(context: context, builder: (_)=> alert);

      }
    }catch (e) {
      print("The exception thrown is ${e.runtimeType}");
    }
  }

  Widget showtoastError(){
    // this ID${UserID} has already Confirmed for this Training
    var toast = Fluttertoast.showToast(
        msg: 'This card has already been scanned',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

  void _onLoad(context) {
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
              new Text("registering..", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 3), () {

      Navigator.pop(context); //pop dialog
      // _login();
      // SignUpUser()
      // registerAttendace();

      _SendTrainingScanQR();

      // Navigator.push(context, MaterialPageRoute(builder: (_)=> MainTabs()));

      //

    });
  }
  void _onloadPackages(context) {
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
              new Text("registering..", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );


    new Future.delayed(new Duration(seconds: 3), () {

      Navigator.pop(context); //pop dialog
      // _login();
      // SignUpUser()
      // registerAttendace();

      // _SendTrainingScanQR();
      Service.SendPackageScanQR(user_packageID: packageId,UserID: UserID);

      // Navigator.push(context, MaterialPageRoute(builder: (_)=> MainTabs()));

      //

    });
  }

  Widget progressIndictor() {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // new Text('searching...', style: GoogleFonts.roboto(color: Colors.grey, fontSize: 8),),
    SpinKitFadingCircle(
            size: 40.0,
            color:Colors.purpleAccent
        ),
      ],
      // )
    );
  }
  Widget showtoast(){
    var toast = Fluttertoast.showToast(
        msg: 'Successfully recorded attendance!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    // throw toast;
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
              new Text("Searching...", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
  }
  Uploadimage()async{
    // var imagepicker = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
   var upload = await ImagePicker.platform.pickImage(source: ImageSource.gallery, imageQuality: 60);
   if(upload != null){
     setState(() {
       image = File(upload.path);
     });
     print('image : ${upload.path} , ${profile.agent_id}');
     // await Service.updateUserprofile(profile.agent_id, upload.path);
     await NetworkService.uploadProfile(upload.path,profile.agent_id);

   }
  }

  _initiateFeedback() {
    print("$onclickvalue values");

    return showDialog(context: context, builder: (BuildContext context) {
      return CustomDialogBox(
        title: "User Feedback",
        text: Form(

          child: Column(
            children: [
              //  Text(results[index]['question'] ?? '',style: TextStyle(
              // // new Text("How easy has it been for you to access these period packages every month?-", style: TextStyle(
              //    color: Colors.orange
              //  ),),

              ValueListenableBuilder(valueListenable: questions,
                  builder: (BuildContext context, int value, Widget child) {
                    return Text(
                      results[value]['question'] ?? '', style: TextStyle(
                      // new Text("How easy has it been for you to access these period packages every month?-", style: TextStyle(
                        color: Colors.orange
                    ),);
                  }),
              SizedBox(height: 30,),
              new Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: TextFormField(
                  controller: _questionAswerController,
                  maxLines: 6,
                  onChanged: (value) {
                    if (questions.value == 0) {
                      // FinalQuestion.add(
                      //     {
                      //       "question_id":results[questions.value]['question_id'],
                      //       "agent_id":UserID,
                      //       "card_sequence":result,
                      //       "beneficiary_uid":_userVerification.text,
                      //       "answer": _questionAswerController.text
                      //     });
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "answer",

                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8)
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: new Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(

                            backgroundColor: MaterialStateProperty.all(
                                Color(0xff16596a)),

                          ),
                          onPressed: _isPressed == true ? _myCallback : null,
                          child: Center(
                            child: Text("Previous"),
                          )),

                      ValueListenableBuilder(
                        builder: (BuildContext context, int value,
                            Widget child) {
                          return value == 2 ?
                          ElevatedButton(
                              onPressed: () {
                                print("AM FINISHED HERE");
                                setState(() {
                                  defaultQuestion = 2;
                                  _questionAswerController.clear();
                                });

                                Questions_model value;

                                // FinalQuestion.add(
                                // );

                                // FinalQuestion.add(
                                //     {
                                //       // "index" : defaultQuestion,
                                //       // "question_id":results[questions.value]['question_id'],
                                //       // "agent_id":UserID,
                                //       // "card_sequence":result,
                                //       // "beneficiary_uid":_userVerification.text,
                                //       // "answer": _questionAswerController.text
                                //     });
                                AddQuestions(
                                    UserID,
                                    results[defaultQuestion]['question_id'],
                                    _userVerification.text,
                                    _questionAswerController.text);


                                print(FinalQuestion.length);
                                FinalQuestion.map((e) =>
                                    print({
                                      e.agent_id,
                                      e.question_id,
                                      e.beneficiary_uid,
                                      e.answer
                                    }));
                                _sendQuestionAnswer();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Color(0xffe24471),
                                ),
                                // padding: MaterialStateProperty.all(EdgeInsets.zero)
                              ),
                              child: new Text("Finish")) :
                          ElevatedButton(
                              style: ButtonStyle(

                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff16596a)),

                              ),
                              onPressed: () {
                                var myev;


                                // for(var i=0; i < result.length; i++){
                                //   setState(() {
                                //     myev  =  result[i];
                                //   });
                                // }


                                print("EVENTS: ${results.length}");

                                _incrementProgress();

                                print("${onclick.value} am clicked");

                                // for(var i = 0; i < response.length; i++) {
                                //print(response[i].length);
                                //
                                if (questions.value < results.length - 1) {
                                  setState(() {
                                    questions.value++;
                                  });
                                }

                                var myquestions = questions.value;
                                print("$myquestions MYINDEX");


                                // FinalQuestion.add(
                                //             {
                                //               "question_id":results[questions.value]['question_id'],
                                //               "agent_id":UserID,
                                //               "card_sequence":result,
                                //               "beneficiary_uid":_userVerification.text,
                                //               "answer": _questionAswerController.text
                                //             });

                                if (defaultQuestion == 0) {
                                  // FinalQuestion.add(
                                  //     {
                                  //       "index" : defaultQuestion,
                                  //       "question_id":results[questions.value]['question_id'],
                                  //       "agent_id":UserID,
                                  //       "card_sequence":result,
                                  //       "beneficiary_uid":_userVerification.text,
                                  //       "answer": _questionAswerController.text
                                  //     });

                                  AddQuestions(
                                      UserID,
                                      results[questions.value]['question_id'],
                                      _userVerification.text,
                                      _questionAswerController.text);

                                  setState(() {
                                    defaultQuestion = myquestions;
                                    _questionAswerController.clear();
                                  });
                                  print(FinalQuestion.length);
                                  FinalQuestion.map((e) =>
                                      print({
                                        e.agent_id,
                                        e.question_id,
                                        e.beneficiary_uid,
                                        e.answer
                                      }));
                                } else if (defaultQuestion == 1) {
                                  AddQuestions(
                                      UserID,
                                      results[questions.value]['question_id'],
                                      _userVerification.text,
                                      _questionAswerController.text);

                                  // FinalQuestion.add(
                                  //     {
                                  //       "index" : defaultQuestion,
                                  //       "question_id":results[questions.value]['question_id'],
                                  //       "agent_id":UserID,
                                  //       "card_sequence":result,
                                  //       "beneficiary_uid":_userVerification.text,
                                  //       "answer": _questionAswerController.text
                                  //     });

                                  setState(() {
                                    _questionAswerController.clear();
                                  });
                                  print(FinalQuestion.length);
                                  FinalQuestion.map((e) =>
                                      print({
                                        e.agent_id,
                                        e.question_id,
                                        e.beneficiary_uid,
                                        e.answer
                                      }));
                                } else {
                                  // FinalQuestion.add(
                                  //     {
                                  //       "index" : defaultQuestion,
                                  //       "question_id":results[questions.value]['question_id'],
                                  //       "agent_id":UserID,
                                  //       "card_sequence":result,
                                  //       "beneficiary_uid":_userVerification.text,
                                  //       "answer": _questionAswerController.text
                                  //     });
                                }

                                //
                                //   else if(myquestions == 1){
                                //     FinalQuestion.insert(1,
                                //         {
                                //           "question_id":results[questions.value]['question_id'],
                                //           "agent_id":UserID,
                                //           "card_sequence":result,
                                //           "beneficiary_uid":_userVerification.text,
                                //           "answer": _questionAswerController.text
                                //         });
                                //    }else if(myquestions == 2) {
                                //   FinalQuestion.insert(2,
                                //       {
                                //         "question_id": results[questions
                                //             .value]['question_id'],
                                //         "agent_id": UserID,
                                //         "card_sequence": result,
                                //         "beneficiary_uid": _userVerification.text,
                                //         "answer": _questionAswerController.text
                                //       });
                                // }


                                print("INPUTS:- $FinalQuestion");


                                print("${questions.value} num");
                                // print(response[index]);
                                print(results[questions.value]);
                                // }


                                // print(myresult);

                                if (questions.value == results.length) {
                                  print("AM FINISHED HERE");
                                }
                              }, child: Center(
                            child: Text("Next"),
                          ))
                          ;
                        },
                        valueListenable: questions,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),

              ValueListenableBuilder(
                builder: (BuildContext context, double value, Widget child) {
                  return new Container(
                    child: new LinearProgressIndicator(
                      value: value,
                      backgroundColor: Colors.grey.withOpacity(0.6),
                      valueColor: new AlwaysStoppedAnimation(Colors.deepOrange),
                    ),

                  );
                }, valueListenable: onclick,)

            ],
          ),
        ),
        descriptions: "Questions",
      );
    });
  }

  void _myCallback() {
    if (questions.value == 0) {
      setState(() {
        _isPressed = true;
      });
    }


    if (questions.value != 0) {
      setState(() {
        questions.value--;
      });
    } else {
      setState(() {
        _isPressed = true;
      });
    }

    print("${questions.value} num-subTRacton");
    // print(response[index]);
    print("${results[questions.value]} SUBB");


    setState(() {
      // for (var i = 0; i < response.length; i++) {
      //   print(response[i].length);
      //   setState(() {
      //     totalquestions = response[i].length;
      //   });
      // }


      var num = 100 / totalquestions;

      isdiabledClick = false;
      var totalqn = num / 100;
      onclick.value -= totalqn;
    });

    print(onclick);
  }

  void AddQuestions(String agent_id, question_id, beneficiary_uid, answer) {
    setState(() {
      FinalQuestion.add(
          Questions_model(
              agent_id,
              question_id,
              beneficiary_uid,
              answer));
    });
  }
  Future _sendQuestionAnswer() async {
    var response = await http.post(
        Uri.https("padshareapp.com", "feedback/answer/${UserID}/"),

        headers: {
          'Content-Type': 'application/json',
        },
        // body: jsonEncode(FinalQuestion.map((e) => e.to)),
        body: json.encode(FinalQuestion.first.toJson())


    );

    print("${response.body} MY RESPONSE");

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    } else {
      print(response.statusCode);
    }
  }
  void _incrementProgress() async {
    // var respo =  await _getallLists();
    // print(respo);
    //  setState(() {
    //
    //    for(var i = 0; i < respo.length; i++){
    //
    //     // print(respo[i].length);
    //      setState(() {
    //        totalquestions += respo[i];
    //      });
    //    }
    //
    //    print("${totalquestions} TOTAL");
    totalquestions = results.length;
    print("${totalquestions} TOTAL");

    // for(var i =0; i < respo.)

    var num = 100 / totalquestions;
    print("${num}  TOTASub-L");
    isdiabledClick = false;
    var totalqn = num / 100;
    onclick.value += totalqn;
    //
    //    print(num.toDouble());


  }

}