import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:meme_generator/services/api_service.dart';
import 'package:meme_generator/widgets/large_text_field.dart';
import 'package:meme_generator/widgets/padded_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static String url = "https://i.imgur.com/V73crmb.jpg";
  static String tt = "Top Text";
  static String bt = "Bottom Text";
  static bool df = false;

  Future<void> setRandomText(context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/meme_text.json");
    final jsonResult = json.decode(data);
    setState(() {
      tt = jsonResult[Random().nextInt(57681)]["Upper Text"];
      bt = jsonResult[Random().nextInt(57681)]["Lower Text"];
    });
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meme Generator",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Container(
                child: APIImage(
                  imgURL: url,
                  topText: tt,
                  bottomText: bt,
                  deepFried: df,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        LargeTextField(
                            onChanged: (value) {
                              url = value;
                            },
                            label: "Image URL",
                            hint: "Enter the URL of an image here:"),
                        LargeTextField(
                            onChanged: (value) {
                              tt = value;
                            },
                            label: "Top Text",
                            hint: "Enter the top text here:"),
                        LargeTextField(
                            onChanged: (value) {
                              bt = value;
                            },
                            label: "Bottom Text",
                            hint: "Enter the bottom text here:"),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Deep Fried",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Switch(
                                      value: df,
                                      onChanged: (value) {
                                        setState(() {
                                          df = value;
                                        });
                                      },
                                    )
                                  ],
                                ),
                                PaddedButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  text: "Refresh",
                                ),
                                PaddedButton(
                                  onPressed: () {
                                    setRandomText(context);
                                  },
                                  text: "Generate New",
                                ),
                              ]),
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
