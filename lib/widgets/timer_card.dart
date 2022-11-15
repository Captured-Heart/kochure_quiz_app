import 'package:flutter/material.dart';

import '../brand_colors.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
