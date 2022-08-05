import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:layout_gorouter/pages/about.dart';
import 'package:layout_gorouter/pages/main.dart';
import 'package:layout_gorouter/pages/settings.dart';

const String appName = 'Flutter Simple Layout Demo';

Future<void> main() async => runApp(MyApp());

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: '/main',
    routes: [
      // Root
      GoRoute(
        path: '/',
        redirect: (_) => '/main',
        routes: [
          MainPage.route(appName),
          SettingsPage.route(appName),
          AboutPage.route(appName),
        ],
      ),
    ],
    // show the current router location as the user navigates page to page; note
    // that this is not required for nested navigation but it is useful to show
    // the location as it changes
    navigatorBuilder: (context, state, child) => Material(
      child: Column(
        children: [
          Expanded(child: child),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(state.location),
          ),
        ],
      ),
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
    );
  }
}
