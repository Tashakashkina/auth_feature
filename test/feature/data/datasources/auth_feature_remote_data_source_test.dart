import 'dart:convert';
import 'package:matcher/matcher.dart';
import 'package:auth_feature/core/error/exceptions.dart';
import 'package:auth_feature/feature/data/datasources/auth_feature_remote_data_source.dart';
import 'package:auth_feature/feature/data/models.dart/auth_feature_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthFeatureRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = AuthFeatureRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get('token' as Uri, headers: anyNamed('headers')))
        .thenAnswer(
            (_) async => http.Response(fixture('token_cached.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get('token' as Uri, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getAuthToken', () {
    final tAuthFeatureModel =
        AuthFeatureModel.fromJson(json.decode(fixture('token_cached.json')));

    test(
      'should perform a GET request on a URL with application/json header',
      () async {
        setUpMockHttpClientSuccess200();

        dataSource.getAuthToken();

        verify(mockHttpClient.get(
          Uri.parse('http://'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return AuthToken when the response code is 200 (success)',
      () async {
        setUpMockHttpClientSuccess200();

        final result = await dataSource.getAuthToken();

        expect(result, equals(tAuthFeatureModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        setUpMockHttpClientFailure404();

        final call = dataSource.getAuthToken;

        expect(() => call, throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });

  test(
    'should throw a ServerException when the response code is 404 or other',
    () async {
      setUpMockHttpClientFailure404();

      final call = dataSource.getAuthToken();

      expect(() => call, throwsA(const TypeMatcher<ServerException>()));
    },
  );
}
