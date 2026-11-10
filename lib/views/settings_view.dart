import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/user_settings.dart';


class SettingsView extends StatefulWidget {
  SettingsView({super.key});

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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _saveSettings() {
    String name = _nameController.text.trim();
    String address = _addressController.text.trim();
    String email = _emailController.text.trim();

    UserSettings settings = UserSettings(
      name: name,
      address: address, 
      email: email,
      recieveNewsLetter: _recieveNewsletter
    );

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Profile',
            style: TextStyle(
              color: cinemaBrand,
              fontSize: 22,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 16),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Full name',
              hintText: '(eg. John Smith)'
            )
          ),
          SizedBox(height: 16),
          
          TextField(
            controller: _addressController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Delivery Address',
              hintText: '(enter full delivery address)'
            )
          ),
          SizedBox(height: 16),

          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email Address',
              hintText: '(eg. example@example.com)'
            )
          ),
          SizedBox(height: 16),



          ]
        )
      )

    );

  }
}

