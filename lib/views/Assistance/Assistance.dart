import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:depanauto/CustomWidgets/AssistanceTelNumberBox.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/InputField.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/views/Assistance/AssistanceVM.dart';
import 'package:flutter/material.dart';
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
    
    AssistanceVM assistanceVM = AssistanceVM(_scaffoldKey);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(topLeftIcon: "assets/images/back.png",showRightIcon: false,),
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
                              Image.asset("assets/images/urgence.png"),
                              SizedBox(height: 10),
                              Text(
                                "Dépanage\nd'urgence",
                                style: TextStyle(
                                    fontFamily: "Poppins", fontSize: 22),
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
                                          hint: "N° Tél",
                                          numberInput: true,
                                          textController:
                                              assistanceVM.phoneNumberTextController))),
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
                                        controller: assistanceVM.btnController,
                                        onPressed: assistanceVM.sendAssistanceRequest,
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
            icon: Icon(MyFlutterApp.cog_wheel),
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
        onItemSelected: (int value) {},
      ),
    );
  }
}
