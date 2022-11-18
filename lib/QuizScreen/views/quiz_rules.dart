import 'package:flutter/material.dart';

class QuizRules extends StatelessWidget {
  const QuizRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: const [
          Text('Rules to Play'),
          SizedBox(height: 10,),
          Text("Failure to pick an asnwer before time runs out means no score for the question"),
          SizedBox(height: 10,),
          Text('The quicker your answer the more points you get'),
          Text('Rules to Play'),


        ],
      ),
    );
  }
}
