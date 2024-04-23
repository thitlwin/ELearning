import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

AppTheme currentTheme = AppTheme();

class AppTheme with ChangeNotifier {
  static bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    final Color primaryColor = Color(0xFF6F35A5);
    final Color primaryColorLight = Color(0xFFF1E6FF); //F1E6FF
    final Color secondaryColor = HexColor('#3735A5');
    final Color textFieldBackgroundColor = HexColor("#e6e8ff");
    final Color splashColor = Colors.blueGrey;
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
        primary: primaryColor,
        secondary: secondaryColor,
        primaryVariant: primaryColorLight);
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      secondaryHeaderColor: secondaryColor,
      indicatorColor: Colors.white,
      splashColor: splashColor,
      splashFactory: InkRipple.splashFactory,
      accentColor: secondaryColor,
      canvasColor: Colors.white,
      backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
          splashColor: splashColor),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
      iconTheme: IconThemeData(color: Colors.grey),
      platform: TargetPlatform.iOS,
      // brightness: Brightness.dark,
    );
  }

  // static ThemeData get darkTheme {
  //   return ThemeData(
  //     primaryColor: Colors.black,
  //     accentColor: Colors.red,
  //     backgroundColor: Colors.grey,
  //     scaffoldBackgroundColor: Colors.grey,
  //     textTheme: TextTheme(
  //       headline1: TextStyle(color: Colors.white),
  //       headline2: TextStyle(color: Colors.white),
  //       bodyText1: TextStyle(color: Colors.white),
  //       bodyText2: TextStyle(color: Colors.white),
  //     ),
  //   );
  // }

  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'Newsreader';

    return base.copyWith(
      headline1: base.headline1!.copyWith(fontFamily: fontName),
      headline2: base.headline2!.copyWith(fontFamily: fontName),
      headline3: base.headline3!.copyWith(fontFamily: fontName),
      headline4: base.headline4!.copyWith(fontFamily: fontName),
      headline5: base.headline5!.copyWith(fontFamily: fontName),
      headline6: base.headline6!.copyWith(
          fontFamily: fontName,
          fontWeight: FontWeight.normal,
          color: Colors.white),
      button: base.button!.copyWith(fontFamily: fontName),
      caption:
          base.caption!.copyWith(fontFamily: fontName, color: Colors.white),
      bodyText1: base.bodyText1!.copyWith(fontFamily: fontName),
      bodyText2: base.bodyText2!.copyWith(fontFamily: fontName),
      subtitle1: base.subtitle1!.copyWith(fontFamily: fontName),
      subtitle2: base.subtitle2!.copyWith(fontFamily: fontName),
      overline: base.overline!.copyWith(fontFamily: fontName),
    );
  }
}
