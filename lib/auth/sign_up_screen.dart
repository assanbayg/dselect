// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dselect/service/user_service.dart';
import 'package:dselect/widgets/date_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dselect/screens/welcome_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/sign up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dateInput = TextEditingController();
  String? selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, WelcomeScreen.routeName),
              icon: const Icon(Icons.west_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context).pleaseJoinUs,
                      style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _usernameController,
                    style: theme.textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      hintText: "Username",
                    ),
                  ),
                  TextField(
                    controller: _nameController,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).nameOfPerson,
                    ),
                  ),
                  TextField(
                    controller: _surnameController,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).surname,
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).email,
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    style: theme.textTheme.bodyMedium,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).password,
                    ),
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
                      DatePickerWidget(
                        dateInputController: _dateInput,
                        theme: theme,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'M',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'F',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      const Text('Female'),
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
            final Map<String, dynamic> userData = {
              'username': _usernameController.text,
              'email': _emailController.text,
              'password': _passwordController.text,
              'first_name': _nameController.text,
              'last_name': _surnameController.text,
              'date_of_birth': _dateInput.text,
              'gender': selectedGender,
            };

            await UserService().registerUser(userData);
          },
          child: const Icon(Icons.arrow_forward_rounded),
        ),
      ),
    );
  }
}
