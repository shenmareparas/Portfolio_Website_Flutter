import 'package:flutter/material.dart';

typedef OnSmallScreen = void Function();
typedef OnLargeScreen = void Function();
typedef OnMediumScreen = void Function();

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final OnSmallScreen onSmallScreen;
  final OnMediumScreen onMediumScreen;
  final OnLargeScreen onLargeScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
    required this.onSmallScreen,
    required this.onMediumScreen,
    required this.onLargeScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 428;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 428 &&
        MediaQuery.of(context).size.width < 1125;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1125;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1125) {
          onLargeScreen();
          return largeScreen;
        } else if (constraints.maxWidth < 1125 && constraints.maxWidth > 767) {
          onMediumScreen();
          return mediumScreen;
        } else {
          onSmallScreen();
          return smallScreen;
        }
      },
    );
  }
}
