import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchoolView extends ConsumerWidget {
  const SchoolView({Key? key}) : super(key: key);

  static const String id = 'school';

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: 'School',
    icon: Icon(Icons.school),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('SCHOOL'));
  }
}
