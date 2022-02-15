import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:your_app_name/quran_model.dart';

class AyatScreen extends StatefulWidget {
  AyatScreen({this.surah});

  Surahs surah;

  @override
  _AyatScreenState createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.translate, color: Colors.black),onPressed:(){} ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_forward, color: Colors.black))
        ],
        title: Text(
          widget.surah.name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: InteractiveViewer(
              child: RichText(
                text: TextSpan(
                  text: "",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  children: widget.surah.ayahs
                      .map((e) => TextSpan(text: e.text + " "))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
