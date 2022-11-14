import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kochure_quiz_app/brand_colors.dart';
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
      home: const OnboardScreen(title: 'Flutter Demo Home Page'),
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
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Kochure'),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                // shrinkWrap: true,
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
