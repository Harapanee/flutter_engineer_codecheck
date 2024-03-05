import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_engineer_codecheck/presentation/router/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {

  //ウェブで動いているかどうか
  if (kIsWeb) {
    //デバイスプレビューを使う
    const scope = ProviderScope(child: MyApp());
    final devicePreview = DevicePreview(builder: (_) => scope);
    runApp(devicePreview);
  } else {
    //そのまま動かす
    const scope = ProviderScope(child: MyApp());
    runApp(scope);
  }
}
