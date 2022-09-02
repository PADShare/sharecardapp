import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sharecard_app/core/service/keys.dart';
import 'package:sharecard_app/core/service/service.dart';
import 'package:sharecard_app/ui/pages/assessment/farm_assess/farm_assessment_form_2.dart';
import 'package:sharecard_app/ui/pages/home/home.dart';

class FarmAssessmentFormOne extends StatefulWidget {
  final agent_id;
  final beneficiary_id;
  FarmAssessmentFormOne({Key key,this.agent_id,this.beneficiary_id}) : super(key: key);

  @override
  State<FarmAssessmentFormOne> createState() => _FarmAssessmentFormOneState();
}

class _FarmAssessmentFormOneState extends State<FarmAssessmentFormOne> {
  var quesionone = '' ;
  var quesiontwo = '' ;
  var quesionthree = '' ;
  var quesionfour = '' ;
  var quesionfive = '' ;
  TextEditingController quesionthreeInput = TextEditingController();

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
                  Text(Keys.assessment_title, style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                  Divider(),
                  Text( 'Beneficiary ID: ${widget.beneficiary_id}', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600, color:Colors.black54),textAlign: TextAlign.center,),

                ],
              ),
            ),
            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
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
                          child:Text(Keys.question_form_one)),
                      Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                  ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('yes'),
                    leading: Radio(
                        value: 'yes',
                        groupValue: quesionone,
                        onChanged:(val){
                         setState(() {
                           quesionone = val;
                         });
                         print(quesionone);
                        }),
                  ),
                  ListTile(
                    title: Text('no'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'no',
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
              height: 160,
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
                              child:Text(Keys.question_form_two)),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('yes'),
                    leading: Radio(
                        value: 'yes',
                        groupValue: quesiontwo ,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                          print(quesiontwo);
                        }),
                  ),
                  ListTile(
                    title: Text('no'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'no',
                        groupValue:quesiontwo ,
                        onChanged:(val){
                          setState(() {
                            quesiontwo = val;
                          });
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
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
                              child:Text(Keys.question_form_three)),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  TextField(
                    controller: quesionthreeInput,
                    decoration: InputDecoration(
                        hintText: 'enter No.'

                    ),

                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 165,
              padding: const EdgeInsets.all(18),
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
                              child:Text(Keys.question_form_four)),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('yes'),
                    leading: Radio(
                        value: 'yes',
                        groupValue:quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                          print(quesionfour);
                        }),
                  ),
                  ListTile(
                    title: Text('no'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'no',
                        groupValue:quesionfour,
                        onChanged:(val){
                          setState(() {
                            quesionfour = val;
                          });
                        }),
                  )
                ],
              ),
            ),

            SizedBox(height: 12,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 165,
              padding: const EdgeInsets.all(18),
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
                              flex: 4,
                              child:Text(Keys.question_form_five)),
                          Expanded(flex:1,child:Text("*", style: TextStyle(color:Colors.deepOrange),))
                        ],),
                    ),),

                  ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    title: Text('yes'),
                    leading: Radio(
                        value: 'yes',
                        groupValue:quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
                          print(quesionfive);
                        }),
                  ),
                  ListTile(
                    title: Text('no'),
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Radio(
                        value: 'no',
                        groupValue:quesionfive,
                        onChanged:(val){
                          setState(() {
                            quesionfive = val;
                          });
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

                    var responseData = [
                      {
                        'assessemt_question' : Keys.question_form_one,
                        'type':'radio_button',
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionone == '' || quesionone == null ? 'no' : quesionone
                      },
                      {
                        'assessemt_question' : Keys.question_form_two,
                        'type':'radio_button',
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesiontwo == '' || quesiontwo == null ? 'no' :  quesiontwo
                      },
                      {
                        'assessemt_question' : Keys.question_form_three,
                        'type':'text-input',
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionthreeInput.text
                      },
                      {
                        'assessemt_question' : Keys.question_form_four,
                        'type':'radio_button',
                        'answer_required' : 'yes',
                        'assessment_user_response_answer' : quesionfour == '' || quesionfour == null ? 'no' : quesionfour
                      },
                    {
                    'assessemt_question' : Keys.question_form_five,
                    'type':'radio_button',
                    'answer_required' : 'yes',
                    'assessment_user_response_answer' : quesionfive == '' || quesionfive == null ? 'no' : quesionfive
                    }
                    ];

                    var assessement = {
                      'assessment_name': Keys.assessment_title,
                      'beneficiary_id' : widget.beneficiary_id,
                      'agent_id': widget.agent_id,
                      "data": responseData,

                    };

                 await Service.sendAssementFeedback(assessement, widget.agent_id, widget.beneficiary_id).then((value){
                   alertDialogs(value['id']);

                   print("result");

                 });

                    print("User RESPONSE: $responseData");

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
      title: Text("Successfully Completed Assessment 1"),
      content: Text("would you like to continue to Second Assessment"),
      actions: [
        TextButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
            assessmentCode(id);
          },
        ),

        TextButton(
          child: Text("Yes continue"),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => FarmAssessmentFormTWO(agent_id:widget.agent_id,beneficiary_id:widget.beneficiary_id, code:id))
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
      content: Text("Enter this Verification Code on the next Assessment Attempt"),
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
}
