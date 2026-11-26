import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';
import 'screens/notification_screen.dart';

void main() => runApp(const KusainSocial());

class KusainSocial extends StatelessWidget {
  const KusainSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kusain Social',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: FB_PRIMARY),
            useMaterial3: true,
          ),
          initialRoute: '/home',
          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) => const NewsFeedScreen(),
            '/notifications': (context) => const NotificationScreen(),
          },
        );
      },
    );
  }
}