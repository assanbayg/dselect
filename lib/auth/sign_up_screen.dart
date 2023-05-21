// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:dselect/screens/nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/welcome_screen.dart';
import 'auth_services.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WelcomeScreen.routeName);
                  },
                  icon: const Icon(Icons.west_rounded),
                ),
                const SizedBox(
                  width: 55,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context).pleaseJoinUs,
                      style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context).nameOfPerson,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).surname,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _surnameController,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).email,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).password,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    style: theme.textTheme.bodyMedium,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        AppLocalizations.of(context).dateOFBirth,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: theme.primaryColor,
                                    onPrimary: Colors.white,
                                    onSurface: theme.primaryColor,
                                  ),
                                  textButtonTheme: TextButtonThemeData(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                child: child!,
                              );
                            },
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              _dateInput.text = formattedDate;
                            });
                          } else {}
                        },
                        child: Text(_dateInput.text == ""
                            ? AppLocalizations.of(context).dayMonthYear
                            : _dateInput.text),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: () async {
            final message = await AuthService().register(
              email: _emailController.text,
              password: _passwordController.text,
              name: _nameController.text,
              surname: _surnameController.text,
              dateOfBirth: _dateInput.text,
            );
            if (message!.contains('Success')) {
              Navigator.pushNamed(context, NavigationBarScreen.routeName);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_forward_rounded,
          ),
        ),
      ),
    );
  }
}
