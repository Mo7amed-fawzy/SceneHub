import 'dart:io';

String fixture(String filename) =>
    File('test/fixtures/$filename').readAsStringSync();

String fixtureTrimmed(String filename) =>
    fixture(filename).replaceAll(RegExp(r'\s'), '');
