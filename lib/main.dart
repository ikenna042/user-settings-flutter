import 'package:flutter/material.dart';
import 'package:user_settings/models.dart';
import 'package:user_settings/preferences_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();
  final _usernameController = TextEditingController();
  var _selectedGender = Gender.FEMALE;
  var _selectedLangugaes = Set<ProgrammingLanguages>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _isEmployed = settings.isEmployed;
      // _selectedLangugaes = settings.programmingLanguages;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
            ),
            RadioListTile(
                title: Text('Female'),
                value: Gender.FEMALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            RadioListTile(
                title: Text('Male'),
                value: Gender.MALE,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            RadioListTile(
                title: Text('Other'),
                value: Gender.OTHER,
                groupValue: _selectedGender,
                onChanged: (newValue) =>
                    setState(() => _selectedGender = newValue)),
            CheckboxListTile(
                title: Text('Dart'),
                value: _selectedLangugaes.contains(ProgrammingLanguages.DART),
                onChanged: (_) {
                  setState(() {
                    _selectedLangugaes.contains(ProgrammingLanguages.DART)
                        ? _selectedLangugaes.remove(ProgrammingLanguages.DART)
                        : _selectedLangugaes.add(ProgrammingLanguages.DART);
                  });
                }),
            CheckboxListTile(
                title: Text('Kotlin'),
                value: _selectedLangugaes.contains(ProgrammingLanguages.KOTLIN),
                onChanged: (_) {
                  setState(() {
                    _selectedLangugaes.contains(ProgrammingLanguages.KOTLIN)
                        ? _selectedLangugaes.remove(ProgrammingLanguages.KOTLIN)
                        : _selectedLangugaes.add(ProgrammingLanguages.KOTLIN);
                  });
                }),
            CheckboxListTile(
                title: Text('JavaScript'),
                value: _selectedLangugaes
                    .contains(ProgrammingLanguages.JAVASCRIPT),
                onChanged: (_) {
                  setState(() {
                    _selectedLangugaes.contains(ProgrammingLanguages.JAVASCRIPT)
                        ? _selectedLangugaes
                            .remove(ProgrammingLanguages.JAVASCRIPT)
                        : _selectedLangugaes
                            .add(ProgrammingLanguages.JAVASCRIPT);
                  });
                }),
            CheckboxListTile(
                title: Text('Java'),
                value: _selectedLangugaes.contains(ProgrammingLanguages.JAVA),
                onChanged: (_) {
                  setState(() {
                    _selectedLangugaes.contains(ProgrammingLanguages.JAVA)
                        ? _selectedLangugaes.remove(ProgrammingLanguages.JAVA)
                        : _selectedLangugaes.add(ProgrammingLanguages.JAVA);
                  });
                }),
            CheckboxListTile(
                title: Text('Swift'),
                value: _selectedLangugaes.contains(ProgrammingLanguages.SWIFT),
                onChanged: (_) {
                  setState(() {
                    _selectedLangugaes.contains(ProgrammingLanguages.SWIFT)
                        ? _selectedLangugaes.remove(ProgrammingLanguages.SWIFT)
                        : _selectedLangugaes.add(ProgrammingLanguages.SWIFT);
                  });
                }),
            SwitchListTile(
                title: Text('Is Employed'),
                value: _isEmployed,
                onChanged: (newValue) {
                  setState(() => _isEmployed = newValue);
                }),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings')),
          ],
        ),
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
        username: _usernameController.text,
        gender: _selectedGender,
        programmingLanguages: _selectedLangugaes,
        isEmployed: _isEmployed);

    print(newSettings);
    _preferencesService.saveSettings(newSettings);
  }
}
