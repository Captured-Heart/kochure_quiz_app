import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget? mobile;
  final Widget ? tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
     this.mobile,
     this.tablet,
     this.desktop,
  }) : super(key: key);

// This size work fine on my design,

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 680;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 980 &&
      MediaQuery.of(context).size.width >= 680;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 980;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 980 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 980) {
          return desktop!;
        }
        // If width it less then 980 and more then 680 we consider it as tablet
        else if (constraints.maxWidth >= 680) {
          return tablet!;
        }
        // Or less then that we called it mobile
        else {
          return mobile!;
        }
      },
    );
  }
}
