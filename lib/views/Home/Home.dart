import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:depanauto/CustomWidgets/HomeBox.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/DialogBox.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/Assistance/Assistance.dart';
import 'package:depanauto/views/Home/HomeVM.dart';
import 'package:depanauto/views/SosBatterie/SosBatterie.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

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

    HomeVM homeVM = HomeVM(_scaffoldKey);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: HeaderWidget(
                  topLeftIcon: "assets/images/info.png",
                  showRightIcon: true),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(280),
                    left: ScreenUtil().setWidth(50)),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    navigate(Assistance());
                                  },
                                  child: HomeBox(
                                      image: "assets/images/urgence.png",
                                      title: "Dépanage\nd'urgence"),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(60)),
                                InkWell(
                                  onTap: () => navigate(SosPneu()),
                                  child: HomeBox(
                                    image: "assets/images/pneu.png",
                                    title: "SOS Pneu",
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(80)),
                              child: Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () => navigate(SosBatterie()),
                                    child: HomeBox(
                                      image: "assets/images/battery.png",
                                      title: "SOS Batterie",
                                    ),
                                  ),
                                  SizedBox(width: ScreenUtil().setWidth(60)),
                                  InkWell(
                                    onTap: () {
                                      showPieceChoices();
                                    },
                                    child: HomeBox(
                                      image: "assets/images/pieces.png",
                                      title: "Pieces neuves \net occasion",
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                    ),
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "depanauto v1.01",
                style: TextStyle(fontFamily: "Poppins-Thin"),
              ),
            ),
          ],
        ));
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
        "Veuillez selectionner le type des pieces",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Pieces occasion", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
            DialogBox().showSimpleSnackbar(
                _scaffoldKey, Constants.FEATURE_COMMING_SOON);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Pieces neuves", style: TextStyle(color: Colors.blue)),
          onPressed: () {
            Navigator.pop(context);
            DialogBox().showSimpleSnackbar(
                _scaffoldKey, Constants.FEATURE_COMMING_SOON);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text("Cancel"),
        isDestructiveAction: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }
}
