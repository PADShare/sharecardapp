import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharecard_app/utils/constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions;
  final Widget text;
  final Image img;
  final Widget button;


  const CustomDialogBox({Key key, this.title, this.descriptions, this.text, this.img, this.button}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
          child: ListView(
             padding: EdgeInsets.zero,
             shrinkWrap: true,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 12,),
              Text(widget.descriptions,style: TextStyle(fontSize: 13),textAlign: TextAlign.center,),
              SizedBox(height: 16,),
              widget.text,
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                // child: FlatButton
                //   (
                //     onPressed: (){
                //       Navigator.of(context).pop();
                //     },
                //     child: Text("Continue", style: TextStyle(fontSize: 14),)
                // ),
                child: widget.button,
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/model.png",width: 60,),
            ),
          ),
        ),
      ],
    );
  }
}