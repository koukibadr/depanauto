import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

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

  ProgressDialog showLoading(BuildContext context, String msg) {
    final ProgressDialog progress = ProgressDialog(context, type: ProgressDialogType.Normal, isDismissible: false, showLogs: false);
    progress.style(
        message: msg,
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w400,fontFamily: "Poppins-Thin"));

    return progress;
  }


}
