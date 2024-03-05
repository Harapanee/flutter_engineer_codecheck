import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/big_avatar_image.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/big_fullname.dart';
import 'package:flutter_engineer_codecheck/presentation/widgets/repo_detail_elements.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*

  レポジトリの詳細画面

*/

class DetailViewPage extends ConsumerWidget {
  const DetailViewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;

    final appBar = AppBar(
      title: Text(AppLocalizations.of(context)!.detailViewTitle),
    );
    return Scaffold(
      appBar: appBar,

      body: Builder(
        builder: (context) {
          //画面が縦か横かで表示を変える
          if(orientation == Orientation.portrait) {
            //縦の場合
            return const VerticalDetails();
          } else {
            //横の場合
            return const HorizontalDetails();
          }
        }
      )
    );
  }
}

/*
  画面が縦の時のディテール
*/

class VerticalDetails extends StatelessWidget {
  const VerticalDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
  }
}

/*
  画面が横の時のディテール表示
*/

class HorizontalDetails extends StatelessWidget {
  const HorizontalDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
                Center(child: BigFullName(),),
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