import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {

  String topLeftIcon = "assets/images/info.png";
  VoidCallback onPressLeftIcon;
  VoidCallback onPressRightIcon;
  bool showRightIcon ;
  HeaderWidget({
    this.topLeftIcon,
    this.onPressLeftIcon,
    this.onPressRightIcon,
    this.showRightIcon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 0, top: 0, right: 0),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(this.topLeftIcon)),
              Image.asset("assets/images/logoTrans.png"),
              this.showRightIcon?  Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Image.asset("assets/images/close.jpg")) : SizedBox(width: 10),
            ],
          ),
        ));
  }
}
