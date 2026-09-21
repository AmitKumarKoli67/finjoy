// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:finjoy/main.dart';

void main() {
  testWidgets('FinjoyApp smoke test', (WidgetTester tester) async {
    FlutterSecureStorage.setMockInitialValues({});

    // Build our app and trigger a frame.
    await tester.pumpWidget(const FinjoyApp());

    // Verify that Finjoy splash screen loads initially
    expect(find.text('Finjoy'), findsOneWidget);
    expect(find.text('Track. Save. Enjoy.'), findsOneWidget);

    // Let the splash screen timer finish and settle
    await tester.pumpAndSettle(const Duration(seconds: 4));
  });
}
