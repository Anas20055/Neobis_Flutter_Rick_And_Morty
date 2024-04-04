import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/params.dart';
import 'package:rick_and_morty_app/app/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class MyTextFiled extends StatefulWidget {
  final void Function()? onFilterPressed;
  const MyTextFiled({super.key, this.onFilterPressed});

  @override
  State<MyTextFiled> createState() => _MyTextFiledState();
}

class _MyTextFiledState extends State<MyTextFiled> {
  final controller = TextEditingController();
  @override
  void initState() {
    controller.addListener(() {
      final text = controller.text;
      BlocProvider.of<CharacterBloc>(context)
          .add(GetCharacters(Params(name: text)));
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) => (),
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
                GestureDetector(
                    onTap: _onTap, child: SvgPicture.asset(AppSvg.filter)),
              ],
            ),
          )),
    );
  }

  void _onTap() => widget.onFilterPressed?.call();
}
