class Person {
  final String? gender;
  final int? id;
  final String? image;
  final String? location;
  final String? name;
  final String? origin;
  final String? species;
  final String? status;

  const Person({
    this.gender,
    this.id,
    this.image,
    this.location,
    this.name,
    this.origin,
    this.species,
    this.status,
  });
}

final dummyList = [
  const Person(
    name: 'Рик Санчез',
    species: 'Человек',
    status: 'Alive',
    gender: 'Мужской',
  ),
  const Person(
    name: 'Дирктор Агенства',
    species: 'Human',
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
    gender: 'Женский',
  ),
  const Person(
    name: 'Алан Райс',
    species: 'Человек',
    status: 'Dead',
    gender: 'Мужской',
  ),
];

final personList = [
  ...dummyList,
  ...dummyList,
];
