import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extensions/context_extension.dart';

class HistoryModel extends ChangeNotifier {
  List<String> list;

  HistoryModel({required this.list});

  void getHistory(BuildContext context) {
    list = context.dependency.shp.getStringList(Constants.history) ?? [];
    list = list.reversed.toList();
  }

  void delete(index, BuildContext context) async {
    list.removeAt(index);
    await context.dependency.shp
        .setStringList(Constants.history, list.reversed.toList());
    notifyListeners();
  }

  void deleteAll(BuildContext context) async {
    list.clear();
    await context.dependency.shp.setStringList(Constants.history, list);
    notifyListeners();
  }
}
