import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplecode_3/screens/models/repo_characters.dart';

import '../../constants/app_colors.dart';
import '../../generated/l10n.dart';
import './widgets/search_bar.dart';
import '../bottom_nav_bar.dart';
import '../../constants/app_fonts.dart';
import '../models/repo_characters.dart';
import '../models/character.dart';

import './widgets/list_view.dart';
import './widgets/grid_view.dart';
import './widgets/vmodel.dart';
// part 'widgets/grid_view.dart';
// part 'widgets/status_list_view.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(
          selectedIndex: 0,
        ),
        backgroundColor: AppColors.designWhite,
        body: ChangeNotifierProvider(
          create: (context) => CharacterListVModel(
            repo: Provider.of<RepoPersons>(context, listen: false),
          ),
          builder: (context, _) {
            final personsTotal =
                context.watch<CharacterListVModel>().filteredList.length;
            return Column(
              children: [
                SearchBar(
                  onChanged: (value) {
                    Provider.of<CharacterListVModel>(
                      context,
                      listen: false,
                    ).filter(
                      value.toLowerCase(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // '${S.of(context).totalCharacters.toUpperCase()} : $personTotal',
                        '${S.of(context).totalCharacters.toUpperCase()} : $personsTotal',
                        style: AppTextStyle.s12w500.copyWith(
                          color: AppColors.designGrey,
                        ),
                      ),
                      Consumer<CharacterListVModel>(
                          builder: (context, vmodel, _) {
                        return vmodel.isListView
                            ? IconButton(
                                icon: const Icon(
                                  Icons.list,
                                  color: AppColors.designGrey,
                                  size: 28,
                                ),
                                onPressed: () {
                                  Provider.of<CharacterListVModel>(
                                    context,
                                    listen: false,
                                  ).switchView();
                                },
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.grid_view,
                                  color: AppColors.designGrey,
                                  size: 28,
                                ),
                                onPressed: () {
                                  Provider.of<CharacterListVModel>(
                                    context,
                                    listen: false,
                                  ).switchView();
                                },
                              );
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<CharacterListVModel>(
                    builder: (context, vmodel, _) {
                      if (vmodel.isLoading) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      }

                      if (vmodel.errorMessage != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                vmodel.errorMessage!,
                                // S.of(context).somethingWentWrong,
                              ),
                            ),
                          ],
                        );
                      }
                      if (vmodel.filteredList.isEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(S.of(context).characterListIsEmpty),
                            ),
                          ],
                        );
                      }

                      return vmodel.isListView
                          ? ListViewCharacter(
                              personList: vmodel.filteredList,
                            )
                          : GridViewCharacter(
                              personList: vmodel.filteredList,
                            );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
