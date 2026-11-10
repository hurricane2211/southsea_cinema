import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  testWidgets('SettingsView displays correct fields and switch',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsView()));

    expect(find.text('Customer Profile'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(3));
    expect(find.byType(Switch), findsOneWidget);
    expect(find.text('Save Settings'), findsOneWidget);
  });

  testWidgets('Toggling switch and save settings button updates state',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SettingsView()));

    Finder nameField = find.widgetWithText(TextField, 'Full name');
    Finder addressField = find.widgetWithText(TextField, 'Delivery Address');
    Finder emailField = find.widgetWithText(TextField, 'Email Address');

    await tester.enterText(nameField, 'John Smith');
    await tester.enterText(addressField, '3 example road, Example');
    await tester.enterText(emailField, 'example@example.com');

    Finder switchFinder = find.byType(Switch);
    expect(tester.widget<Switch>(switchFinder).value, isFalse);

    await tester.tap(find.text('Save Settings'));
    await tester.pump();

    expect(find.text('Settings saved for John Smith'), findsOneWidget);
  });
}
