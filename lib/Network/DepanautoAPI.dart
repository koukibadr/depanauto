import 'dart:convert';
import 'dart:io';
import 'package:depanauto/Entities/Brand.dart';
import 'package:depanauto/Utils/Constants.dart';
import 'package:dio/dio.dart';

class DpanautoAPI {
  /*
    requestNewToken : Function executed once in app opening to get token, after that the token will be saved
  */
  Future<String> requestNewToken() async {
    return launchAPI("/register", Map(), Constants.METHOD_POST);
  }

  Future<String> requestPneu(marque, modele, chassis, numTel, token) async {
    return launchAPI(
        "/send-pneu-request",
        {
          "marque": marque,
          "modele": modele,
          "num_chassis": chassis,
          "num_tel": numTel,
          "token": token
        },
        Constants.METHOD_POST);
  }

  Future<String> requestBattery(marque, modele, chassis, numTel, token) async {
    return launchAPI(
        "/send-battery-request",
        {
          "marque": marque,
          "modele": modele,
          "num_chassis": chassis,
          "num_tel": numTel,
          "token": token
        },
        Constants.METHOD_POST);
  }

  Future<String> requestAssistance(token, numTel) async {
    return launchAPI("/send-assistance-request",
        {"num_tel": numTel, "token": token}, Constants.METHOD_POST);
  }

  Future<String> requestPieceNeuves(
      marque, modele, chassis, numTel, token, pieces) async {
    return launchAPI(
        "/send-pieces-neuves-request",
        {
          "marque": marque,
          "modele": modele,
          "num_chassis": chassis,
          "num_tel": numTel,
          "liste_pieces": pieces,
          "token": token
        },
        Constants.METHOD_POST);
  }

  Future<List<Brand>> getBrandsList() async {
    Response response =
        await Dio().get(Constants.API_ENDPOINT + "/liste-marques");
    List<dynamic> body = response.data;
    List<Brand> brands = body
        .map(
          (dynamic item) => Brand.fromJson(item),
        )
        .toList();
    
    return brands;
  }

  Future<String> launchAPI(String url, Map params, String method) async {
    Response response;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Dio dio = new Dio();
        if (params.isEmpty) {
          if (method == Constants.METHOD_GET) {
            response = await dio.get(Constants.API_ENDPOINT + url);
          } else {
            response = await dio.post(Constants.API_ENDPOINT + url);
          }
        } else {
          response = await dio.post(Constants.API_ENDPOINT + url, data: params);
        }
        return response.data.toString();
      }
    } on SocketException catch (_) {
      return "NO_CONNECTION";
    }
  }
}
