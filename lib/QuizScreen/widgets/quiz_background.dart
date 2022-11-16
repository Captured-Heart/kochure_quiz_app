import '../../app.dart';

class QuizAppBackground extends StatelessWidget {
  const QuizAppBackground({
    Key? key,
    required this.size,
    required this.child,
    this.imgPath,
  }) : super(key: key);

  final Size size;
  final Widget child;
  final String? imgPath;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          imgPath ?? kochureBg3,
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
