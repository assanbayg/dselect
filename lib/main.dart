import 'package:dselect/providers/lesson.dart';
import 'package:dselect/providers/user_provider.dart';
import 'package:dselect/screens/welcome_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/login_screen.dart';
import 'auth/sign_up_screen.dart';
import 'auth/firebase_options.dart';
import 'screens/home/insulin_history_screen.dart';
import 'theme/theme.dart';
import 'providers/glucose_level.dart';
import 'providers/insulin.dart';
import 'providers/nutrition.dart';
import 'screens/nav_bar.dart';
import 'screens/journey/info_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GlucoseLevel()),
        ChangeNotifierProvider(create: (context) => Insulin()),
        ChangeNotifierProvider(create: (context) => Nutrition()),
        ChangeNotifierProvider(create: (context) => Lessons()),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'DSelect',
        theme: basisTheme(),
        // home: const NavigationBarScreen(),
        home: WelcomeScreen(),
        routes: {
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          NavigationBarScreen.routeName: (context) =>
              const NavigationBarScreen(),
          InfoScreen.routeName: (context) => const InfoScreen(),
          InsulinHistoryScreen.routeName: (context) =>
              const InsulinHistoryScreen(),
        },
      ),
    );
  }
}
