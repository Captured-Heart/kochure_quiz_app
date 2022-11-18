import 'package:flutter/material.dart';
import 'package:kochure_quiz_app/app.dart';

class QuizRules extends StatelessWidget {
  const QuizRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: QuizAppBackground(
        size: size,
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text('Rules to Play.', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),),
              const SizedBox(height: 10, ),
              const Text('1. Register with valid details as winners will be sent a message to retrieve their gifts.', style: TextStyle(fontSize: 15, color: Colors.white),),
              const SizedBox(height: 10,),
              const Text("2. Failure to pick an asnwer before time runs out means no score for the question.", style: TextStyle(fontSize: 15, color: Colors.white),),
              const SizedBox(height: 10,),
              const Text('3. The quicker your answer the more points you get.', style: TextStyle(fontSize: 15, color: Colors.white),),
              const SizedBox(height: 20,),
              KochureButton(onTap: (){
                push(context, const QuizScreenDesktop());
              }, text: 'Go to quiz')
            ],
          ),
        ),
      ),
    );
  }
}
