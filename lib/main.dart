import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_interview_task/common/resources/colors.dart';
import 'package:movies_interview_task/data/providers/connectivity_provider.dart';
import 'package:movies_interview_task/ui/pages/bottom_bar/movie_details_page.dart';
import 'package:movies_interview_task/ui/pages/bottom_bar/navigation_page.dart';
import 'package:movies_interview_task/ui/pages/splash/splash_page.dart';

import 'common/constants/routes.dart';
import 'data/models/domain/movie.dart';
import 'data/models/persistence/db_genre.dart';
import 'data/models/persistence/db_movie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DbGenreAdapter());
  Hive.registerAdapter(DbMovieAdapter());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      print('Couldn\'t check connectivity status');
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    ref.read(connectivityProvider.notifier).state = result;
  }

  @override
  Widget build(BuildContext context) {
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
      GoRoute(
        path: AppRoutes.details,
        pageBuilder: (context, state) {
          final Map<String, dynamic> extras =
              state.extra as Map<String, dynamic>;
          final movie = extras['movie'] as Movie;

          return CustomTransitionPage(
            key: state.pageKey,
            child: MovieDetailsPage(movie: movie),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ],
  );
}
