import 'dart:ui';

import 'package:depanauto/Utils/Constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {


  var functionToExecute;
  CustomButton({
    this.functionToExecute
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        child: Text(
          Constants.BUTTON_ENVOYER,
          style: TextStyle(color: Colors.red),
        ),
        borderSide: BorderSide(color: Colors.red, width: 0.5),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0))),
        onPressed: () {
          functionToExecute();
        },
      ),
    );
  }
}
