import 'package:flutter/material.dart';
import 'package:simplecode_3/constants/app_fonts.dart';
import 'package:simplecode_3/screens/models/character.dart';
import 'package:simplecode_3/constants/app_colors.dart';
import 'package:simplecode_3/generated/l10n.dart';
import 'package:simplecode_3/screens/widgets/avatar_image.dart';

class StatusListView extends StatelessWidget {
  const StatusListView(this.person, {Key? key}) : super(key: key);

  final Person person;

  Color _statusColor(String? status) {
    if (status == 'Dead') return AppColors.statusRed;
    if (status == 'Alive') return AppColors.statusGreen;

    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.alive;

    return S.current.noData;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 16,
            right: 18,
          ),
          child: AvatarImage(
            person.image,
            radius: 36,
            // margin: const EdgeInsets.only(right: 40),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _statusLabel(person.status).toUpperCase(),
                style: AppTextStyle.s10w500.copyWith(
                  color: _statusColor(
                    person.status,
                  ),
                  leadingDistribution: TextLeadingDistribution.even,
                ),
              ),
              Text(
                person.name ?? S.of(context).noData,
                style: AppTextStyle.mainTextStyle,
              ),
              Text(
                '${person.species ?? S.of(context).noData}, ${person.gender ?? S.of(context).noData}',
                style: AppTextStyle.secTextStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
