import 'dart:convert';
import 'dart:io';

import 'package:depanauto/Entities/Brand.dart';
import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/Information/Information.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeVM {
  GlobalKey<ScaffoldState> _scaffoldKey;
  BuildContext _context;
  HomeVM(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context) {
    _scaffoldKey = scaffoldKey;
    _context = context;
  }

  void infoClicked() {
    Navigator.push(_context,
        MaterialPageRoute(builder: (BuildContext context) => Information()));
  }

  void closeApp() {
    exit(0);
  }
}
