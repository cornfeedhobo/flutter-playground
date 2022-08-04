import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  static const String name = "Home";
  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: name,
    icon: Icon(Icons.home),
  );

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(name),
    );
  }
}
