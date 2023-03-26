import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_size.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => const Size(0.0, 0.0);
}

var direction = TextDirection.ltr;

//This is the common function which works whole application, which set Text with different font and color.
setCommonText(
  String title,
  dynamic color,
  dynamic fontSize,
  dynamic fontweight,
  dynamic noOfLine, {
  dynamic talign,
}) {
  return AutoSizeText(
    title,
    textDirection: direction,
    style: kRegularLine22.copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontweight,
    ),
    minFontSize: 6,
    maxFontSize: 18,
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
    textAlign: talign,
  );
}

setCommonTextMap(
  String title,
  dynamic color,
  dynamic fontSize,
  dynamic fontweight,
  dynamic noOfLine, {
  dynamic talign,
}) {
  return AutoSizeText(
    title,
    textDirection: direction,
    style: kSmallLine12.copyWith(
        color: color,
        fontWeight: boldFont,
        decoration: TextDecoration.underline),
    minFontSize: 6,
    maxFontSize: 18,
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
    textAlign: talign,
  );
}

//HMB default Text
customHeaderPop35Text(
    {required String title,
    required Color color,
    dynamic textAlign,
    dynamic noOfLine,
    dynamic overFlow}) {
  return AutoSizeText(
    title,
    textDirection: direction,
    style: kHeadLine35.copyWith(
      color: color,
    ),
    maxLines: noOfLine,
    overflow: overFlow,
    wrapWords: true,
    textAlign: textAlign,
  );
}

setDefaultText(
    String title, dynamic fontSize, dynamic fontweight, dynamic noOfLine,
    {dynamic talign}) {
  return AutoSizeText(
    title,
    textDirection: direction,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontweight,
    ),
    maxLines: noOfLine,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
    textAlign: talign,
  );
}

setHeight(double height) {
  return SizedBox(
    height: height,
  );
}

setWidth(double width) {
  return SizedBox(
    width: width,
  );
}

//This widget will display after payment success.

//This is the common textfield widgets which use whole app.

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

//This is for restaurant close
