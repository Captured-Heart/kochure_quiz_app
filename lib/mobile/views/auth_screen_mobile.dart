import 'package:flutter/material.dart';

import '../../brand_colors.dart';

class AuthScreenMobile extends StatelessWidget {
  final myController = TextEditingController();
   AuthScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                "Let's play a Quiz",
                style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Enter your information below",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle:
                      TextStyle(color: BrandColors.colorPrimaryMaterial[400]),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: myController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle:
                      TextStyle(color: BrandColors.colorPrimaryMaterial[400]),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: myController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle:
                      TextStyle(color: BrandColors.colorPrimaryMaterial[400]),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: BrandColors.colorPrimaryMaterial[400],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: const Text(
                    'Start Quiz', style: TextStyle(color: BrandColors.quickactionsBg, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
