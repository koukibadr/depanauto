import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:depanauto/CustomWidgets/CustomButton.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/InputField.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/Entities/Brand.dart';
import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/views/Assistance/Assistance.dart';
import 'package:depanauto/views/PiecesNeuves/PiecesNeuvesVM.dart';
import 'package:depanauto/views/SosBatterie/SosBatterie.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class PiecesNeuvesScreen extends StatefulWidget {
  static String marqueSelected = "";
  @override
  State<StatefulWidget> createState() => _PiecesNeuvesScreen();
}

class _PiecesNeuvesScreen extends State<PiecesNeuvesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    PiecesNeuvesVM piecesNeuvesVM = PiecesNeuvesVM(_scaffoldKey, context);

    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(
                leftIcon: Icons.arrow_back_ios,
                showRightIcon: false,
                onPressLeftIcon: piecesNeuvesVM.onPressBack),
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
                              Icon(
                                MyFlutterApp.shock,
                                size: ScreenUtil().setWidth(150),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Pièces Neuves",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: ScreenUtil().setWidth(50)),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: SizedBox(
                                      width: 270,
                                      child: InkWell(
                                          onTap: () {
                                            _modalBottomSheetMenu();
                                          },
                                          child: InputField(
                                            hint: Constants.MARQUE,
                                            numberInput: false,
                                            textController: piecesNeuvesVM
                                                .marqueTextController,
                                            editable: false,
                                            multiline: false,
                                          )))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.MODELE,
                                        numberInput: false,
                                        textController:
                                            piecesNeuvesVM.modeleTextController,
                                        editable: true,
                                        multiline: false,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.NUM_CHASSIS,
                                        numberInput: false,
                                        textController: piecesNeuvesVM
                                            .numChassisTextController,
                                        editable: true,
                                        multiline: false,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      height: 90,
                                      child: InputField(
                                        hint: Constants.LIST_PIECES,
                                        numberInput: false,
                                        textController: piecesNeuvesVM
                                            .listPiecesTextController,
                                        editable: true,
                                        multiline: true,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                      width: 270,
                                      child: InputField(
                                        hint: Constants.NUM_TEL,
                                        numberInput: true,
                                        textController: piecesNeuvesVM
                                            .phoneNumberTextController,
                                        editable: true,
                                        multiline: false,
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: SizedBox(
                                      width: 270,
                                      height: 50,
                                      child: CustomButton(
                                        functionToExecute: piecesNeuvesVM.sendPNRequest,
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
        selectedIndex: 3,
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
            activeColor: Colors.grey,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(MyFlutterApp.shock),
            title: Text('Pieces'),
            activeColor: Colors.red,
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
          } else if (value == 2) {
            Navigator.pushReplacement(
                this.context,
                MaterialPageRoute(
                    builder: (BuildContext context) => SosBatterie()));
          } else {
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

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: ScreenUtil().setHeight(700),
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: FutureBuilder(
                      future: DpanautoAPI().getBrandsList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Brand>> snapshot) {
                        if (snapshot.hasData) {
                          List<Brand> brands = snapshot.data;
                          return ListView(
                            children: brands
                                .map(
                                  (Brand br) => ListTile(
                                    title: Text(
                                      "Marque",
                                      style: TextStyle(
                                          fontFamily: "Poppins-Thin",
                                          fontSize: 14),
                                    ),
                                    subtitle: Text(
                                      br.name,
                                      style: TextStyle(
                                          fontFamily: "Poppins", fontSize: 18),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        PiecesNeuvesScreen.marqueSelected =
                                            br.name;
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                )
                                .toList(),
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ))),
          );
        });
  }
}
