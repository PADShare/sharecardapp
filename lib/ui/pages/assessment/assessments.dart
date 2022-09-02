import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:sharecard_app/ui/pages/home/home.dart';
import 'package:sharecard_app/utils/apis/api.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FormAssessments extends StatefulWidget {
  final url;
  const FormAssessments({Key key, this.url}) : super(key: key);

  @override
  State<FormAssessments> createState() => _FormAssessmentsState();
}

class _FormAssessmentsState extends State<FormAssessments> {
  WebViewController controllerweb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home()));
            // controllerweb.canGoBack();
          },
          child: Icon(Icons.arrow_back,size: 30,),
        ),
      ),
      body:  Container(
        child: WebView(
    initialUrl: Uri.dataFromString(
    Api.header +
        Api.htmlData,//widget.url,
        mimeType: 'text/html',
    ).toString(),
    javascriptMode:JavascriptMode.unrestricted,
    onPageStarted: (url){

    print("new web Data $url");
    },
    onWebViewCreated: (controller){
    setState(() {
    this.controllerweb = controller;
    });



    controllerweb.runJavascriptReturningResult(
    "var btn = document.getElementsByClassName('choice-option');"
    "for(const btns of btn){  btns.style.display = 'none'; };"
    "var btn = document.getElementsByClassName('rem-on-display');"
    "for(const btns of btn){  btns.style.display = 'none'; };"
    "var bst = document.getElementsByClassName('add_radio');"
    "for(const btns of bst){ btns.style.display = 'none'; };"
    "var btn6 = document.getElementsByClassName('add_chk');"
    "for(const btns of btn6){ btns.style.display = 'none'; };"
    "var btn3 = document.getElementsByClassName('req-item');"
    "for(const btns of btn3){ btns.style.display = 'none'; };"
    "var btn4 = document.getElementsByClassName('rem-q-item');"
    "for(const btns of btn4){ btns.style.display = 'none'; };"
    );

    controllerweb.runJavascriptReturningResult(
    "var button2 = document.getElementById('add_q-item');"
    "button2.style.display = 'none';"
    "var button = document.getElementById('save_form');"
    "button.style.display = 'none';"
    );
    // var sheet =  CSSStyleSheet();
    // sheet.replaceSync('#target {color: darkseagreen}');
// Apply the stylesheet to a document:
//             document.adoptedStyleSheets = [sheet];
    // this.controllerweb.runJavascriptReturningResult(
    //     "var bst = document.getElementsByClassName('add_radio');"
    //     "for(const btns of bst){ btns.style.display = 'none'; };"
    // );
    },

    ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: 150,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.transparent,
              elevation: 0,
              onPressed: ()async{
                // controllerweb.runJavascriptReturningResult("document.getElementsById('q[0]').value");
                String docu = await controllerweb.runJavascriptReturningResult('document.documentElement.innerHTML');
                var e = parse(docu);
                var el = e.getElementsByClassName('form-check-input');
                 print(el);
                for(var l = 0; l < el.length;l++){
                  //print('s ${el[l].text()}');
                }
              },
              child: Text("Submit",style:TextStyle(fontSize: 16)),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
