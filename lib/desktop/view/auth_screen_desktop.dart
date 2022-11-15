import 'package:flutter/material.dart';

import '../../brand_colors.dart';

class AuthScreenDesktop extends StatelessWidget {
  static const String routeName = 'login_screen';
  final myController = TextEditingController();

  AuthScreenDesktop({Key? key}) : super(key: key);

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
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Enter your information below",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              const SizedBox(
                height: 10,
              ),
              Column(
                  children: [
                TextField(
                  controller: myController,
                  decoration: const InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                  ),
                ),
                TextField(
                  controller: myController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                  ),
                ),
                TextField(
                  controller: myController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: "Phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          BrandColors.colorPrimaryMaterial.shade100,
                          BrandColors.colorPrimaryMaterial.shade400
                        ]),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: const Text(
                      'Start Quiz',
                      style: TextStyle(
                          color: BrandColors.quickactionsBg,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ]
                      .expand((element) => [
                            element,
                            const SizedBox(
                              height: 25,
                            )
                          ])
                      .toList()),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
