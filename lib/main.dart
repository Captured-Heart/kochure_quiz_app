import 'package:flutter/foundation.dart';

import 'LeaderBoard/leaderboard_screen.dart';
import 'app.dart';

void main() {
  runApp(ProviderScope(
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kochure Quiz',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
          primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
      home: const LeaderBoard(),//OnboardScreenDesktop(),
      onGenerateTitle: (context) => 'Kochure Quiz App',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case DesktopMain.routeName:
                return const DesktopMain();
              case AuthScreenDesktop.routeName:
                return const AuthScreenDesktop();

              case OnboardScreenDesktop.routeName:
                return const OnboardScreenDesktop();

              case QuizScreenDesktop.routeName:
                return const QuizScreenDesktop();
              default:
                return const OnboardScreenDesktop();
            }
          },
        );
      },
    );
  }
}
