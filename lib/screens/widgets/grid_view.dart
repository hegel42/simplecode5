import 'package:flutter/material.dart';
import 'package:simplecode_3/screens/widgets/status_grid_view.dart';
import '../models/character.dart';

class GridViewCharacter extends StatelessWidget {
  const GridViewCharacter({
    Key? key,
    required this.personList,
  }) : super(key: key);

  final List<Person> personList;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: personList.map(
        (person) {
          return InkWell(
            child: StatusGridView(person),
            onTap: () {},
          );
        },
      ).toList(),
    );
  }
}
