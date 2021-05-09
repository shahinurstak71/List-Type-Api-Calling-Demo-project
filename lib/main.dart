import 'package:ecom_ui/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PostScreen(),
      ),
    );
  }
}
