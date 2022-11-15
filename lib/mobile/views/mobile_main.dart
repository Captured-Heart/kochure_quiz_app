import '../../app.dart';
import '../../widgets/options.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 35,
                  decoration: BoxDecoration(
                    border: Border.all(color: BrandColors.colorGrey),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Stack(
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) => Container(
                          width: constraints.maxWidth * 0.5,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              gradient: LinearGradient(colors: [
                                BrandColors.colorPrimaryMaterial.shade300,
                                BrandColors.colorPrimaryMaterial.shade500
                              ])),
                        ),
                      ),
                      Positioned.fill(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '18 secs',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.access_time_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text.rich(
                  TextSpan(
                    text: "Question 1",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    children: [
                      TextSpan(
                        text: "/10",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: BrandColors.colorGrey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('What is Kochure'),
                      //Options Card
                     Options(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
