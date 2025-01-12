import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final Color topOverlayColor = theme.colorScheme.background;
    final Brightness iconBrightness = theme.brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: topOverlayColor,
          statusBarIconBrightness: iconBrightness,
          statusBarColor: topOverlayColor,
          systemStatusBarContrastEnforced: false,
          systemNavigationBarIconBrightness: iconBrightness,
        ),
        child: const Home());
  }
}
