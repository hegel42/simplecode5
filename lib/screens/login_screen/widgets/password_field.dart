import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simplecode_3/constants/app_assets.dart';
import 'package:simplecode_3/constants/app_colors.dart';
import 'package:simplecode_3/constants/app_fonts.dart';

import '../../../generated/l10n.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    Key? key,
    required TextEditingController passwordController,
    required this.password,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;
  final String password;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _isObscureText = true;

  get passwordController => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: AppTextStyle.s16w400.copyWith(
          color: AppColors.mainText,
        ),
        controller: widget._passwordController,
        obscureText: _isObscureText ? true : false,
        decoration: InputDecoration(
          hintText: S.of(context).password,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          fillColor: AppColors.designWhite,
          filled: true,
          hintStyle: AppTextStyle.s16w400.copyWith(
            color: AppColors.designGrey,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              AppAssets.svg.password,
              width: 20,
              color: AppColors.designGrey,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          suffixIcon: IconButton(
            splashRadius: 10,
            onPressed: () {
              setState(() {
                _isObscureText = !_isObscureText;
              });
            },
            icon: _isObscureText
                ? const Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.designGrey,
                  )
                : const Icon(
                    Icons.remove_red_eye,
                    color: AppColors.designGrey,
                  ),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return S.of(context).inputErrorCheckPassword;
          }

          if (value.trim().length < 8) {
            return S.of(context).inputErrorPasswordIsShort;
          }
          return null;
        },
        onSaved: (value) {
          widget.password == value;
        },
      ),
    );
  }
}
