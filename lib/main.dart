import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kochure_quiz_app/app.dart';
import 'package:kochure_quiz_app/brand_colors.dart';
import 'package:kochure_quiz_app/image_constants.dart';
import 'package:kochure_quiz_app/desktop/view/desktop_main.dart';
import 'package:kochure_quiz_app/mobile/views/mobile_main.dart';
import 'package:kochure_quiz_app/utils/create_material_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kochure Quiz',
        theme: ThemeData(
            primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
        home: const Responsive(
          desktop: DesktopMain(),
          mobile: MobileMain(),
          tablet: DesktopMain(),
        )
        // const OnboardScreenDesktop(title: 'Flutter Demo Home Page'),
        );
  }
}

