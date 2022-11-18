import 'package:flutter/material.dart';

import '../QuizScreen/widgets/quiz_background.dart';
import '../utils/widgets/ratings_body.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Score board',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Rank',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const RatingsBody(
                  rank: '',
                  user: '',
                  points: 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
