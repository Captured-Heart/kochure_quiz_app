
import '../app.dart';

class QuizAppBackground extends StatelessWidget {
  const QuizAppBackground({
    Key? key,
    required this.size,
    required this.title,
    required this.child,
  }) : super(key: key);

  final Size size;
  final List<String> title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          kochureBg3,
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}