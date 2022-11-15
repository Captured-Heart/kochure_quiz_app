import 'package:kochure_quiz_app/desktop/view/quiz_screen_desktop.dart';

import 'app.dart';

class GeneralMain extends StatelessWidget {
  const GeneralMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: DesktopMain(),
      // DesktopMain(),
      mobile: const QuizScreen(),
      tablet: const QuizScreenDesktop(),
      // DesktopMain(),
    );
  }
}
