import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: unused_import
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Login successful test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the login page is displayed.
    expect(find.text('Login'), findsOneWidget);

    // Enter valid login credentials.
    await tester.enterText(
        find.byKey(const ValueKey('usernameField')), 'admin');
    await tester.enterText(
        find.byKey(const ValueKey('passwordField')), 'password');

    // Tap the login button and trigger a frame.
    await tester.tap(find.byKey(const ValueKey('loginButton')));
    await tester.pump();

    // Verify that the dashboard page is displayed.
    expect(find.text('Travel Dashboard'), findsOneWidget);
  });

  // Add more tests as needed for different scenarios.
}
