import 'package:flutter/material.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/extensions/context_extension.dart';

class HistoryModel extends ChangeNotifier {
  List<String> list;

  HistoryModel({required this.list});

  void getHistory(BuildContext context) {
    list = context.dependency.shp.getStringList(Constants.history) ?? [];
  }
}
