import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  検索されたレポジトリ一覧から選択されたレポジトリの状態管理
*/

final selectedRepoProvider = StateProvider<Repository?>(
  (ref) {
    return null;
  }
);
