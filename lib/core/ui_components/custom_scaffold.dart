import 'package:flutter/material.dart';

/// @author: Sagar KC
/// @email: sagar.kc@fonepay.com
/// @created_at:  12/6/2022, Tuesday

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({Key? key, required this.body, this.appBarTitle})
      : super(key: key);
  final Widget body;

  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle ?? ''),
      ),
      body: body,
    );
  }
}
