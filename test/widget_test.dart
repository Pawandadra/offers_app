import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:offers_app/main.dart';

class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });

  testWidgets('App loads and shows main screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); // Replace with your app's main widget

    // Verify the login text is displayed
    expect(find.text('LOGIN NOW'), findsOneWidget); // Replace 'Login' with actual text from your app
  });
}
