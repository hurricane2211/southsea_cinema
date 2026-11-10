class UserSettings {
  String name;
  String address;
  String email;
  bool recieveNewsLetter;

  UserSettings(
      {this.name = '',
      this.address = '',
      this.email = '',
      this.recieveNewsLetter = false});
}
