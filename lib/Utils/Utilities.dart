import 'package:depanauto/Entities/Brand.dart';
import 'package:depanauto/Network/DepanautoAPI.dart';
import 'package:depanauto/views/SosPneu/SosPneu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utilities {
  /*
  */
  Future<bool> verifTokenSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool tokenSaved = prefs.containsKey('userToken');
    return tokenSaved;
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('userToken');
    return token;
  }

  Future<void> saveNewToken(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userToken', token);
  }

  Future<void> saveBrands(brandList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('brands', brandList);
  }

  Future<String> getBrands() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String brands = prefs.getString('brands');
    return brands;
  }

  bool verifPhoneNumber(phone) {
    if (phone.length > 8 || phone.length < 8) {
      return false;
    } else {
      return true;
    }
  }

  bool verifyInputs(marque, modele, chassis, phone) {
    if (marque.length > 0 &&
        modele.length > 0 &&
        chassis.length > 0 &&
        Utilities().verifPhoneNumber(phone) == true) {
      return true;
    } else {
      return false;
    }
  }

  bool verifyInputsArray(inputs) {
    for (var i = 0; i < inputs.length; i++) {
      var elt = inputs[i];
      if (elt.isEmpty) {
        return false;
      }
      
      if (i == inputs.length - 1) {
        if (Utilities().verifPhoneNumber(elt) == false) {
          return false;
        }
      }
    }
    return true;
  }
}
