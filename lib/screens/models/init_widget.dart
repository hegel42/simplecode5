import 'package:flutter/material.dart';
import 'package:simplecode_3/screens/models/repo_characters.dart';
import './repo_settings.dart';
import 'package:provider/provider.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: child,
      providers: [
        Provider(
          create: (context) => RepoSettings(),
        ),
        Provider(
          create: (context) => RepoPersons(),
        ),
      ],
    );
  }
}
