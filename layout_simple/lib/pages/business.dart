import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessPage extends ConsumerWidget {
  static const String name = "Business";
  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: name,
    icon: Icon(Icons.business),
  );

  const BusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text(name),
    );
  }
}
