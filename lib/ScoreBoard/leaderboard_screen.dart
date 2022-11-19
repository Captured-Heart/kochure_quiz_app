import '../app.dart';
import '../utils/widgets/ratings_body.dart';

class LeaderScoreBoardScreen extends ConsumerStatefulWidget {
  static const String routeName = 'score_board';
  const LeaderScoreBoardScreen({Key? key}) : super(key: key);

  @override
  ScoreBoardState createState() => ScoreBoardState();
}

class ScoreBoardState extends ConsumerState<LeaderScoreBoardScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final fetchBoard = ref.watch(fetchLeaderBoardProvider);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: QuizAppBackground(
          size: size,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Score board',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Rank',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Score',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: fetchBoard.when(
                    data: (data) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final leader = data[index];

                            return RatingsBody(
                              rankingIndex: index + 1,
                              user: leader.username!,
                              points: leader.scoreTotal!.toDouble(),
                            );
                          });
                    },
                    error: (e, _) {
                      return Center(
                        child: Text(e.toString()),
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                // StreamBuilder<QuerySnapshot>(
                //     stream: FirebaseFirestore.instance
                //         .collection('')
                //         .where(
                //           '',
                //         )
                //         .orderBy('', descending: true)
                //         .snapshots(),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return ListView.builder(itemBuilder: (context, index) {
                //           return RatingsBody(
                //             rankingIndex: index + 1,
                //             user: '',
                //             points: 0,
                //           );
                //         });
                //       } else {
                //         i++;
                //       }
                //       //You can edit this later
                //       return Container();
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
