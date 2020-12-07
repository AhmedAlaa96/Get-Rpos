import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  /// [openRepoUrl] void function open repo url in browser when pressing on card
  /// @Params [url] String hold the url of the repo
  ///
  static void openRepoUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url, forceSafariVC: false,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  /// [fromStringToColor] function return `Color` change from string to color format
  /// @Params [text] final String hold color hex
  // ignore: non_constant_identifier_names
 static Color fromStringToColor(final String textColor) {
    String hexColor = textColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Color(int.parse("0x00000000"));
  }
}