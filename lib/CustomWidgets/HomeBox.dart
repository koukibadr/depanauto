import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBox extends StatelessWidget {
  String image;
  String title;

  HomeBox({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0, top: 0, right: 0),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Image.asset(this.image,width: 120),
          Text(
            this.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Poppins'),
            )
          ],
        ),
      ),
    );
  }
}
