import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_interview_task/common/resources/colors.dart';
import 'package:movies_interview_task/common/constants/constants.dart';
import 'package:movies_interview_task/ui/pages/bottom_bar/navigation_page.dart';
import 'package:movies_interview_task/ui/pages/splash/splash_page.dart';

import 'common/constants/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(dotenv.get(AppConstants.token));
    return MaterialApp.router(
      title: "Interview task",
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteBackground,
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppRoutes.splash,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: AppRoutes.navigation,
        builder: (BuildContext context, GoRouterState state) {
          return const NavigationPage();
        },
      ),
    ],
  );
}
