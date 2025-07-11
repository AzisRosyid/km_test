import 'package:flutter/material.dart';
import 'package:km_test/app.dart';
import 'package:km_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const SuitmediaApp(),
    ),
  );
}