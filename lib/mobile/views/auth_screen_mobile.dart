import 'package:form_field_validator/form_field_validator.dart';

import '../../app.dart';

class AuthScreenMobile extends ConsumerStatefulWidget {
  static const String routeName = 'Login_screen';

  const AuthScreenMobile({Key? key}) : super(key: key);

  @override
  AuthScreenMobileState createState() => AuthScreenMobileState();
}

class AuthScreenMobileState extends ConsumerState<AuthScreenMobile> {
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
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text(
                  "Let's play a Quiz",
                  style: TextStyle(
                    fontSize: 20,
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
                const SizedBox(
                  height: 20,
                ),
                Form(
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
                    InkWell(
                      onTap: () {
                        // if (signUpKey.currentState!.validate()) {}
                        pushNamed(context, QuizScreen.routeName);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                              BrandColors.colorPrimary,
                              BrandColors.colorPrimaryMaterial.shade300,
                              BrandColors.colorPrimary,
                              BrandColors.colorPrimaryMaterial.shade600,
                              BrandColors.colorPrimary,
                            ], stops: const [
                              0.1,
                              0.35,
                              0.5,
                              0.75,
                              0.95,
                            ], radius: 10),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12)),
                            border: Border.all(
                              color: BrandColors.colorGreen,
                              width: 2,
                            )),
                        child: const Text(
                          'Start Quiz',
                          style: TextStyle(
                              color: BrandColors.quickactionsBg,
                              fontWeight: FontWeight.bold),
                          textScaleFactor: 1.6,
                        ),
                      ),
                    ),
                  ]
                          .expand((element) => [
                                element,
                                SizedBox(
                                  height: size.height * 0.022,
                                )
                              ])
                          .toList()),
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
