import 'package:auth_feature/feature/presentation/utils/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test('should return an integer when the string represents an unsigned int',
        () async {
      const str = '148';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, const Right(148));
    });

    test('should return a Failure when string is not integer', () async {
      const str = 'adsa';
      final result = inputConverter.stringToUnsignedInteger(str);
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
