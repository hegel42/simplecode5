import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:simplecode_3/constants/app_colors.dart';

import '../constants/app_assets.dart';
import '../generated/l10n.dart';
import 'character_screen/person_screen.dart';
import 'settings_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  final int selectedIndex;

  PageRouteBuilder _pageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(
        microseconds: 500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppAssets.svg.characterIcon,
            color: selectedIndex == 0 ? null : AppColors.menuBarText,
          ),
          label: S.of(context).characters,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: selectedIndex == 1 ? AppColors.primary : null,
          ),
          label: S.of(context).settings,
        ),
      ],
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.menuBarText,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushAndRemoveUntil(
            _pageRouteBuilder(const PersonScreen()),
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.of(context).pushAndRemoveUntil(
            _pageRouteBuilder(const SettingsScreen()),
            (route) => false,
          );
        }
      },
    );
  }
}




  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // static const List<Widget> _widgetList = <Widget>[
  //   CharacterScreen(),
  //   SettingsScreen(),
  // ];

//     return Container(
//       color: AppColors.background1,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           IconButton(
//             splashRadius: 10,
//             onPressed: () {},
//             icon: const Icon(
//               Icons.abc,
//             ),
//           ),
//           IconButton(
//             splashRadius: 10,
//             onPressed: () {},
//             icon: const Icon(
//               Icons.settings,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
