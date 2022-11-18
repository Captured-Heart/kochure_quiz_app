import '../../app.dart';

Align linearSecsCounter(Size size, double time1) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      width: size.width * 0.5,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: BrandColors.colorBackground,
            width: 3,
          )),
      padding: const EdgeInsets.only(left: 1),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: LinearProgressIndicator(
              minHeight: 40,
              value: time1 / 5,
              // snapshot.data! / 10,
              valueColor: AlwaysStoppedAnimation<Color>(
                time1 < 3
                    ? time1 < 2
                        ? BrandColors.colorPink
                        : BrandColors.colorOrange
                    : BrandColors.colorPrimaryDark,
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                Text(
                  '$time1 secs',
                  style: const TextStyle(color: BrandColors.colorBackground),
                  textScaleFactor: 1.5,
                ),
                const Icon(
                  Icons.access_time_rounded,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
