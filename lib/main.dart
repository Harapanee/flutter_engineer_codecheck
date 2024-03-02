import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/router/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  const scope = ProviderScope(child: MyApp());
  runApp(scope);
}
