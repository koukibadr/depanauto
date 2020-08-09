import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposerTel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/phone.png"),
          Text("Composer",style: TextStyle(fontFamily: "Poppins-Thin",fontSize: 10),)
        ],
      ),
    );
  }
}
