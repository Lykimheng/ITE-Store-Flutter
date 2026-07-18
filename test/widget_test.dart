// Smoke test for the ITE Store app.
//
// Network requests are blocked in widget tests (they return HTTP 400),
// so after loading the app is expected to end up in its error state.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finalexam/app/app.dart';

void main() {
  testWidgets('shows title, search bar, and loading indicator on launch',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ITEStoreApp());

    expect(find.text('ITE Store'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
  });

  testWidgets('shows error state with Retry when products fail to load',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ITEStoreApp());
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.error_outline), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Retry'), findsOneWidget);
  });
}
