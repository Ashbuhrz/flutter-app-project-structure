import 'package:get/get.dart';

class TranslationMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'login': 'Login',
          'logout': 'Logout',
          'username': 'Username',
          'password': 'Password',
          'forget_password': 'Forget Password?',
          'restore_password': 'Restore Password',
          'email': 'Email',
          'submit': 'Submit',
          'back': 'Back',
           
        },
        'de_DE': {
          'login': 'Anmelden',
          'logout': 'Abmelden',
          'username': 'Benutzername',
          'password': 'Passwort',
          'forget_password': 'Passwort vergessen?',
          'restore_password': 'Passwort ändern',
          'email': 'E-Mail',
          'submit': 'Absenden',
          'back': 'Zurück',
          
        },
      };
}
