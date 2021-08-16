import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_settings/models.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList('programmingLanguages',
        settings.programmingLanguages.map((lang) => lang.toString()).toList());

    print('Saved Settings');
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();

    final username = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];

    // final programmingLanguagesIndecies =
    //     preferences.getStringList('programmingLanguages');

    // final programmingLanguages = programmingLanguagesIndecies
    //     .map((stringIndex) =>
    //         ProgrammingLanguages.values[int.parse(stringIndex)])
    //     .toSet();

    return Settings(
      username: username,
      isEmployed: isEmployed,
      gender: gender,
      // programmingLanguages: programmingLanguages,
    );
  }
}
