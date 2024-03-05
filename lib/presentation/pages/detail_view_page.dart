import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/aplication/selected_repo_provider.dart';
import 'package:flutter_engineer_codecheck/domain/repo_data_model.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/big_avatar_image.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/big_fullname.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/repo_detail_elements.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewPage extends ConsumerWidget {
  const DetailViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final repo = ref.watch(selectedRepoProvider) as Repository;
    final appBar = AppBar(
      title: Text(repo.fullName),
    );
    return Scaffold(
      appBar: appBar,
      body: Builder(
        builder: (context) {
          if(orientation == Orientation.portrait) {
            return const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    BigAvatarImage(),
                    BigFullName(),
                    RepoDetailElements(),
                  ],
                ),
              )
            );
          } else {
            return const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    BigAvatarImage(),
                    SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigFullName(),
                        RepoDetailElements(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            );
          }
        }
      )
    );
  }
}
