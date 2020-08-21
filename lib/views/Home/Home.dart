import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/HomeBox.dart';
import 'package:depanauto/CustomWidgets/my_flutter_app_icons.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/Assistance/Assistance.dart';
import 'package:depanauto/views/Home/HomeVM.dart';
import 'package:depanauto/views/PiecesNeuves/PiecesNeuvesScreen.dart';
import 'package:depanauto/views/SosBatterie/SosBatterie.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  BuildContext context;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    this.context = context;

    HomeVM homeVM = HomeVM(_scaffoldKey, context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: HeaderWidget(
                    leftIcon: MyFlutterApp.info__1_,
                    showRightIcon: true,
                    onPressRightIcon: homeVM.closeApp,
                    onPressLeftIcon: homeVM.infoClicked),
              ),
              Align(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              navigate(Assistance());
                            },
                            child: HomeBox(
                                icon: MyFlutterApp.emergency,
                                title: "Dépannage\nd'urgence",
                                boxColor: Colors.red,
                                itemColor: Colors.white),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(60)),
                          InkWell(
                            onTap: () => navigate(SosPneu()),
                            child: HomeBox(
                              icon: MyFlutterApp.wheel,
                              boxColor: Colors.white,
                              itemColor: Colors.black,
                              title: "SOS Pneu",
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(80)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () => navigate(SosBatterie()),
                              child: HomeBox(
                                icon: MyFlutterApp.car,
                                boxColor: Colors.white,
                                itemColor: Colors.black,
                                title: "SOS Batterie",
                              ),
                            ),
                            SizedBox(width: ScreenUtil().setWidth(60)),
                            InkWell(
                              onTap: () {
                                showPieceChoices();
                              },
                              child: HomeBox(
                                icon: MyFlutterApp.shock,
                                boxColor: Colors.white,
                                itemColor: Colors.black,
                                title: "Pièces neuves \net occasion",
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: InkWell(
                    onTap: () {
                      launchURL();
                    },
                    child: Opacity(
                        opacity: 0.2,
                        child: Image.asset("assets/images/logo_mcom.png",
                            width: ScreenUtil().setWidth(300))),
                  ),
                ),
              )
            ],
          )),
    );
  }

  void navigate(Object destination) {
    if (destination is SosPneu) {
      Navigator.push(this.context,
          MaterialPageRoute(builder: (BuildContext context) => SosPneu()));
    } else if (destination is SosBatterie) {
      Navigator.push(this.context,
          MaterialPageRoute(builder: (BuildContext context) => SosBatterie()));
    } else {
      Navigator.push(this.context,
          MaterialPageRoute(builder: (BuildContext context) => Assistance()));
    }
  }

  void showPieceChoices() {
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
            Navigator.push(
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

  Future<void> launchURL() async {
    const url = "https://mcom.tn";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
