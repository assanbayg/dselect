import 'package:dselect/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'firebase_options.dart';
import 'theme.dart';
import 'providers/glucose_level.dart';
import 'providers/insulin.dart';
import 'providers/nutrition.dart';
import 'screens/nav_bar.dart';
import 'screens/info_screen.dart';
import 'screens/test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlucoseLevel()),
        ChangeNotifierProvider(create: (context) => Insulin()),
        ChangeNotifierProvider(create: (context) => Nutrition()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DSelect',
        theme: basisTheme(),
        home: const WelcomeScreen(),
        initialRoute: WelcomeScreen.routeName,
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          NavigationBarScreen.routeName: (context) =>
              const NavigationBarScreen(),
          TestScreen.routeName: (context) => const TestScreen(),
          InfoScreen.routeName: (context) => const InfoScreen(),
        },
      ),
    );
  }
}
