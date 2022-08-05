import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends ConsumerWidget {
  final String title;

  const SettingsPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            GoRouter router = GoRouter.of(context);
            if (router.canPop()) {
              router.pop();
            } else {
              router.go('/');
            }
          },
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: const Center(child: Text('SETTINGS')),
    );
  }

  static GoRoute route(String title) {
    return GoRoute(
      path: 'settings',
      builder: (context, state) {
        return SettingsPage(title, key: state.pageKey);
      },
    );
  }
}
