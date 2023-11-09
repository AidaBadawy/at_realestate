import 'package:flutter_test/flutter_test.dart';
import 'package:aisu_realestate/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PaymentViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
