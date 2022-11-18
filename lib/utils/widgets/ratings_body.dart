import 'dart:math';

import '../../app.dart';

class RatingsBody extends StatelessWidget {
  final String user;
  final double points;
  final int rankingIndex;

  const RatingsBody(
      {Key? key,
      required this.rankingIndex,
      required this.user,
      required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 30),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              rankingIndex.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(user,
                style: const TextStyle(color: Colors.white, fontSize: 20)),
            Text(points.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20))
          ],
        ),
      ),
    );
  }
}
