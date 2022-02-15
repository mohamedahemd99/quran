import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/ayat_screen.dart';
import 'package:your_app_name/ayat_screen_english.dart';
import 'package:your_app_name/provider_quraan.dart';
import 'package:your_app_name/quran_model.dart';

const String androidMobID = "ca-app-pub-3940256099942544/6300978111";
const String iosMobID = "ca-app-pub-3940256099942544/2934735716";

class AdMobScreen extends StatefulWidget {
  AdMobScreen();

  @override
  _AdMobScreenState createState() => _AdMobScreenState();
}

class _AdMobScreenState extends State<AdMobScreen> {
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: Platform.isAndroid ? androidMobID : iosMobID,
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: AdListener(),

  // );

  @override
  void initState() {
    super.initState();
    Provider.of<QuranProvider>(context, listen: false).getQuranAudioAndText();
    // myBanner.load();
  }

  int counter = 0;

  @override
  Widget build(BuildContext context) {
   var  provider = Provider.of<QuranProvider>(context);
    print(provider.surahs);
    return Scaffold(
        body: provider.surahs.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              )
            : Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: double.infinity,
                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AyatScreen(
                                          surah: provider.surahs[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child:
                                  Text("${provider.surahs[index].name}"),

                                ),
                                IconButton(onPressed: (){Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AyatEnglishScreen(
                                      surah: provider.surahs[index],
                                    ),
                                  ),
                                );

                                }, icon:Icon(Icons.translate))

                              ],
                            );
                          },
                          itemCount: provider.surahs.length),
                    ),
                    // Positioned(
                    //   bottom: 30,
                    //   child: Container(
                    //     child:
                    //     AdWidget(
                    //       ad: myBanner,
                    //     ),
                    //     height: 60,
                    //     width: MediaQuery
                    //         .of(context)
                    //         .size
                    //         .width,
                    //   ),
                    // )
                  ],
                ),
              ));
  }
}
