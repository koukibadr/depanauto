import 'package:flutter/material.dart';

class DialogBox {
  void showSimpleSnackbar(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        message,
      ),
    ));
  }

  void showSuccessSnackbar(
      GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    ));
  }

  void showErrorSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
