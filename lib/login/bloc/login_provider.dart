import 'login_bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc();

  Provider({Key? key, required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(oldWidget) => true;

  static Bloc of(BuildContext context) =>
      ((context.getElementForInheritedWidgetOfExactType() ??
              Provider(child: const SizedBox())) as Provider)
          .bloc;
}
