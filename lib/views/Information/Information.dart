import 'package:depanauto/CustomWidgets/CustomText.dart';
import 'package:depanauto/CustomWidgets/HeaderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Information extends StatelessWidget {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: HeaderWidget(
                leftIcon: Icons.arrow_back_ios,
                showRightIcon: false,
                onPressLeftIcon: onPressBack),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150, left: 10, right: 10, bottom: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomText( 
                    text: "Présentation",
                    font: "Poppins-Bold",
                    size: 18,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 10
                  ),
                  CustomText(
                    text: "DépanAuto est une idée innovante",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black
                  ),
                  SizedBox(
                    height: 10
                  ),
                  CustomText(
                    text:
                        "DépanAuto vous assiste dans tout type de panne qui peut survenir à votre véhicule où que vous soyez.\nContactez-nous et nos équipes se déplaceront jusqu'à vous pour vous donner le coup de main nécessaire,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black
                  ),
                  SizedBox(
                    height: 10
                  ),
                  CustomText(
                    text:
                        "DépanAuto est l'application qu'il vous faut lorsque vous êtes au volant.",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black
                  ),
                  SizedBox(
                    height: 10
                  ),
                  CustomText(
                    text: "DépanAuto est une équipe jeune et serviable à votre service à tout moment,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        "Actuellement, nos services s'étalent sur le grand Tunis.",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Nous offrons actuellement :",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  CustomText(
                    text:
                        "1. un service de dépannage d'urgence, idéal lorsque vous avez eu un incident sur la route,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  CustomText(
                    text: "2. SOS Pneu : livraison et installation de pneu,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  CustomText(
                    text:
                        "3. SOS Batterie : livraison et installation de batterie,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  CustomText(
                    text:
                        "4. Pièces neuves : Meilleur devis pour les pièces neuves qui vous manquent,",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  CustomText(
                    text: "5. Pièces occasion : disponible prochainement ...",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomText(
                    text:
                        "Les frais de service vous seront annoncés dès le premier contact par tél en toue transparence",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "Pour toute information, appelez nous au\n55 850 022",
                    font: "Poppins-Bold",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomText(
                    text: "L'équipe DépanAuto",
                    font: "Poppins",
                    size: 14,
                    textColor: Colors.black,
                  ),
                  Image.asset("assets/images/logo.png",
                      width: ScreenUtil().setWidth(500),
                      height: ScreenUtil().setHeight(500))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onPressBack() {
    Navigator.pop(context);
  }
}
