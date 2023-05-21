import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../auth/login_screen.dart';
import '../auth/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.asset('assets/icons/logo.png'),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'DSelect',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(LoginScreen.routeName),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 50),
              ),
              child: Text(AppLocalizations.of(context).login),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SignUpScreen.routeName),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(220, 50),
              ),
              child: Text(AppLocalizations.of(context).signup),
            ),
          ],
        ),
      ),
    );
  }
}
