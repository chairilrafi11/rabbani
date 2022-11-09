import 'package:chairil/core/app/app.dart';
import 'package:chairil/core/util/util.dart';
import 'package:chairil/presentation/component/component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComponentDialog {
  
  static void dialogLoading() {
    showDialog(
      context: navGK.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                SizedBox(height: 10),
                CupertinoActivityIndicator(),
                SizedBox(height: 10),
                Text(
                  "Mohon Tunggu",
                  style: TextStyle(
                    color: ColorPalette.darkBlue,
                    fontSize: 15),
                )
              ],
            )
          ),
        );
      },
    );
  }

  static void info(String title, String content) {
    showDialog(
      context: navGK.currentContext!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 10),
                Component.textBold(title, colors: ColorPalette.darkBlue),
                const SizedBox(height: 10),
                Component.textDefault(content),
              ],
            )
          ),
        );
      },
    );
  }

}