import 'package:flutter/material.dart';

import '../../models/character.dart';

import './status_list_view.dart';

class ListViewCharacter extends StatelessWidget {
  const ListViewCharacter({
    Key? key,
    required this.personList,
  }) : super(key: key);

  final List<Person> personList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: personList.length,
      separatorBuilder: (context, _) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return InkWell(
          child: StatusListView(personList[index]),
          onTap: () {},
        );
      },
    );
  }
}
