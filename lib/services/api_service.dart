import 'dart:convert';
import 'dart:io';
import 'dart:js';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class APIImage extends StatelessWidget {
  
  final String imgURL;
  final String topText;
  final String bottomText;
  final bool deepFried;
  final Color color;

  APIImage({this.imgURL, this.topText, this.bottomText, this.deepFried, this.color});

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {

    String dfString = deepFried ? "1" : "0";
    String params = imgURL + "|" + topText + "|" + bottomText + "|" + dfString;

    final String _baseURL = "https://fast-scrubland-86526.herokuapp.com/api?query=";

    String completeURL = _baseURL + params;

    Image img = Image.network(completeURL);

    return Container(
      color: color,
      child: Row(children: <Widget>[
        img,
        SizedBox(width: 20.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //Text(memeText[1]["Upper Text"]),
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () {
                _launchURL(completeURL);
            })
          ],),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}