import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class MyTextFiled extends StatelessWidget {
  const MyTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          hintText: 'Найти персонажа',
          hintStyle: Theme.of(context).textTheme.labelLarge,
          filled: true,
          fillColor: AppColors.gradientColor,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: SvgPicture.asset(AppSvg.search),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: AppColors.textColor.withAlpha(100),
                  width: 1,
                  height: 24,
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(AppSvg.filter),
              ],
            ),
          )),
    );
  }
}
