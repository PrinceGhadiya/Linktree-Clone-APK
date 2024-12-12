import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linktree_prinx/screens/pages/add_user_page.dart';
import 'package:linktree_prinx/screens/pages/detail_page.dart';
import 'package:linktree_prinx/utils/theme/app_theme.dart';

import '../screens/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/detail',
          page: () => const DetailPage(),
        ),
        GetPage(
          name: '/addUser',
          page: () => const AddUserPage(),
        ),
      ],
      // routes: {
      //   '/': (_) => const HomePage(),
      //   'detail': (_) => const DetailPage(),
      //   'addUser': (_) => const AddUserPage(),
      // },
    );
  }
}
