import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HeaderWidget extends StatelessWidget {
  String topLeftIcon = "assets/images/info.png";
  VoidCallback onPressLeftIcon;
  VoidCallback onPressRightIcon;
  bool showRightIcon;

  IconData leftIcon;

  HeaderWidget(
      {this.topLeftIcon,
      this.onPressLeftIcon,
      this.onPressRightIcon,
      this.showRightIcon,
      this.leftIcon});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
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
                  child: InkWell(
                    onTap: onPressLeftIcon,
                    child: Icon(this.leftIcon, size: ScreenUtil().setWidth(60)),
                  )),
              Image.asset("assets/images/logo.png",width: ScreenUtil().setWidth(350),),
              this.showRightIcon
                  ? Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: InkWell(
                        onTap: onPressRightIcon,
                        child: Icon(
                          MyFlutterApp.close,
                          size: ScreenUtil().setWidth(60),
                        ),
                      ))
                  : SizedBox(width: 10),
            ],
          ),
        ));
  }
}
