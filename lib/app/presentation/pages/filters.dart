import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.gradientColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(AppSvg.back),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        'Фильтры',
                        style: theme.headlineLarge,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(AppSvg.filterCancel),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'СОРТИРОВАТЬ',
                    style: theme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'По алфавиту',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppSvg.sort),
                          const SizedBox(width: 24),
                          SvgPicture.asset(AppSvg.sort2),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 29),
                  const Divider(
                    height: 2,
                    color: AppColors.gradientColor,
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'СТАТУС',
                    style: theme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                  const SizedBox(height: 29),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Живой',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Мертвый',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Неизвестно',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 29),
                  const Divider(
                    height: 2,
                    color: AppColors.gradientColor,
                  ),
                  const SizedBox(height: 36),
                  Text(
                    'Пол',
                    style: theme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
                  ),
                  const SizedBox(height: 29),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Женский',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Мужской',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          side: const BorderSide(
                              color: AppColors.textColor, width: 2),
                          activeColor: AppColors.blue,
                          value: false,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2))),
                          onChanged: (dfs) {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Бесполый',
                        style: theme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}