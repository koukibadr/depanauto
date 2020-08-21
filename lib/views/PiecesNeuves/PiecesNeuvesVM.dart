import 'dart:async';

import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/PiecesNeuves/PiecesNeuvesScreen.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PiecesNeuvesVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext context;

  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController marqueTextController = TextEditingController(text: PiecesNeuvesScreen.marqueSelected);
  TextEditingController modeleTextController = TextEditingController();
  TextEditingController numChassisTextController = TextEditingController();
  TextEditingController listPiecesTextController = TextEditingController();

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  PiecesNeuvesVM(GlobalKey<ScaffoldState> scaffold, BuildContext context) {
    _scaffoldKey = scaffold;
    this.context = context;
  }

  void onPressBack() {
    Navigator.pop(context);
  }

  void sendPNRequest() {
    String marque = marqueTextController.text;
    String modele = modeleTextController.text;
    String numChassis = numChassisTextController.text;
    String phoneNumber = phoneNumberTextController.text;
    String listPieces = listPiecesTextController.text;

    bool verifyInputs = Utilities().verifyInputsArray(
        [marque, modele, numChassis, listPieces, phoneNumber]);
    ProgressDialog pr = DialogBox().showLoading(context, "Envoie de demande");
    if (!verifyInputs) {
      DialogBox().showErrorSnackbar(_scaffoldKey, Constants.VERIFY_INPUTS);
    } else {
      pr.show().then((value) {
        Utilities().getUserToken().then((token) {
          DpanautoAPI()
              .requestPieceNeuves(marque, modele, numChassis, phoneNumber, token, listPieces)
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
    }
  }
}
