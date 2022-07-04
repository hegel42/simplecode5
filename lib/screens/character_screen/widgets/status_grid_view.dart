import 'package:flutter/material.dart';
import 'package:simplecode_3/constants/app_fonts.dart';
import 'package:simplecode_3/screens/models/character.dart';
import 'package:simplecode_3/constants/app_colors.dart';
import 'package:simplecode_3/generated/l10n.dart';
import './avatar_image.dart';

class StatusGridView extends StatelessWidget {
  const StatusGridView(
    this.person, {
    Key? key,
  }) : super(key: key);

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
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 18),
          child: AvatarImage(
            person.image,
            radius: 60,
          ),
        ),
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
          '${(person.species) ?? S.of(context).noData}, ${person.gender ?? S.of(context).noData}',
          style: AppTextStyle.secTextStyle,
        ),
      ],
    );
  }
}
