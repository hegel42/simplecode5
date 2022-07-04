import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:simplecode_3/constants/app_fonts.dart';
import 'package:simplecode_3/screens/bottom_nav_bar.dart';
import 'package:simplecode_3/screens/models/repo_settings.dart';
import '../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        selectedIndex: 1,
      ),
      appBar: AppBar(
        title: Text(S.of(context).AppTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).language}: '),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      S.of(context).english,
                      style: AppTextStyle.s16w400,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(
                      S.of(context).russian,
                    ),
                  ),
                ],
                onChanged: (value) async {
                  if (value == null) return;
                  if (value == 'ru_RU') {
                    await S.load(
                      const Locale('ru', 'RU'),
                    );
                    setState(() {});
                  } else if (value == 'en') {
                    await S.load(
                      const Locale('en'),
                    );
                    setState(() {});
                  }
                  if (!mounted) return;
                  // TODO add !mounted
                  final repoSettings =
                      Provider.of<RepoSettings>(context, listen: false);
                  repoSettings.saveLocale(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
