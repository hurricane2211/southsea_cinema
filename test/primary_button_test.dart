import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';


void main() {

  testWidgets('Primary Button displays label correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Order',
            onPressed: () {}
          )
        ))
    ); 

    expect(find.text('Order'), findsOneWidget);
  });

  testWidgets('Primary Button responds to press', (WidgetTester tester) async {
    bool wasPressed = false;


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'Order', 
            onPressed: () {
              wasPressed = true;
            })
        )
      )
    );

    await tester.tap(find.text('Order'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });



 
}