import 'package:flutter/material.dart';

import '../brand_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          color: BrandColors.colorPrimaryMaterial,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [Text(
                "Let's play a Quiz"
              ),
              Text("Enter your information below"),
            ],
          ),
        ),
      ),
    );
  }
}
