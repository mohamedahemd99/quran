import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:your_app_name/quran_model.dart';
class QuranProvider with ChangeNotifier{
  QuranModel quranModel;
  Data quranDataModel;
  List<Surahs> surahs=[];
  void getQuranAudioAndText() {
        final url = "http://api.alquran.cloud/v1/quran/ar.alafasy";
    http.get(Uri.parse(url)).then((value) {

      print(value.body);
      quranModel = QuranModel.fromJson(json.decode(value.body));
      print(quranModel.status);
      print(quranModel.data.surahs[0].name);
      surahs=quranModel.data.surahs;
      print(value.statusCode);
      notifyListeners();
    }).catchError((error) {
      print("${error.toString()}");
      notifyListeners();
    });
  } 
}