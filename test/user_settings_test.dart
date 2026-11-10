import 'package:southsea_cinema/models/user_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('UserSettings initiates with empty strings and false newsletter', (){
    UserSettings settings = UserSettings();
    expect(settings.address, isEmpty);
    expect(settings.email, isEmpty);
    expect(settings.name, isEmpty);
    expect(settings.recieveNewsLetter, isFalse);
  });

  test('UserSettings instance stores the values passed to the constructor', (){
     UserSettings settings = UserSettings(
      address: 'test address', 
      email: 'testemail@email.com',
      name: 'John Smith',
      recieveNewsLetter: true);

      expect(settings.address, 'test address');
      expect(settings.email, 'testemail@email.com');
      expect(settings.name, 'John Smith');
      expect(settings.recieveNewsLetter, isTrue);

  });
}