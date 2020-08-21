import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:depanauto/Utils/Utilities.dart';
import 'package:depanauto/views/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  BuildContext activityContext;

  @override
  void initState() {
    super.initState();

    Utilities().verifTokenSaved().then((tokenSaved) {
      if (!tokenSaved) {
        DpanautoAPI().requestNewToken().then((token) {
          if (token != Constants.NO_CONNECTION) {
            Utilities().saveNewToken(token).then((value) {
              Future.delayed(const Duration(milliseconds: 3000), () {
                setState(() {
                  Navigator.pushReplacement(
                      this.activityContext,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                });
              });
            });
          }
        });
      } else {
        Future.delayed(const Duration(milliseconds: 3000), () {
          setState(() {
            Navigator.pushReplacement(this.activityContext,
                MaterialPageRoute(builder: (BuildContext context) => Home()));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    activityContext = context;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/images/logo.png",
                  width: ScreenUtil().setWidth(900),
                  height: ScreenUtil().setHeight(900)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/logo_mcom.png",
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(300)),
            )
          ],
        ),
      ),
    );
  }
}
