import 'package:flutter/services.dart';

class AssetLoader {
  const AssetLoader();

  Future<String> load(String value) async => await rootBundle.loadString(value);
}
