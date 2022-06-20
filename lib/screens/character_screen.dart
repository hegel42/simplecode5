import 'package:flutter/material.dart';
import 'package:simplecode_3/screens/widgets/grid_view.dart';
import '../constants/app_colors.dart';
import '../generated/l10n.dart';
import './widgets/search_bar.dart';
import './widgets/bottom_nav_bar.dart';
import '../constants/app_fonts.dart';
import 'models/character.dart';
import './widgets/list_view.dart';

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
                  '${S.of(context).totalCharacters.toUpperCase()} : ${_personList.length}',
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
                    personList: _personList,
                  )
                : GridViewCharacter(personList: _personList),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

final _dummyList = [
  const Person(
    name: 'Рик Санчез',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Дирктор Агенства',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Морти Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Саммер Смит',
    species: 'Человек',
    status: 'Alive',
    gender: 'Женский',
  ),
  const Person(
    name: 'Альберт Эйнштейн',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Алан Райс',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
];

final _personList = [
  ..._dummyList,
  ..._dummyList,
];
