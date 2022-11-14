import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kochure_quiz_app/brand_colors.dart';
import 'package:kochure_quiz_app/image_constants.dart';
import 'package:kochure_quiz_app/screens/main_screen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Kochure Quiz',
      theme: ThemeData(
          primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
      home: const MainScreen(),
    );
  }
}

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key, required this.title});

  final String title;

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  List<String> title = [
    'goood',
    'build',
    'doooom',
    'final',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.red,
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.2,
              child: Row(
                children: [
                  Image.asset(
                    kochureLogo,
                    height: size.height * 0.1,
                    width: size.width * 0.1,
                    fit: BoxFit.fill,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Kochure',
                        speed: const Duration(milliseconds: 200),
                        textStyle: GoogleFonts.merriweatherSans()
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(title[index]),
                      subtitle: const Text('ndsdbhsds'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
