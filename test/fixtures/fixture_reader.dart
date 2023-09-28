import 'dart:io';

String fixture(String name) =>
    File('test/fixtures/token_cached.json').readAsStringSync();
