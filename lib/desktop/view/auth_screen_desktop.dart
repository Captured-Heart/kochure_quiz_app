import 'dart:convert';
import 'dart:developer';
import 'package:kochure_quiz_app/utils/networking.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;

import '../../app.dart';
import '../../model/user.dart';

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

  Future<List<User>> saveUserData() async {
    var response =
        await http.get(Uri.https('https://dev-quiz.herokuapp.com/', 'users'));
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(name : u["name"], email:  u["email"], phoneNUmber:  u["phone"]);
      users.add(user);
    }
    print("help : ${users.length}");
    return users;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        onTap: () async{
                          // if (signUpKey.currentState!.validate()) {}
                          Map mapEmail = {
                            'email' : emailController.text,
                            'phone': phoneNoController.text
                          };

                          var responseEmail = await RequestHelper.postRequest(mapEmail, 'https://dev-quiz.herokuapp.com/users');

                          if (responseEmail !='failed'){
                            log('response != failed: $responseEmail');

                          }
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

class KochureButton extends StatelessWidget {
  const KochureButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.width,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: width,
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
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: BrandColors.colorGreen,
              width: 2,
            )),
        child: Text(
          text,
          style: const TextStyle(
              color: BrandColors.quickactionsBg, fontWeight: FontWeight.bold),
          textScaleFactor: 1.6,
        ),
      ),
    );
  }
}

class RegTextField extends StatelessWidget {
  const RegTextField({
    Key? key,
    required this.myController,
    required this.hintText,
    this.validator,
  }) : super(key: key);

  final TextEditingController myController;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.emailAddress,
      style: const TextStyle(color: BrandColors.colorBackground, fontSize: 20),
      cursorColor: BrandColors.colorBackground,
      cursorWidth: 6,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        errorStyle: const TextStyle(
          fontWeight: AppFontWeight.medium,
          fontSize: 19,
        ),
        fillColor: BrandColors.colorPrimary.withOpacity(0.3),
        hintStyle: const TextStyle(color: BrandColors.colorBackground),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground, width: 5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorPink),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground, width: 3),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(color: BrandColors.colorBackground),
        ),
      ),
    );
  }
}
