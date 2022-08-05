import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  static const String id = 'home';

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(Icons.home),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('HOME'));
  }
}
