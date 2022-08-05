import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AboutPage extends ConsumerWidget {
  final String title;

  const AboutPage(this.title, {Key? key}) : super(key: key);

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
      body: const Center(child: Text('ABOUT')),
    );
  }

  static GoRoute route(String title) {
    return GoRoute(
      path: 'about',
      builder: (context, state) {
        return AboutPage(title, key: state.pageKey);
      },
    );
  }
}
