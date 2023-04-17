import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:receptyUser/core/constants/app_colors.dart';

class LanguageDialog extends StatefulWidget {
  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  String _selectedLanguage = 'English';

  List<String> _languages = ['English', 'Czech', 'Slovak'];


  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text('Select Language'),
      content: DropdownButtonFormField<String>(
        value: _selectedLanguage,
        items: _languages.map((language) {
          return DropdownMenuItem<String>(
            value: language,
            child: Text(language),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedLanguage = value!;

          });
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',style: TextStyle(color: Colors.white),),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (_selectedLanguage == "English") {
                context.setLocale(Locale('en', 'US'));
              } else if (_selectedLanguage == "Czech") {
                context.setLocale(Locale('cs', 'CZ'));
              }
              else{
                context.setLocale(Locale('sk', 'SK'));
              }
            });
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),),

          child: Text('Save',style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}
