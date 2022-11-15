import 'package:kochure_quiz_app/app.dart';


class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.question,
  }) : super(key: key);
  final String question;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: BrandColors.colorGrey),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            question,
            style: TextStyle(color: Colors.grey.shade500),
            textScaleFactor: Responsive.isMobile(context) ? 1 : 2,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
