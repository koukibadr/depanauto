import 'package:depanauto/Utils/Constants.dart';
import 'package:dio/dio.dart';

class DpanautoAPI {
  
  /*
    requestNewToken : Function executed once in app opening to get token, after that the token will be saved
  */
  Future<String> requestNewToken() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(Constants.API_ENDPOINT+"/register");
    return response.data.toString();
  }

  Future<String> requestPneu(marque,modele,chassis,numTel,token) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(Constants.API_ENDPOINT+"/send-pneu-request",data: {"marque" : marque,"modele":modele,"num_chassis":chassis,"num_tel": numTel, "token": token});
    return response.data.toString();
  }

  Future<String> requestBattery(marque,modele,chassis,numTel,token) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(Constants.API_ENDPOINT+"/send-battery-request",data: {"marque" : marque,"modele":modele,"num_chassis":chassis,"num_tel": numTel, "token": token});
    return response.data.toString();
  }

  Future<String> requestAssistance(token,numTel) async {
    Response response;
    Dio dio = new Dio();
    response = await dio.post(Constants.API_ENDPOINT+"/send-assistance-request",data: {"num_tel": numTel, "token": token});
    return response.data.toString();
  }
}
