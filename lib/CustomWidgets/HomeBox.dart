import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HomeBox extends StatelessWidget {
  String image;
  String title;
  IconData icon;
  Color boxColor ;
  Color itemColor ;
  double height ;

  HomeBox({this.image, this.title, this.icon,this.boxColor,this.itemColor,this.height});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      margin: EdgeInsets.only(left: 0, top: 0, right: 0),
      height: this.height,
      width: 150,
      decoration: BoxDecoration(
        color: this.boxColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(this.icon, size: ScreenUtil().setHeight(120),color: this.itemColor,),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
              child: Text(
                this.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Poppins',color: this.itemColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
