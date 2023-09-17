import 'package:auth_feature/feature/presentation/pages/entering_phone_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Entering phone page UI', (() {
    testWidgets(
        'The home page is open'
        'There should be a textfield for entering phone'
        'And there should be a button to continue',
        (WidgetTester tester) async {
      await tester.pumpWidget(const EnteringPhonePage());
      await tester.pump();

      expect(find.byKey(EnteringPhonePage.phoneInputKey), findsOneWidget);
      expect(find.byKey(EnteringPhonePage.letsStartButtonKey), findsOneWidget);
    });
  }));
}
