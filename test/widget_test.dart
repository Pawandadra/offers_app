import 'package:flutter_test/flutter_test.dart';
import 'package:offers_app/main.dart'; // Adjust the import as per your app's main file

void main() {
  testWidgets('App loads and shows main screen', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp()); // Replace 'MyApp' with the actual app widget name

    // Verify that the main screen loads.
    expect(find.text('Login'), findsOneWidget); // Replace 'Login' with any widget text in your app
  });
}