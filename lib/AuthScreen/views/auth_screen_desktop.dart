import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kochure_quiz_app/AuthScreen/models/quiz_model.dart';
import 'package:kochure_quiz_app/AuthScreen/provider/auth_provider.dart';
import 'package:kochure_quiz_app/AuthScreen/services/post_auth_firebase.dart';
import 'package:kochure_quiz_app/utils/connectivity.dart';
import 'package:kochure_quiz_app/utils/networking.dart';

import '../../../app.dart';
import '../../utils/top_snack_bar.dart';
import '../services/auth_services.dart';

class AuthScreenDesktop extends ConsumerStatefulWidget {
  static const String routeName = 'login_screen';

  const AuthScreenDesktop({Key? key}) : super(key: key);

  @override
  AuthScreenDesktopState createState() => AuthScreenDesktopState();
}

class AuthScreenDesktopState extends ConsumerState<AuthScreenDesktop> {
  // final myController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  late final Connectivity connectivity;
  @override
  void initState() {
    ref.read(confettiProvider(10)).play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loading = ref.watch(loadingProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          imgPath: kochureBg6,
          child: FullScreenLoader(
            isLoading: loading,
            title: 'Creating user, please wait...',
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
                          onTap: () async {
                            // RequestHelper.submit(context: context);
                            if (signUpKey.currentState!.validate()) {
                              // Map map = {
                              //   'name': usernameController.text,
                              //   'email': emailController.text,
                              //   'phone': phoneNoController.text,
                              // };

                              await ref.read(authProvider).signUpWithEmail(
                                    email: emailController.text,
                                    password: phoneNoController.text,
                                    context: context,
                                    ref: ref,
                                    username: usernameController.text,
                                    phoneNo: phoneNoController.text,
                                  );

                              // try {
                              //   Map map = QuizModel(
                              //     username: usernameController.text,
                              //     phoneNo: emailController.text,
                              //     userId: ref.watch(currentUserUUIDProvider),
                              //     score: '',
                              //     scoreTotal: '',
                              //     questionNo: '',
                              //     createdAt: Timestamp.now(),
                              //   ).toJson();
                              //   await postParticipantsDetailsOnSignUp(ref, map)
                              //       .whenComplete(() => pushNamed(
                              //           context, QuizScreenDesktop.routeName));
                              // } on FirebaseException catch (e) {
                              //   return topSnack(
                              //     context: context,
                              //     message: e.message!,
                              //     isError: true,
                              //   );
                              // }
                              ref
                                  .read(loadingProvider.notifier)
                                  .update((state) => false);

                              //     .whenComplete(() async {
                              //   Map map = QuizModel(
                              //     username: usernameController.text,
                              //     phoneNo: phoneNoController.text,
                              //     userId: ref.watch(currentUUIDProvider),
                              //     score: '',
                              //     scoreTotal: '',
                              //     questionNo: '',
                              //     createdAt: Timestamp.now(),
                              //   ).toJson();
                              //   await postParticipantsDetailsOnSignUp(ref, map);
                              //   ref
                              //       .read(loadingProvider.notifier)
                              //       .update((state) => false);
                              // });

                              // await  RequestHelper.login(map: map, context: context)
                              //       .whenComplete(() => ref
                              //           .read(loadingProvider.notifier)
                              //           .update((state) => false));
                            }
                            // pushNamed(context, QuizScreenDesktop.routeName);
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
      ),
    );
  }
}
