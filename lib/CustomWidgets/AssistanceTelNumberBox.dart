import 'package:depanauto/CustomWidgets/ComposerTel.dart';
import 'package:flutter/material.dart';

class AssistanceTelNumberBox extends StatelessWidget {

  var onPress;
  AssistanceTelNumberBox({
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Notre numéro\nportable",
                style: TextStyle(fontFamily: "Poppins")),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("+216 55 850 022",
                style: TextStyle(fontFamily: "Poppins-Bold")),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: onPress(),
                    child: ComposerTel(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
