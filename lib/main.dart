import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_to_join/util/theme.dart';
import 'app.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
      builder: (context, ThemeNotifier notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: notifier.darkTheme ? dark : light,
          home: const App(),
        );
      },
    ),
  ));
}
