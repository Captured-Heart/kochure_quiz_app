import 'package:flutter/material.dart';

import '../../brand_colors.dart';
import 'mobile_main.dart';

class AuthScreenMobile extends StatelessWidget {
  static const String routeName = 'login_screen';

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
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  border:  OutlineInputBorder(
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
                decoration:const  InputDecoration(
                  hintText: "Email",
                  border:  OutlineInputBorder(
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
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const MobileMain ();
                  }));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      gradient: LinearGradient ( colors:[BrandColors.colorPrimaryMaterial.shade100, BrandColors.colorPrimaryMaterial.shade400]),
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
              const Spacer( flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
