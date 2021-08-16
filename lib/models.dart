enum Gender { FEMALE, MALE, OTHER }

enum ProgrammingLanguages { DART, KOTLIN, JAVASCRIPT, JAVA, SWIFT }

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguages> programmingLanguages;
  final bool isEmployed;

  Settings(
      {this.username, this.gender, this.programmingLanguages, this.isEmployed});
}
