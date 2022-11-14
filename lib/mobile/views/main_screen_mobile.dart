import 'package:flutter/material.dart';

import '../../brand_colors.dart';

class AuthScreenMobile extends StatelessWidget {
  const AuthScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: BrandColors.colorPrimaryMaterial,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  Spacer(),
                  Text(
                    "Let's play a Quiz", style: TextStyle(fontSize: 18, color: BrandColors.currencyCardActiveColor),
                  ),
                  Text("Enter your information below", style: TextStyle(fontSize: 14, color: BrandColors.currencyCardActiveColor)
                  ),
                  Spacer(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
