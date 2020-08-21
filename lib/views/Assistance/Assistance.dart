import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:depanauto/CustomWidgets/AssistanceTelNumberBox.dart';
import 'package:depanauto/CustomWidgets/CustomButton.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/InputField.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/views/Assistance/AssistanceVM.dart';
import 'package:depanauto/views/PiecesNeuves/PiecesNeuvesScreen.dart';
import 'package:depanauto/views/SosBatterie/SosBatterie.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Assistance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Assistance();
}

class _Assistance extends State<Assistance> {
  //Vars
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    AssistanceVM assistanceVM = AssistanceVM(_scaffoldKey, context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(
              onPressLeftIcon: assistanceVM.onPressBack,
              leftIcon: Icons.arrow_back_ios,
              showRightIcon: false,
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
                              Icon(MyFlutterApp.emergency,
                                  size: ScreenUtil().setWidth(150)),
                              SizedBox(height: 10),
                              Text(
                                "Dépannage\nd'urgence",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: ScreenUtil().setWidth(50)),
                              ),
                              SizedBox(height: 20),
                              AssistanceTelNumberBox(
                                onPress: assistanceVM.openPhoneDialer,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    "On vous rappelle",
                                    style:
                                        TextStyle(fontFamily: "Poppins-Bold"),
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                          hint: Constants.NUM_TEL,
                                          numberInput: true,
                                          textController: assistanceVM
                                              .phoneNumberTextController,
                                          editable: true,
                                          multiline: false))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                      width: 270,
                                      height: 50,
                                      child: CustomButton(
                                        functionToExecute: assistanceVM.sendAssistanceRequest,
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
        selectedIndex: 0,
        itemCornerRadius: 20,
        curve: Curves.easeInBack,
        items: [
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.emergency),
            title: Text('Urgence'),
            activeColor: Colors.red,
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
            activeColor: Colors.grey,
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
          if (value == 1) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SosPneu()));
          } else if (value == 2) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SosBatterie()));
          } else if (value == 3) {
            showPiecesPopup();
          }
        },
      ),
    );
  }

  void showPiecesPopup() {
    final action = CupertinoActionSheet(
      title: Text(
        "Dépanauto",
        style: TextStyle(fontSize: 30),
      ),
      message: Text(
        Constants.SELECT_TYPE_PIECES,
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(Constants.PIECE_OCCASION,
              style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
            DialogBox().showSimpleSnackbar(
                _scaffoldKey, Constants.FEATURE_COMMING_SOON);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(Constants.PIECE_NEUVES,
              style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PiecesNeuvesScreen()));
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(Constants.ANNULER),
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }
}
