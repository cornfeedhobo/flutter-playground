import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:layout_simple/layouts/primary.dart';
import 'package:layout_simple/pages/business.dart';
import 'package:layout_simple/pages/home.dart';
import 'package:layout_simple/pages/school.dart';

const String appName = 'Flutter Simple Layout Demo';

Future<void> main() async => runApp(const MyApp());

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PrimaryLayout(
        appName,
        [
          PrimaryLayoutPage(HomePage(), HomePage.navItem),
          PrimaryLayoutPage(BusinessPage(), BusinessPage.navItem),
          PrimaryLayoutPage(SchoolPage(), SchoolPage.navItem),
        ],
      ),
    );
  }
}
