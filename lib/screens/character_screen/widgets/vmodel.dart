import 'package:flutter/material.dart';
import 'package:simplecode_3/screens/models/repo_characters.dart';
import '../../models/character.dart';

class CharacterListVModel with ChangeNotifier {
  CharacterListVModel({required this.repo}) {
    _init();
  }

  String? errorMessage;
  List<Person> filteredList = <Person>[];
  bool isListView = true;
  var isLoading = true;
  final RepoPersons repo;

  var _personsList = <Person>[];

  void _init() {
    repo.readPersons().then((result) {
      errorMessage = result.errorMessage;
      _personsList = result.personsList ?? <Person>[];
      filteredList = _personsList;
      isLoading = false;
      notifyListeners();
    });
  }

  void filter(String query) {
    filteredList = _personsList.where((element) {
      if (element.name == null) return false;
      final name = element.name!.toLowerCase();
      return name.contains(query);
    }).toList();
    notifyListeners();
  }

  void switchView() {
    isListView = !isListView;
    notifyListeners();
  }
}
  // final personList = [
  //   ...dummyList,
  //   ...dummyList,
  // ];
// final dummyList = [
//   Person(
//     name: 'Рик Санчез',
//     species: S.current.speciesHuman,
//     status: S.current.alive,
//     gender: S.current.genderMale,
//   ),
//   Person(
//     name: 'Дирктор Агенства',
//     species: S.current.speciesHuman,
//     status: S.current.alive,
//     gender: S.current.genderMale,
//   ),
//   Person(
//     name: 'Морти Смит',
//     species: S.current.speciesHuman,
//     status: S.current.alive,
//     gender: S.current.genderMale,
//   ),
//   Person(
//     name: 'Саммер Смит',
//     species: S.current.speciesHuman,
//     status: S.current.alive,
//     gender: S.current.genderFemale,
//   ),
//   Person(
//     name: 'Альберт Эйнштейн',
//     species: S.current.speciesHuman,
//     status: S.current.dead,
//     gender: S.current.genderMale,
//   ),
//   Person(
//     name: 'Алан Райс',
//     species: S.current.speciesHuman,
//     status: S.current.dead,
//     gender: S.current.genderMale,
//   ),
// ];
