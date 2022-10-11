import 'dart:async';

import 'validator.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Set Data
  Function(String) get emailChange => _emailController.sink.add;
  Function(String) get passwordChange => _passwordController.sink.add;

  // Get Data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
