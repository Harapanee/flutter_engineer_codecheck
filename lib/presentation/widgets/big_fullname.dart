import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/themes/fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BigFullName extends ConsumerWidget {
  const BigFullName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(selectedRepoProvider) as Repository;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        repo.fullName,
        style: BrandText.sizeM,
      ),
    );
  }
}
