import 'package:flutter/cupertino.dart';

typedef OnGenerateRoute = Route<dynamic>? Function(RouteSettings);

class DestinationPage extends StatelessWidget {
  final OnGenerateRoute onGenerateRoute;

  const DestinationPage({
    super.key,
    required this.onGenerateRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: onGenerateRoute,
      observers: const [],
    );
  }
}
