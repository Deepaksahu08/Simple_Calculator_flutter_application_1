
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Hello World Test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());  
  });
}
