import 'dart:async';

import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SosPneuVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  SosPneuVM(GlobalKey<ScaffoldState> scaffold) {
    _scaffoldKey = scaffold;
  }

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController marqueTextController = TextEditingController();
  TextEditingController modeleTextController = TextEditingController();
  TextEditingController numChassisTextController = TextEditingController();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void sendPneuRequest() async {
    String marque = marqueTextController.text;
    String modele = modeleTextController.text;
    String numChassis = numChassisTextController.text;
    String phoneNumber = phoneNumberTextController.text;

    bool testResult =
        Utilities().verifyInputs(marque, modele, numChassis, phoneNumber);
    if (testResult == true) {
      Utilities().getUserToken().then((token) {
        DpanautoAPI()
            .requestPneu(marque, modele, numChassis, phoneNumber, token)
            .then((result) {
          if (result.toLowerCase() == Constants.RESULT_DONE) {
            btnController.success();
            Timer(Duration(seconds: 3), () {
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
}
