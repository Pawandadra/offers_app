import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:offers_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// Mock FirebaseAuth
class MockFirebaseAuth extends Mock implements FirebaseAuth {}

// Mock FirebaseCore
class MockFirebaseCore extends Mock {
  static Future<FirebaseApp> initializeApp() async {
    return MockFirebaseApp();
  }
}

class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() {
  setUpAll(() async {
    // Mock platform channels
    TestWidgetsFlutterBinding.ensureInitialized();

    MethodChannel('plugins.flutter.io/firebase_core')
        .setMockMethodCallHandler((methodCall) async {
      if (methodCall.method == 'Firebase#initializeCore') {
        return {
          'name': '[DEFAULT]',
          'options': {
            'apiKey': 'fakeApiKey',
            'projectId': 'fakeProjectId',
            'messagingSenderId': 'fakeMessagingSenderId',
            'appId': 'fakeAppId',
          },
        };
      }
      return null;
    });

    await Firebase.initializeApp();
  });

  testWidgets('App loads and shows main screen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify the app shows the "Login" screen
    expect(find.text('LOGIN NOW'), findsOneWidget); // Update 'Login' to match your app's actual UI
  });
}
