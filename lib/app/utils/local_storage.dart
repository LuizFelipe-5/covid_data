import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<void> initHive() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  Future<Box<dynamic>> openBox(String boxName) {
    return Hive.openBox(boxName);
  }
}
