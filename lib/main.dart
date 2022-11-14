import 'package:kochure_quiz_app/app.dart';
import 'package:kochure_quiz_app/general_main.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
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
      theme: ThemeData(
          primarySwatch: createMaterialColor(BrandColors.colorPrimary)),
      home: const GeneralMain(),
      onGenerateTitle: (context) => 'Kochure Quiz App',
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case DesktopMain.routeName:
                return DesktopMain();
              case AuthScreenDesktop.routeName:
                return AuthScreenDesktop();
              case MobileMain.routeName:
                return const MobileMain();
              // ignore: no_duplicate_case_values
              case AuthScreenMobile.routeName:
                return AuthScreenMobile();

              default:
                return const GeneralMain();
            }
          },
        );
      },
    );
  }
}
