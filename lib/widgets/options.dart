import 'package:flutter/material.dart';

import '../brand_colors.dart';

class Options extends StatelessWidget {
  const Options({Key? key}) : super(key: key);

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
            'A crypto company',
            style: TextStyle(color: Colors.grey.shade400),
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
