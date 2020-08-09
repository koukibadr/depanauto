import 'dart:async';

import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistanceVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext context ;
  AssistanceVM(GlobalKey<ScaffoldState> scaffold,BuildContext activityContext) {
    _scaffoldKey = scaffold;
    context = activityContext;
  }

  TextEditingController phoneNumberTextController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void sendAssistanceRequest() {
    String phoneNumber = phoneNumberTextController.text;
    if (phoneNumber == "" ||
        Utilities().verifPhoneNumber(phoneNumber) == false) {
      btnController.reset();
      DialogBox().showErrorSnackbar(
          _scaffoldKey, Constants.VERIFY_PHONE);
    } else {
      Utilities().getUserToken().then((token) {
        DpanautoAPI()
            .requestAssistance(token, phoneNumberTextController.text)
            .then((result) {
          if (result.toLowerCase() == Constants.RESULT_DONE) {
            btnController.success();
            Timer(Duration(seconds: 2), () {
              btnController.reset();
            });
            DialogBox().showSuccessSnackbar(_scaffoldKey, Constants.SUCCESS_REQUEST);
          } else {
            btnController.reset();
            DialogBox().showErrorSnackbar(_scaffoldKey, Constants.FAILED_REQUEST);
          }
        });
      });
    }
  }

  Future<void> openPhoneDialer() async {
    const url = "tel:${Constants.PHONE_NUMBER}";   
    if (await canLaunch(url)) {
       await launch(url);
    } else {
      throw 'Could not launch $url';
    }   
  }

  void onPressBack(){
    Navigator.pop(context);
  }
}
