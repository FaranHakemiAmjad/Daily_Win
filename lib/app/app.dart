import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'router/app_router.dart';

final appTheme = ThemeData(
  // Color
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(255, 21, 40, 255),
    brightness: Brightness.light,
  ).copyWith(
      primary: Color.fromARGB(255, 21, 40, 255),
      surface: Color.fromARGB(255, 246, 249, 255)
  ),
  // Font
  // textTheme: GoogleFonts.robotoTextTheme(
  //   ThemeData.light().textTheme,
  // ),
  // Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      iconColor: Colors.black87
    ),
  ),
  // App Bar
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
  ),
  useMaterial3: true,
);

class DailyWinApp extends ConsumerWidget {
  const DailyWinApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
