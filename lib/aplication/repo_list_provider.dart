import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repoListProvider = StateProvider(
  (ref) {
    return <Repository>[];
  }
);