import 'package:auth_feature/feature/data/datasources/auth_feature_local_data_source.dart';
import 'package:auth_feature/feature/data/models.dart/auth_feature_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late AuthFeatureLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthFeatureLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('cacheToken', () {
    const tAuthFeatureModel = AuthFeatureModel(token: 1);

    test(
      'should call SharedPreferences to cache the data',
      () async {
        when(mockSharedPreferences.getString('token'))
            .thenReturn(fixture('token_cached.json'));
        final result = await dataSource.restoreToken();
        // assert
        verify(mockSharedPreferences.getString('token'));
        expect(result, equals(tAuthFeatureModel));
      },
    );
  });
}
