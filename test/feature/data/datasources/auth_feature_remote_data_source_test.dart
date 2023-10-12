import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:matcher/matcher.dart';
import 'package:auth_feature/core/error/exceptions.dart';
import 'package:auth_feature/feature/data/datasources/auth_feature_remote_data_source.dart';
import 'package:auth_feature/feature/data/models/auth_feature_model.dart';
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
    dataSource =
        AuthFeatureRemoteDataSourceImpl(instance: FirebaseAuth.instance);
  });
}
