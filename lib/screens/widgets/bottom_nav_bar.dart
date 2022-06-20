import 'package:flutter/material.dart';

import 'package:simplecode_3/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
        ],
      ),
    );
  }
}
