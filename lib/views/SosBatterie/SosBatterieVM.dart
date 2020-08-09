import 'dart:async';

import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SosBatterieVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext context ;

  SosBatterieVM(GlobalKey<ScaffoldState> scaffold,BuildContext context) {
    _scaffoldKey = scaffold;
    this.context = context;
  }

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController marqueTextController = TextEditingController();
  TextEditingController modeleTextController = TextEditingController();
  TextEditingController numChassisTextController = TextEditingController();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void sendBatterieRequest() {
    String marque = marqueTextController.text;
    String modele = modeleTextController.text;
    String numChassis = numChassisTextController.text;
    String phoneNumber = phoneNumberTextController.text;

    bool testResult =
        Utilities().verifyInputs(marque, modele, numChassis, phoneNumber);
    if (testResult == true) {
      Utilities().getUserToken().then((token) {
        DpanautoAPI()
            .requestBattery(marque, modele, numChassis, phoneNumber, token)
            .then((result) {
          if (result.toLowerCase() == Constants.RESULT_DONE) {
            btnController.success();
            Timer(Duration(seconds: 2), () {
              btnController.reset();
            });
            DialogBox().showSuccessSnackbar(
                _scaffoldKey, Constants.SUCCESS_REQUEST);
          } else {
            DialogBox().showErrorSnackbar(
                _scaffoldKey, Constants.FAILED_REQUEST);
          }
        });
      });
    } else {
      btnController.reset();
      DialogBox()
          .showErrorSnackbar(_scaffoldKey, Constants.VERIFY_INPUTS);
    }
  }

   void onPressBack(){
    Navigator.pop(context);
  }
}
