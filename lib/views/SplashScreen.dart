import 'package:depanauto/Network/DepanautoAPI.dart';
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
        child: Center(
          child: Image.asset("assets/images/logo.png",width: ScreenUtil().setWidth(800), height: ScreenUtil().setHeight(800)),
        ),
      ),
    );
  }
}
