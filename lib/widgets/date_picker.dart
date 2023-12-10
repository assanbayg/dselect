import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    required this.dateInputController,
    required this.theme,
  }) : super(key: key);

  final TextEditingController dateInputController;
  final ThemeData theme;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: widget.theme.primaryColor,
                  onPrimary: Colors.white,
                  onSurface: widget.theme.primaryColor,
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
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          setState(() {
            widget.dateInputController.text = formattedDate;
          });
          // widget.dateInputController.text = formattedDate;
        }
      },
      child: Text(
        widget.dateInputController.text == ""
            ? AppLocalizations.of(context).dayMonthYear
            : widget.dateInputController.text,
      ),
    );
  }
}
