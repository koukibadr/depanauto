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

  bool verifPhoneNumber(phone){
    if(phone.length > 8 || phone.length < 8){
      return false ;
    }else{
      return true ;
    }
  }

  bool verifyInputs(marque,modele,chassis,phone){
    if(marque.length > 0 && modele.length > 0 && chassis.length > 0 && Utilities().verifPhoneNumber(phone) == true ){
      return true ;
    }else{
      return false ;
    }
  }

}
