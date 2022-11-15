import 'package:flutter/material.dart';

import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('What is Kochure'),
          //Options Card
          SizedBox(
            height: 20 / 2,
          ),
          Options(),
          Options(),
          Options(),
          Options(),
        ],
      ),
    );
  }
}
