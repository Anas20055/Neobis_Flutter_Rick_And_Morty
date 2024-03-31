part of '../../main.dart';

ThemeData _theme() {
  return ThemeData(
    fontFamily: 'Nunito Sans',
    appBarTheme: _appBarThem(),
    colorScheme: const ColorScheme.dark(
      background: AppColors.background,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
      ),
      labelSmall: TextStyle(
          color: AppColors.textColor,
          fontSize: 10,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 5.0),
              blurRadius: 5.0,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
          fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
      bodyMedium: TextStyle(color: AppColors.textColor, fontSize: 12),
      bodySmall: TextStyle(
          color: AppColors.green, fontWeight: FontWeight.w500, fontSize: 10),
    ),
  );
}

AppBarTheme _appBarThem() {
  return const AppBarTheme(
    backgroundColor: AppColors.background,
    scrolledUnderElevation: 0,
    titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    centerTitle: true,
    elevation: 0,
  );
}
