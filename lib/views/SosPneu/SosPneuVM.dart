import 'dart:async';
import 'dart:convert';

import 'package:depanauto/Entities/Brand.dart';
import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SosPneuVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext context;

  SosPneuVM(GlobalKey<ScaffoldState> scaffold, BuildContext context) {
    _scaffoldKey = scaffold;
    this.context = context;
  }

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController marqueTextController =
      TextEditingController(text: SosPneu.marqueSelected);
  TextEditingController modeleTextController = TextEditingController();
  TextEditingController numChassisTextController = TextEditingController();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  void sendPneuRequest() async {
    String marque = marqueTextController.text;
    String modele = modeleTextController.text;
    String numChassis = numChassisTextController.text;
    String phoneNumber = phoneNumberTextController.text;

    ProgressDialog pr = DialogBox().showLoading(context, "Envoie de demande");

    if (Utilities().verifyInputs(marque, modele, numChassis, phoneNumber) ==
        true) {
      pr.show().then((value) {
        Utilities().getUserToken().then((token) {
          DpanautoAPI()
              .requestPneu(marque, modele, numChassis, phoneNumber, token)
              .then((result) {
            if (result.toLowerCase() == Constants.RESULT_DONE) {
              pr.hide().then((value) {
                DialogBox().showSuccessSnackbar(
                    _scaffoldKey, Constants.SUCCESS_REQUEST);
                FocusScope.of(context).requestFocus(FocusNode());
                Timer(Duration(seconds: 2), () {
                  Navigator.pop(context);
                });
              });
            } else if (result == Constants.NO_CONNECTION) {
              pr.hide().then((value) {
                DialogBox().showErrorSnackbar(
                    _scaffoldKey, Constants.VERIFY_CONNECTION);
              });
            } else {
              pr.hide().then((value) {
                DialogBox()
                    .showErrorSnackbar(_scaffoldKey, Constants.FAILED_REQUEST);
              });
            }
          });
        });
      });
    } else {
      btnController.reset();
      DialogBox().showErrorSnackbar(_scaffoldKey, Constants.VERIFY_INPUTS);
    }
  }

  void onPressBack() {
    Navigator.pop(context);
  }
}
