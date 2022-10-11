import 'dart:async';

class Bloc {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  // Set Data
  Function(String) get emailChange => _emailController.sink.add;
  Function(String) get passwordChange => _passwordController.sink.add;

  // Get Data
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 6) {
        sink.add(password);
      } else {
        sink.addError('Invalid password length');
      }
    },
  );

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
