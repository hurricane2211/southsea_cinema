import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

void main() {

  setUp(() {
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.empty();
  });
  testWidgets('SettingsView displays correct fields and switch',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();

    expect(find.text('Customer Profile'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Save Settings'), findsOneWidget);
  });

  testWidgets('Toggling switch and save settings button updates state',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();

    Finder nameField = find.widgetWithText(TextField, 'Full name');
    Finder addressField = find.widgetWithText(TextField, 'Delivery Address');
    Finder emailField = find.widgetWithText(TextField, 'Email Address');

    await tester.enterText(nameField, 'John Smith');
    await tester.enterText(addressField, '3 Example Road');
    await tester.enterText(emailField, 'example@example.com');

    Finder switchFinder = find.byType(Switch);
    expect(tester.widget<Switch>(switchFinder).value, isFalse);

    await tester.tap(find.text('Save Settings'));
    await tester.pump();

    expect(find.text('Settings saved for John Smith'), findsOneWidget);

    SharedPreferencesAsync prefs = SharedPreferencesAsync();
    expect(await prefs.getString(prefName), 'John Smith');
    expect(await prefs.getString(prefAddress), '3 Example Road');
    expect(await prefs.getString(prefEmail), 'example@example.com');
    expect(await prefs.getBool(prefNewsLetter), isFalse);


    await tester.pumpWidget(SizedBox.shrink());
    await tester.pumpWidget(MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();
    expect(await prefs.getString(prefName), 'John Smith');
    expect(await prefs.getString(prefAddress), '3 Example Road');
    expect(await prefs.getString(prefEmail), 'example@example.com');

    Switch reopenedSwitch = tester.widget<Switch>(find.byType(Switch));
    expect(reopenedSwitch.value, isFalse);
    

  });

  testWidgets('SettingsView pre-fills saved settings when opened', (WidgetTester tester) async{
    SharedPreferencesAsyncPlatform.instance = InMemorySharedPreferencesAsync.withData(<String, Object>{
      prefName: 'John Smith',
      prefAddress: '20 Example Drive',
      prefEmail: 'example@example.com',
      prefNewsLetter: true,
    });

    await tester.pumpWidget(MaterialApp(home: SettingsView()));
    await tester.pumpAndSettle();

    expect(find.text('John Smith'), findsOneWidget);
    expect(find.text('20 Example Drive'), findsOneWidget);
    expect(find.text('example@example.com'), findsOneWidget);
    Switch switchWidget = tester.widget<Switch>(find.byType(Switch));
    expect(switchWidget.value, true);
  });
}
