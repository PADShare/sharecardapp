// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:html/dom.dart';
// import 'package:sharecard_app/ui/pages/home/home.dart';
// import 'package:sharecard_app/utils/apis/api.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class AssessmentQuestions extends StatefulWidget {
//
//   final url;
//   const AssessmentQuestions({Key key, this.url}) : super(key: key);
//
//   @override
//   State<AssessmentQuestions> createState() => _AssessmentQuestionsState();
// }
//
// class _AssessmentQuestionsState extends State<AssessmentQuestions> {
//
//   // WebViewPlusController _controller;
//   //
//   WebViewController  controllerweb;
//   double _height = 1;
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // print(Api.header +
//     //     Api.htmlData +
//     //     Api.footer);
//     // flutterWebviewPlugin.evalJavascript('alert("Hello World")');
//     return Scaffold(
//       appBar: AppBar(
//     leading: GestureDetector(
//       onTap: (){
//         Navigator.pop(context);
//         Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Home()));
//         // controllerweb.canGoBack();
//       },
//       child: Icon(Icons.arrow_back,size: 30,),
//     ),
//       ),
//       body: SafeArea(
//
//
//         // child: WebViewPlus(
//         // onWebViewCreated: (controller) {
//         //   controller.loadString(
//         //         Api.header +
//         //         Api.htmlData +
//         //          Api.footer);
//         //       // controller.loadString(Api.footer);
//         //   },
//         //   onPageStarted: (url){
//         //      controllerweb?.runJavascriptReturningResult(
//         //          "document.getElementsByClassName('add_radio').style.display = 'none'"
//         //      );
//         //     // controllerweb?.evaluateJavascript(
//         //     //   "var btn = document.getElementsByClassName('rem-q-item'); for(const btns of btn){"
//         //     //   "btns.style.display = 'none'; }"
//         //     //   "document.getElementsByClassName('add_radio').style.display = 'none';"
//         //     //
//         //     // );
//         //   },
//         //   onPageFinished: (url) {
//         //     // flutterWebviewPlugin;
//         //
//         //     // _controller.getHeight().then((double height) {
//         //     //   print("Height:  " + height.toString());
//         //     //   setState(() {
//         //     //     _height = height;
//         //     //     // _controller.runJavascriptReturningResult('alert("Hello, World!")');
//         //     //   });
//         //     // });
//         //   },
//         //   javascriptMode: JavascriptMode.unrestricted,
//         //   // javascriptMode: webview_flutter.JavascriptMode.unrestricted,
//         //
//         // ),
//
//         child:WebView(
//           initialUrl: Uri.dataFromString(
//             Api.header +
//                 Api.htmlData,//widget.url,
//             mimeType: 'text/html',
//           ).toString(),
//           javascriptMode:JavascriptMode.unrestricted,
//           onPageStarted: (url){
//
//             print("new web Data $url");
//           },
//           onWebViewCreated: (controller){
//             setState(() {
//               this.controllerweb = controller;
//             });
//
//
//
//             controllerweb.runJavascriptReturningResult(
//                 "var btn = document.getElementsByClassName('choice-option');"
//                     "for(const btns of btn){  btns.style.display = 'none'; };"
//                     "var btn = document.getElementsByClassName('rem-on-display');"
//                     "for(const btns of btn){  btns.style.display = 'none'; };"
//                     "var bst = document.getElementsByClassName('add_radio');"
//                     "for(const btns of bst){ btns.style.display = 'none'; };"
//                     "var btn6 = document.getElementsByClassName('add_chk');"
//                     "for(const btns of btn6){ btns.style.display = 'none'; };"
//                     "var btn3 = document.getElementsByClassName('req-item');"
//                     "for(const btns of btn3){ btns.style.display = 'none'; };"
//                     "var btn4 = document.getElementsByClassName('rem-q-item');"
//                     "for(const btns of btn4){ btns.style.display = 'none'; };"
//             );
//
//             controllerweb.runJavascriptReturningResult(
//                 "var button2 = document.getElementById('add_q-item');"
//                     "button2.style.display = 'none';"
//                 "var button = document.getElementById('save_form');"
//                     "button.style.display = 'none';"
//             );
//             // var sheet =  CSSStyleSheet();
//             // sheet.replaceSync('#target {color: darkseagreen}');
// // Apply the stylesheet to a document:
// //             document.adoptedStyleSheets = [sheet];
//             // this.controllerweb.runJavascriptReturningResult(
//             //     "var bst = document.getElementsByClassName('add_radio');"
//             //     "for(const btns of bst){ btns.style.display = 'none'; };"
//             // );
//           },
//
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 8.0),
//         child: Text('g'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
//     );
//   }
//
//
//   // _loadHtmlFromAssets() async {
//   //   String fileText = await rootBundle.loadString('assets/help.html');
//   //   _controller.loadUrl( Uri.dataFromString(
//   //       Api.htmlData,
//   //       mimeType: 'text/html',
//   //       encoding: Encoding.getByName('utf-8')
//   //   ).toString());
//   // }
// }
//
