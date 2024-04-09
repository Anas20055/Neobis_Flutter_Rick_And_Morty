import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_app/app/domain/entity/enums.dart';
import 'package:rick_and_morty_app/app/domain/entity/filter_result.dart';
import 'package:rick_and_morty_app/core/constants/app_colors.dart';
import 'package:rick_and_morty_app/core/constants/app_svg.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool isActive = false;
  Status filterStatus = Status.empty;
  Gender filterGender = Gender.empty;

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
                          if (isActive) {
                            final result = FilterResult(
                                filterStatus: filterStatus,
                                filterGender: filterGender);

                            Navigator.pop(context, result);
                          } else {
                            Navigator.pop(context);
                          }
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
                  isActive
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              filterGender = Gender.empty;
                              filterStatus = Status.empty;
                              isActive = false;
                            });
                          },
                          child: SvgPicture.asset(AppSvg.filterCancel),
                        )
                      : const SizedBox(),
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
                  _buidCheckList(
                    theme,
                    'СТАТУС',
                    Status.alive,
                    Status.dead,
                    Status.unknown,
                  ),
                  _buidCheckList(
                    theme,
                    'Пол',
                    Gender.male,
                    Gender.female,
                    Gender.genderless,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column _buidCheckList(
    TextTheme theme,
    String label,
    Enum option1,
    Enum option2,
    Enum option3,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 29),
        const Divider(
          height: 2,
          color: AppColors.gradientColor,
        ),
        const SizedBox(height: 36),
        Text(
          label,
          style: theme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
        ),
        const SizedBox(height: 29),
        _buildFilterCheck(
          theme,
          option1,
        ),
        const SizedBox(height: 24),
        _buildFilterCheck(
          theme,
          option2,
        ),
        const SizedBox(height: 24),
        _buildFilterCheck(
          theme,
          option3,
        ),
      ],
    );
  }

  Row _buildFilterCheck(TextTheme theme, Enum value) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
              side: const BorderSide(color: AppColors.textColor, width: 2),
              activeColor: AppColors.blue,
              value: isFilterActive(value),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              onChanged: (checked) {
                if (checked!) {
                  setState(() {
                    if (value is Status) {
                      filterStatus = value;
                    } else if (value is Gender) {
                      filterGender = value;
                    }
                    isActive = true;
                  });
                }
              }),
        ),
        const SizedBox(width: 16),
        Text(
          isFilterText(value),
          style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  bool isFilterActive(Enum value) {
    if (value is Status) {
      return filterStatus == value;
    } else if (value is Gender) {
      return filterGender == value;
    }
    return false;
  }

  String isFilterText(Enum value) {
    if (value is Status) {
      return value.getStringRu;
    } else if (value is Gender) {
      return value.getStringRu;
    }
    return '';
  }
}
