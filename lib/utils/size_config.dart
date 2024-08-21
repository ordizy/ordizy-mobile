import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;

  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;

    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    isMobilePortrait = isPortrait && screenWidth < 450;
  }
}

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizeConfig sizeConfig)? largeScreen;
  final Widget Function(BuildContext context, SizeConfig sizeConfig)? mediumScreen;
  final Widget Function(BuildContext context, SizeConfig sizeConfig)? smallScreen;

  const ResponsiveWidget({
    Key? key,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (SizeConfig.screenWidth >= 1200) {
      return largeScreen!(context, SizeConfig());
    } else if (SizeConfig.screenWidth >= 800 && SizeConfig.screenWidth < 1200) {
      return mediumScreen!(context, SizeConfig());
    } else {
      return smallScreen!(context, SizeConfig());
    }
  }
}
