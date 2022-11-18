import '../../app.dart';

class RatingsBody extends StatelessWidget {
  final String rank, user;
  final double points;

  const RatingsBody(
      {Key? key, required this.rank, required this.user, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rank,
          style: const TextStyle(color: Colors.white),
        ),
        Text(user, style: const TextStyle(color: Colors.white)),
        Text(points.toString(), style: const TextStyle(color: Colors.white,))
      ],
    );
  }
}
