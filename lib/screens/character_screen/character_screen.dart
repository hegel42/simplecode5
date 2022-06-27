import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../generated/l10n.dart';
import './widgets/search_bar.dart';
import '../bottom_nav_bar.dart';
import '../../constants/app_fonts.dart';
import '../models/character.dart';
import './widgets/list_view.dart';
import './widgets/grid_view.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  var isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.designWhite,
      body: Column(
        children: [
          const SearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).totalCharacters.toUpperCase()} : ${personList.length}',
                  style: AppTextStyle.s12w500.copyWith(),
                ),
                IconButton(
                  icon: Icon(
                    isListView ? Icons.list : Icons.grid_view,
                    color: AppColors.designGrey,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        isListView = !isListView;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: isListView
                ? ListViewCharacter(
                    personList: personList,
                  )
                : GridViewCharacter(personList: personList),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
