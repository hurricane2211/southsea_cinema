import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefName = 'user_name';
const String prefAddress = 'user_address';
const String prefEmail = 'user_email';
const String prefNewsLetter = 'user_newsletter';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() {
    return _SettingsViewState();
  }
}

class _SettingsViewState extends State<SettingsView> {
  late TextEditingController _nameController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  bool _recieveNewsletter = false;
  String _confirmationMessage = '';

  Future<void> _loadSettings() async {
    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    String? savedName = await prefs.getString(prefName);
    String? savedAddress = await prefs.getString(prefAddress);
    String? savedEmail = await prefs.getString(prefEmail);
    bool? savedNewsLetter = await prefs.getBool(prefNewsLetter);

    String name = '';
    if (savedName !=null) {
      name = savedName;
    }

    String address = '';
    if (savedAddress !=null) {
      address = savedAddress;
    }

    String email = '';
    if (savedEmail != null) {
      email = savedEmail;
    }

    bool newsLetter = false;
    if(savedNewsLetter != null) {
      newsLetter = savedNewsLetter;
    }

    if (!mounted) {
      return;
    }

    setState((){
      _nameController.text = name;
      _addressController.text = address;
      _emailController.text = email;
      _recieveNewsletter = newsLetter;
    });
  }

  

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();

    _loadSettings();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveSettings() async {
    String name = _nameController.text.trim();
    String address = _addressController.text.trim();
    String email = _emailController.text.trim();

    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    await prefs.setString(prefName, name);
    await prefs.setString(prefAddress, address);
    await prefs.setString(prefEmail, email);
    await prefs.setBool(prefNewsLetter, _recieveNewsletter);

    UserSettings settings = UserSettings(
        name: name,
        address: address,
        email: email,
        recieveNewsLetter: _recieveNewsletter);

    if (!mounted) {
      return;
    }

    setState(() {
      _confirmationMessage = 'Settings saved for ${settings.name}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle, style: cinemaHeaderStyle),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(17.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Customer Profile',
                  style: TextStyle(
                      color: cinemaBrand,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full name',
                      hintText: '(eg. John Smith)')),
              SizedBox(height: 16),
              TextField(
                  controller: _addressController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Delivery Address',
                      hintText: '(enter full delivery address)')),
              SizedBox(height: 16),
              TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Address',
                      hintText: '(eg. example@example.com)')),
              SizedBox(height: 16),
              Row(children: [
                Expanded(
                  child: Text('Receive Newsletter and offers'),
                ),
                Switch(
                    value: _recieveNewsletter,
                    onChanged: (bool value) {
                      setState(() {
                        _recieveNewsletter = value;
                      });
                    })
              ]),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    label: 'Save Settings',
                    onPressed: _saveSettings,
                  )),
              if (_confirmationMessage.isNotEmpty) ...[
                SizedBox(height: 12),
                Text(_confirmationMessage,
                    style: TextStyle(fontWeight: FontWeight.bold))
              ]
            ])));
  }
}
