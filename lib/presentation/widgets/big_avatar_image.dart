import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
  詳細画面に表示するアバター画像
*/

class BigAvatarImage extends ConsumerWidget {
  const BigAvatarImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;

    return Container(
      width: Sizes.avatarImgeView.width,
      height: Sizes.avatarImgeView.height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: NetworkImage(repo.avatarUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
