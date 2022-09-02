import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sharecard_app/core/service/keys.dart';
import 'package:sharecard_app/core/service/service.dart';
import 'package:sharecard_app/ui/pages/home/home.dart';

class FarmAssessmentFormTWO extends StatefulWidget {
  final agent_id;
  final beneficiary_id;
  final code;

  const FarmAssessmentFormTWO({Key key,this.agent_id,this.beneficiary_id,this.code}) : super(key: key);

  @override
  State<FarmAssessmentFormTWO> createState() => _FarmAssessmentFormTWOState();
}

class _FarmAssessmentFormTWOState extends State<FarmAssessmentFormTWO> {
  var quesionone = '' ;
  var quesiontwo = '' ;
  var quesionthree = '' ;
  var quesionfour = '' ;
  var quesionfive = '' ;
  var quesionsix = "";
  var quesionseven = "";
  var quesioneight = "";
  var quesionnine = "";
  var quesionten = "";
  var quesioneleven = "";
  var quesiontrelove = "";
  var quesionthirteen = "";
  var quesionfourteen = '';
  var quesionfifteen = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0ebf8),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Keys.farmer_assessment_title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                  Divider(),
                  Text(Keys.farmer_assessment_subTitle, style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color:Colors.black54),textAlign: TextAlign.center,),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                      children: [
                      Expanded(
                        flex: 7,
                          child:Text(Keys.question_farmer_assessment_one, style:TextStyle(fontSize: 13))),
                      Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                  ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionone,
                        onChanged:(val){
                         setState(() {
                           quesionone = val;
                         });
                         print(quesionone);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionone,
                        onChanged:(val){
                          setState(() {
                            quesionone = val;
                          });
                          print(quesionone);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionone,
                        onChanged:(val){
                          setState(() {
                            quesionone = val;
                          });
                          print(quesionone);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionone,
                        onChanged:(val){
                          setState(() {
                            quesionone = val;
                          });
                          print(quesionone);
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
               height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_two,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesiontwo,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                          print(quesiontwo);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesiontwo,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                          print(quesiontwo);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesiontwo,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                          print(quesiontwo);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesiontwo,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                          print(quesiontwo);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_three,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionthree,
                        onChanged:(val){
                          setState(() {
                            quesionthree = val;
                          });
                          print(quesionthree);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionthree,
                        onChanged:(val){
                          setState(() {
                            quesionthree = val;
                          });
                          print(quesionthree);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionthree,
                        onChanged:(val){
                          setState(() {
                            quesionthree = val;
                          });
                          print(quesionthree);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionthree,
                        onChanged:(val){
                          setState(() {
                            quesionthree = val;
                          });
                          print(quesionthree);
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_four,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                          print(quesionfour);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                          print(quesionfour);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                          print(quesionfour);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                          print(quesionfour);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_five,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
                          print(quesionfive);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
                          print(quesionfive);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
                          print(quesionfive);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
                          print(quesionfive);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_six,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionsix,
                        onChanged:(val){
                          setState(() {
                            quesionsix = val;
                          });
                          print(quesionsix);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionsix,
                        onChanged:(val){
                          setState(() {
                            quesionsix = val;
                          });
                          print(quesionsix);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionsix,
                        onChanged:(val){
                          setState(() {
                            quesionsix = val;
                          });
                          print(quesionsix);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionsix,
                        onChanged:(val){
                          setState(() {
                            quesionsix = val;
                          });
                          print(quesionsix);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_seven,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionseven,
                        onChanged:(val){
                          setState(() {
                            quesionseven = val;
                          });
                          print(quesionseven);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionseven,
                        onChanged:(val){
                          setState(() {
                            quesionseven = val;
                          });
                          print(quesionseven);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionseven,
                        onChanged:(val){
                          setState(() {
                            quesionseven = val;
                          });
                          print(quesionseven);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionseven,
                        onChanged:(val){
                          setState(() {
                            quesionseven = val;
                          });
                          print(quesionseven);
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_eight,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesioneight,
                        onChanged:(val){
                          setState(() {
                            quesioneight = val;
                          });
                          print(quesioneight);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesioneight,
                        onChanged:(val){
                          setState(() {
                            quesioneight = val;
                          });
                          print(quesioneight);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesioneight,
                        onChanged:(val){
                          setState(() {
                            quesioneight = val;
                          });
                          print(quesioneight);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesioneight,
                        onChanged:(val){
                          setState(() {
                            quesioneight = val;
                          });
                          print(quesioneight);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_nine,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionnine,
                        onChanged:(val){
                          setState(() {
                            quesionnine = val;
                          });
                          print(quesionnine);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionnine,
                        onChanged:(val){
                          setState(() {
                            quesionnine = val;
                          });
                          print(quesionnine);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionnine,
                        onChanged:(val){
                          setState(() {
                            quesionnine = val;
                          });
                          print(quesionnine);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionnine,
                        onChanged:(val){
                          setState(() {
                            quesionnine = val;
                          });
                          print(quesionnine);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_ten,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionten,
                        onChanged:(val){
                          setState(() {
                            quesionten = val;
                          });
                          print(quesionten);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionten,
                        onChanged:(val){
                          setState(() {
                            quesionten= val;
                          });
                          print(quesionten);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionten,
                        onChanged:(val){
                          setState(() {
                            quesionten = val;
                          });
                          print(quesionten);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionten,
                        onChanged:(val){
                          setState(() {
                            quesionten = val;
                          });
                          print(quesionten);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_eleven,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesioneleven,
                        onChanged:(val){
                          setState(() {
                            quesioneleven = val;
                          });
                          print(quesioneleven);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesioneleven,
                        onChanged:(val){
                          setState(() {
                            quesioneleven= val;
                          });
                          print(quesioneleven);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesioneleven,
                        onChanged:(val){
                          setState(() {
                            quesioneleven = val;
                          });
                          print(quesioneleven);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesioneleven,
                        onChanged:(val){
                          setState(() {
                            quesioneleven= val;
                          });
                          print(quesioneleven);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_trelove,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesiontrelove,
                        onChanged:(val){
                          setState(() {
                            quesiontrelove = val;
                          });
                          print(quesiontrelove);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesiontrelove,
                        onChanged:(val){
                          setState(() {
                            quesiontrelove= val;
                          });
                          print(quesiontrelove);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesiontrelove,
                        onChanged:(val){
                          setState(() {
                            quesiontrelove = val;
                          });
                          print(quesiontrelove);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesiontrelove,
                        onChanged:(val){
                          setState(() {
                            quesiontrelove= val;
                          });
                          print(quesiontrelove);
                        }),
                  )
                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_thirteen,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionthirteen,
                        onChanged:(val){
                          setState(() {
                            quesionthirteen = val;
                          });
                          print(quesionthirteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionthirteen,
                        onChanged:(val){
                          setState(() {
                            quesionthirteen = val;
                          });
                          print(quesionthirteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionthirteen,
                        onChanged:(val){
                          setState(() {
                            quesionthirteen = val;
                          });
                          print(quesionthirteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionthirteen,
                        onChanged:(val){
                          setState(() {
                            quesionthirteen= val;
                          });
                          print(quesionthirteen);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_fourteen,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionfourteen,
                        onChanged:(val){
                          setState(() {
                            quesionfourteen = val;
                          });
                          print(quesionfourteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionfourteen,
                        onChanged:(val){
                          setState(() {
                            quesionfourteen = val;
                          });
                          print(quesionfourteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionfourteen,
                        onChanged:(val){
                          setState(() {
                            quesionfourteen = val;
                          });
                          print(quesionfourteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionfourteen,
                        onChanged:(val){
                          setState(() {
                            quesionfourteen= val;
                          });
                          print(quesionfourteen);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(

                        children: [
                          Expanded(
                              flex: 6,
                              child:Text(Keys.question_farmer_assessment_fifteen,style:TextStyle(fontSize: 13))),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('Strongly Agree '),
                    leading: Radio(
                        value: 'A',
                        groupValue: quesionfifteen,
                        onChanged:(val){
                          setState(() {
                            quesionfifteen = val;
                          });
                          print(quesionfifteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Agree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'B',
                        groupValue:quesionfifteen,
                        onChanged:(val){
                          setState(() {
                            quesionfifteen = val;
                          });
                          print(quesionfifteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Disagree'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'C',
                        groupValue:quesionfifteen,
                        onChanged:(val){
                          setState(() {
                            quesionfifteen = val;
                          });
                          print(quesionfifteen);
                        }),
                  ),
                  ListTile(
                    title: Text('Strongly Disagree '),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'D',
                        groupValue:quesionfifteen,
                        onChanged:(val){
                          setState(() {
                            quesionfifteen= val;
                          });
                          print(quesionfifteen);
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                width: 140,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child:FlatButton(
                  onPressed: ()async{
                    // Strongly Agree
                    // Agree
                    // Disagree
                    // Strongly Disagree

                    var responseData = [
                      {
                        "assessemt_question_id":1,
                        'assessemt_question' : Keys.question_farmer_assessment_one,
                        'type':'radio_button',
                        "answer_response_score":quesionone,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionone =="A"? "Strongly Agree" : quesionone =="B" ? "Agree" : quesionone == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":2,
                        'assessemt_question' : Keys.question_farmer_assessment_two,
                        'type':'radio_button',
                        "answer_response_score":quesiontwo,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesiontwo =="A"? "Strongly Agree" : quesiontwo =="B" ? "Agree" : quesiontwo == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":3,
                        'assessemt_question' : Keys.question_farmer_assessment_three,
                        'type':'radio_button',
                         "answer_response_score":quesionthree,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionthree =="A"? "Strongly Agree" : quesionthree =="B" ? "Agree" : quesionthree == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":4,
                        'assessemt_question' : Keys.question_farmer_assessment_four,
                        'type':'radio_button',
                        "answer_response_score":quesionfour,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionfour=="A"? "Strongly Agree" : quesionfour =="B" ? "Agree" : quesionfour == "C" ? "Disagree" : "Strongly Disagree"
                      },
                    {
                      "assessemt_question_id":5,
                      'assessemt_question' : Keys.question_farmer_assessment_five,
                      'type':'radio_button',
                      "answer_response_score":quesionfive,
                      'answer_required' : 'yes',
                      'assessment_user_response_answer' : quesionfive=="A"? "Strongly Agree" : quesionfour =="B" ? "Agree" : quesionfour == "C" ? "Disagree" : "Strongly Disagree"
                    },
                      {
                        "assessemt_question_id":6,
                        'assessemt_question' : Keys.question_farmer_assessment_six,
                        'type':'radio_button',
                        "answer_response_score":quesionsix,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionsix=="A"? "Strongly Agree" : quesionsix =="B" ? "Agree" : quesionsix == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":7,
                        'assessemt_question' : Keys.question_farmer_assessment_seven,
                        'type':'radio_button',
                        "answer_response_score":quesionseven,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionseven=="A"? "Strongly Agree" : quesionseven =="B" ? "Agree" : quesionseven == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":8,
                        'assessemt_question' : Keys.question_farmer_assessment_eight,
                        'type':'radio_button',
                        "answer_response_score":quesioneight,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesioneight=="A"? "Strongly Agree" : quesioneight =="B" ? "Agree" : quesioneight == "C" ? "Disagree" : "Strongly Disagree"
                      },
                      {
                        "assessemt_question_id":9,
                        'assessemt_question' : Keys.question_farmer_assessment_nine,
                        'type':'radio_button',
                        "answer_response_score":quesionnine,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionnine=="A"? "Strongly Agree" : quesionnine =="B" ? "Agree" : quesionnine == "C" ? "Disagree" : "Strongly Disagree"
                      }
                      ,
                      {
                        "assessemt_question_id":10,
                        'assessemt_question' : Keys.question_farmer_assessment_ten,
                        'type':'radio_button',
                        "answer_response_score":quesionten,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionten=="A"? "Strongly Agree" : quesionten =="B" ? "Agree" : quesionten == "C" ? "Disagree" : "Strongly Disagree"
                      } ,
                      {
                        "assessemt_question_id":11,
                        'assessemt_question' : Keys.question_farmer_assessment_eleven,
                        'type':'radio_button',
                        "answer_response_score":quesioneleven,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesioneleven=="A"? "Strongly Agree" : quesioneleven =="B" ? "Agree" : quesioneleven== "C" ? "Disagree" : "Strongly Disagree"
                      } ,
                      {
                        "assessemt_question_id":12,
                        'assessemt_question' : Keys.question_farmer_assessment_trelove,
                        'type':'radio_button',
                        "answer_response_score":quesiontrelove,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesiontrelove=="A"? "Strongly Agree" : quesiontrelove =="B" ? "Agree" : quesiontrelove== "C" ? "Disagree" : "Strongly Disagree"
                      } ,
                      {
                        "assessemt_question_id":13,
                        'assessemt_question' : Keys.question_farmer_assessment_thirteen,
                        'type':'radio_button',
                        "answer_response_score":quesionthirteen,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionthirteen=="A"? "Strongly Agree" : quesionthirteen =="B" ? "Agree" : quesionthirteen== "C" ? "Disagree" : "Strongly Disagree"
                      } ,
                      {
                        "assessemt_question_id":14,
                        'assessemt_question' : Keys.question_farmer_assessment_fourteen,
                        'type':'radio_button',
                        "answer_response_score":quesionfourteen,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionfourteen=="A"? "Strongly Agree" : quesionfourteen =="B" ? "Agree" : quesionfourteen== "C" ? "Disagree" : "Strongly Disagree"
                      } ,
                      {
                        "assessemt_question_id":15,
                        'assessemt_question' : Keys.question_farmer_assessment_fifteen,
                        'type':'radio_button',
                        "answer_response_score":quesionfifteen,
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionfifteen=="A"? "Strongly Agree" : quesionfifteen =="B" ? "Agree" : quesionfifteen== "C" ? "Disagree" : "Strongly Disagree"
                      }
                    ];

                    var assessement = {
                      'assessment_name': Keys.farmer_assessment_title,
                      'assessment_subtitle': Keys.farmer_assessment_subTitle,
                      'beneficiary_id' : widget.beneficiary_id,
                       'agent_id': widget.agent_id,
                      'farm_assessment_id': widget.code,
                       "data": responseData,

                    };
                    _onLoading(context);
                    await Service.sendFarmerAssementFeedback(assessement, widget.agent_id, widget.beneficiary_id).then((value){
                      Navigator.pop(context);
                      alertDialogs(value['id']);
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                      print("result");

                    });



                    print("User RESPONSE: $assessement");

                  },
                    child: Text('Submit',style:TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 18)),
                )
              ),
            )

          ],
        ),
      ),
    );
  }
  Widget alertDialogs(id){
    AlertDialog alert = AlertDialog(
      title: Text("Successfully Completed Farmer Assessment"),
      content: Text("you can return to Dashboard "),
      actions: [


        TextButton(
          child: Text("yes,continue"),
          onPressed: () {
            Navigator.pop(context);
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) =>
            //         FarmAssessmentFormTWO(agent_id:widget.agent_id,beneficiary_id:widget.beneficiary_id, code:id))
            // );
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) =>
                    Home())
            );

          },
        ),

      ],


    );


    showDialog(context: context, builder: (_)=> alert);



  }

  Widget assessmentCode(res){
    AlertDialog alert = AlertDialog(
      title: Text("Your Verification ID : ${res}"),
      content: Text("Enter this Verification Code when Attaching Card"),
      actions: [
        TextButton(
          child: Text("Cancel"),
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
              new Text("submitting...", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        );
      },
    );
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
}
