import 'package:chairil/core/app/app.dart';
import 'package:flutter/material.dart';

class Component {

  static Text textBold(String content, {Color colors = Colors.black87,
    double fontSize = 15,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: colors,
        fontFamily: Constant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Text textDefault(
    String content,
    {Color colors = Colors.black54,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    int maxLines = 2,
    TextAlign textAlign = TextAlign.start}) {
    return Text(
      content,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colors,
        fontFamily: Constant.avenirRegular,
        fontSize: fontSize.toDouble(),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static InputDecoration inputDecoration(String label, {String? hintText, Widget? suffixIcon}) => InputDecoration(
    fillColor: ColorPalette.darkBlue,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: ColorPalette.darkBlue),
    ),
    counterText: "",
    hintText: hintText,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    labelText: label,
    labelStyle: const TextStyle(fontSize: Constant.fontSizeMedium, color: ColorPalette.darkBlue),
    suffixIcon: suffixIcon,
    hintStyle: const TextStyle(fontSize: Constant.fontSizeSmall, color: ColorPalette.darkBlue)
  );

  static decorationNoBorder(String hint, {IconData? iconPrefix}) => InputDecoration(
    fillColor: ColorPalette.grey.withAlpha(30),
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
      borderRadius: BorderRadius.circular(10)
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
      borderRadius: BorderRadius.circular(10)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: ColorPalette.grey.withAlpha(30)),
    ),
    prefixIcon: iconPrefix != null ? Icon(
      iconPrefix,
      color: ColorPalette.darkBlue,
      size: 30,
    ) : null,
    counterText: "",
    hintText: hint,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    hintStyle: const TextStyle(fontSize: 12.0, color: ColorPalette.textGrey, fontWeight: FontWeight.w500)
  );

  static button({required String label, required VoidCallback? onPressed, Color color = ColorPalette.darkBlue}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      onPressed: onPressed,
      child: Container(
        // width: SizeConfig.blockSizeHorizontal * 100,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

}