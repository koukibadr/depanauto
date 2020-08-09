import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/InputField.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/views/SosPneu/SosPneuVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SosPneu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SosPneu();
}

class _SosPneu extends State<SosPneu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SosPneuVM sosPneuVM = SosPneuVM(_scaffoldKey);

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(
                topLeftIcon: "assets/images/back.png", showRightIcon: false),
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
                              Image.asset("assets/images/pneu.png"),
                              SizedBox(height: 10),
                              Text(
                                "SOS Pneu",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 22),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: "Marque",
                                        numberInput: false,
                                        textController:
                                            sosPneuVM.marqueTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: "Modèle",
                                        numberInput: false,
                                        textController:
                                            sosPneuVM.modeleTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: "N° Chassis",
                                        numberInput: false,
                                        textController:
                                            sosPneuVM.numChassisTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: "N° Tél",
                                        numberInput: true,
                                        textController:
                                            sosPneuVM.phoneNumberTextController,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                      width: 270,
                                      height: 50,
                                      child: RoundedLoadingButton(
                                        color: Color(0xff910112),
                                        child: Text('Valider',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        controller: sosPneuVM.btnController,
                                        onPressed: sosPneuVM.sendPneuRequest,
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
        selectedIndex: 1,
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
            icon: Icon(MyFlutterApp.cog_wheel),
            title: Text('SOS Pneu'),
            activeColor: Colors.red,
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
        onItemSelected: (int value) {},
      ),
    );
  }
}
