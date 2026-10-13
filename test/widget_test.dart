import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';


void main() {
  group('App Smoke Tests', () {
    testWidgets('Display menu screen as home screen', (WidgetTester tester) async {
      await tester.pumpWidget(SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);

    });

    testWidgets('Display movie titles and booking buttons', (WidgetTester tester) async {
      await tester.pumpWidget(SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text('Backrooms'), findsOneWidget);
      expect(find.text('Mission Impossible: Rogue Nation'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

  });
}
