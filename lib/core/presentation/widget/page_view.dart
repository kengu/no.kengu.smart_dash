import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.title,
    required this.route,
  });

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$title view'),
          const SizedBox(height: 56),
          ElevatedButton(
            onPressed: () {
              context.go(route);
            },
            child: Text("Goto $route"),
          ),
        ],
      ),
    );
  }
}
