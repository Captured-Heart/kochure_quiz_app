import 'package:form_field_validator/form_field_validator.dart';

import '../../../app.dart';

class AuthScreenDesktop extends ConsumerStatefulWidget {
  static const String routeName = 'login_screen';

  const AuthScreenDesktop({Key? key}) : super(key: key);

  @override
  AuthScreenDesktopState createState() => AuthScreenDesktopState();
}

class AuthScreenDesktopState extends ConsumerState<AuthScreenDesktop> {
  final myController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  @override
  void initState() {
    ref.read(confettiProvider(10)).play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          imgPath: kochureBg6,
          child: Container(
            padding: EdgeInsets.only(
              left: Responsive.isDesktop(context)
                  ? size.width * 0.05
                  : size.width * 0.001,
            ),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                KochureConfettiWidget(ref: ref),
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  "Let's play a Quiz",
                  style: TextStyle(
                    fontSize: 40,
                    color: BrandColors.colorBackground,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter your information below",
                  style: TextStyle(
                    fontSize: 18,
                    color: BrandColors.colorBackground,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                SizedBox(
                  width: Responsive.isDesktop(context)
                      ? size.width * 0.4
                      : size.width * 0.8,
                  child: Form(
                    key: signUpKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                        children: [
                      RegTextField(
                        myController: usernameController,
                        hintText: 'Username',
                        validator:
                            RequiredValidator(errorText: 'field is required'),
                      ),
                      RegTextField(
                        myController: emailController,
                        hintText: 'Email',
                        validator: MultiValidator(
                          [
                            RequiredValidator(
                              errorText: 'field is required',
                            ),
                            EmailValidator(
                              errorText: 'provide a valid email',
                            ),
                          ],
                        ),
                      ),
                      RegTextField(
                        myController: phoneNoController,
                        hintText: 'Phone Number',
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: 'field is required',
                          ),
                          PatternValidator(
                            r'^[0-9\-\+]{9,15}$',
                            errorText: 'provide a valid phone number',
                          ),
                        ]),
                      ),
                      KochureButton(
                        text: 'Start Quiz',
                        width: size.width,
                        onTap: () {
                          // if (signUpKey.currentState!.validate()) {}
                          //TODO: ADD RULES OF THE GAME HERE
                          pushNamed(context, QuizScreenDesktop.routeName);
                        },
                      ),
                    ]
                            .expand((element) => [
                                  element,
                                  SizedBox(
                                    height: size.height * 0.05,
                                  )
                                ])
                            .toList()),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



