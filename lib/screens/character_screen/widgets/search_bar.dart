import 'package:flutter/material.dart';
import 'package:simplecode_3/generated/l10n.dart';
import 'package:simplecode_3/constants/app_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.mainText,
        decoration: InputDecoration(
          hintText: S.of(context).findCharacter,
          fillColor: AppColors.background2,
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.designGrey,
            size: 20,
          ),
          suffixText: '|',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_list_alt,
              color: AppColors.designGrey,
              size: 20,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          isDense: true,
        ),
      ),
    );
  }
}
