import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  String text;
  double size;
  Color textColor;
  String font;

  CustomText({this.text, this.size, this.textColor, this.font});

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: this.textColor, fontSize: this.size, fontFamily: this.font));
  }
}
