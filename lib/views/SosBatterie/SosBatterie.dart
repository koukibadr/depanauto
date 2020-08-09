import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/InputField.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/views/Assistance/Assistance.dart';
import 'package:depanauto/views/SosBatterie/SosBatterieVM.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SosBatterie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SosBatterie();
}

class _SosBatterie extends State<SosBatterie> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SosBatterieVM sosBatterieVM = SosBatterieVM(_scaffoldKey, context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(
              leftIcon: Icons.arrow_back_ios,
              showRightIcon: false,
              onPressLeftIcon: sosBatterieVM.onPressBack
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 110, left: 15),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: ListView(
                      children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 10),
                              Icon(MyFlutterApp.car,
                                  size: ScreenUtil().setWidth(150)),
                              SizedBox(height: 10),
                              Text(
                                "SOS Batterie",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: ScreenUtil().setWidth(50)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.MARQUE,
                                        numberInput: false,
                                        textController:
                                            sosBatterieVM.marqueTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.MODELE,
                                        numberInput: false,
                                        textController:
                                            sosBatterieVM.modeleTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.NUM_CHASSIS,
                                        numberInput: false,
                                        textController: sosBatterieVM
                                            .numChassisTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.NUM_TEL,
                                        numberInput: true,
                                        textController: sosBatterieVM
                                            .phoneNumberTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                      width: 270,
                                      height: 50,
                                      child: RoundedLoadingButton(
                                        color: Color(0xff910112),
                                        child: Text(Constants.BUTTON_ENVOYER,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        controller: sosBatterieVM.btnController,
                                        onPressed:
                                            sosBatterieVM.sendBatterieRequest,
                                      )))
                            ])
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        selectedIndex: 2,
        itemCornerRadius: 20,
        curve: Curves.easeInBack,
        items: [
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.emergency),
            title: Text('Urgence'),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.wheel),
            title: Text('SOS Pneu'),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.car),
            title: Text('SOS Batterie'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.shock),
            title: Text('Pieces'),
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ],
        onItemSelected: (int value) {
          if (value == 0) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Assistance()));
          } else if (value == 1) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SosPneu()));
          } else if (value == 3) {
            DialogBox().showSimpleSnackbar(
                _scaffoldKey, Constants.FEATURE_COMMING_SOON);
          }
        },
      ),
    );
  }
}
