import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchoolPage extends ConsumerWidget {
  static const String name = "School";
  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: name,
    icon: Icon(Icons.school),
  );

  const SchoolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(name),
    );
  }
}
