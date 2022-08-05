import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BusinessView extends ConsumerWidget {
  const BusinessView({Key? key}) : super(key: key);

  static const String id = 'business';

  static const BottomNavigationBarItem navItem = BottomNavigationBarItem(
    label: 'Business',
    icon: Icon(Icons.business),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: Text('BUSINESS'));
  }
}
