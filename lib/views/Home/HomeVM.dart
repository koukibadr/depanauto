import 'dart:io';

import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:flutter/material.dart';

class HomeVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  HomeVM(GlobalKey<ScaffoldState> scaffoldKey){
    _scaffoldKey = scaffoldKey;
  }

  void infoClicked(){
    DialogBox().showSimpleSnackbar(_scaffoldKey, Constants.FEATURE_COMMING_SOON);
  }

  void closeApp(){
    exit(0);
  }

}