import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplecode_3/constants/app_assets.dart';
import 'package:simplecode_3/constants/app_colors.dart';
import 'package:simplecode_3/constants/app_fonts.dart';

import '../../../generated/l10n.dart';

class LoginTextFormField extends StatelessWidget {
  const LoginTextFormField({
    Key? key,
    required TextEditingController usernameController,
    required this.login,
  })  : _usernameController = usernameController,
        super(key: key);

  final TextEditingController _usernameController;
  final String login;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: TextFormField(
        style: AppTextStyle.s16w400.copyWith(
          color: AppColors.mainText,
        ),
        controller: _usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.designWhite,
          filled: true,
          hintText: S.of(context).login,
          hintStyle: AppTextStyle.s16w400.copyWith(
            color: AppColors.designGrey,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(
              AppAssets.svg.account,
              width: 16,
              color: AppColors.designGrey,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return S.of(context).inputErrorCheckLogin;
          }

          if (value.trim().length <= 3) {
            return S.of(context).inputErrorLoginIsShort;
          }
          return null;
        },
        onSaved: (value) {
          login == value;
        },
      ),
    );
  }
}
