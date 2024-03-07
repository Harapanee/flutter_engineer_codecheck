# 株式会社ゆめみFlutterエンジニアコードチェック課題

## 概要

名前 : flutter_engineer_codecheck

説明 : キーワードからGitHubレポジトリを検索，一覧表示し，一覧から選択されたレポジトリを詳細表示する

|アプリアイコン|
|---|
|<img width="200" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/16de4a04-d3c2-47ab-9af4-eff881869074">|

## スクリーンショット
|結果一覧(Light)|結果一覧(Dark)|
|---|---|
|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/12456c9b-387e-4554-999a-44c11db24ecb">|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/e335e66d-579f-4820-a39a-91c7202e9ed4">|

|詳細表示(Light)|詳細表示(Dark)|
|---|---|
|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/044d3b32-0800-4c0f-bbc8-714472181be2">|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/1acb9cb2-2f0c-498d-b110-ce7386370f12">|

|結果一覧(英語)|詳細表示(英語)|
|---|---|
|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/8885cc58-92ad-4c81-8178-a1c7adc8464c">|<img width="390" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/9fb5aa2c-a37a-4417-98dd-2ae5c42884d1">|

|詳細表示(横画面)|
|---|
|<img width="780" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/552dcee2-6947-4197-bf18-044a04921dff">|

## 動作
- サーチバーにキーワードを入力する
- レポジトリが100件まで検索され，結果が一覧表示される
- 一覧から一つを選びタップするとそのレポジトリの詳細が表示される

## UI/UX
- シンプルなUI
- 横画面に対応
- ダークモードに対応
- 日本語，英語に対応
- アプリアイコン，スプラッシュスクリーンを作成

## 環境
- Flutter バージョン: 3.19.2
- OS: macOS 14.1
- 開発環境: VS Code (version 1.69.0)

## 使用技術，パッケージ
- device_preview - 各サイズでのUI確認
- dlutter_riverpod - 状態管理
- http - api実装
- convert - json変換のため
- go_router - 画面遷移
- intl - 言語の成形
- glutter_localizations - 多言語対応

**dev**

- flutter_native_splash - スプラッシュスクリーン作成
- flutter_test - テストの作成
- flutter_lints - 性的解析
- flutter_launcher_icons - アプリアイコンの作成
  
## アーキテクチャ
RubydogさんのYoutubeで紹介されていた[オニオンアーキテクチャ](https://www.youtube.com/watch?v=UMpInO2giz4&list=PLY1cxwSQf6nzcA62KQSgkL1TwAeM1Raaj&index=7)を参考にした

<img width="300" src="https://github.com/Harapanee/flutter_engineer_codecheck/assets/153523048/42096298-bcb9-4165-934e-f0876fa3d322">

### フォルダ構成
```
├── lib
│   ├── aplication
│   │   ├── repo_list_provider.dart
│   │   └── selected_repo_provider.dart
│   ├── domain
│   │   └── repo_data_model.dart
│   ├── infrastructure
│   │   └── api_client.dart
│   ├── main.dart
│   └── presentation
│       ├── pages
│       │   ├── detail_view_page.dart
│       │   └── repo_search_page.dart
│       ├── router
│       │   ├── app.dart
│       │   └── go_router.dart
│       ├── themes
│       │   ├── colors.dart
│       │   ├── fonts.dart
│       │   ├── l10n
│       │   │   ├── app_en.arb
│       │   │   └── app_ja.arb
│       │   └── sizes.dart
│       └── widgets
│           ├── big_avatar_image.dart
│           ├── big_fullname.dart
│           ├── repo_detail_elements.dart
│           ├── search_field.dart
│           └── search_result_list.dart
```
## ビルド手順

- clone
```
git clone https://github.com/Harapanee/flutter_engineer_codecheck
```

- ファイルに入る
```
cd flutter_engineer_codecheck
```

- pub get
```
flutter pub get
```

- run
```
flutter run
```

## Note

-  基本的にイシューベース開発を行い，安全にわかりやすい運用を心がけた

1. タスク(次に開発すべきこと)を考えそのタスクのIssueを作成
2. ローカルでIssue用のブランチを切り，ブランチ内でタスクを進める
3. タスクが終了したらブランチをGit push
4. GitHub上でプルリクエストをし，mergeしissue用のブランチを削除
5. ローカルで親ブランチをGit fetchしてmergeし，issue用ブランチを削除

- わかりやすく開発，編集しやすいフォルダ構成を選んだ
- 崩れにくいUIを意識した（まだまだ改善の余地はありそう）
- アプリアイコン，スプラッシュスクリーンを作成した（画像生成AI(AdobeFirefly)で作成）

## 感想，改善点

- テストの勉強が甘く，一つしか作成できていない（通信エラー発生時などのテストを作成したい）
- エラーハンドリングが甘い（通信エラー発生時などで特定の画面を表示したい）
- 検索結果が100件しか表示できない（通信速度などの観点から，理想は30件ほど表示してListの一番下で上に引っ張ると次の30件をロードするような実装）
- レイアウトの表示方法が甘い（タブレットで横画面表示するとレイアウトが美しくない）

## 追加実装してみたいこと
- 検索結果のソート
- レポジトリのお気に入り登録
