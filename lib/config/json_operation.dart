import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/code_item_model.dart';

Future<List<CodeItemModel>> readJson() async {
  List<CodeItemModel> listCodeItem = [];
  final String response = await rootBundle.loadString('assets/item.json');
  Map<String, dynamic> data = await json.decode(response);
  data['items'].forEach(
    (articleMap) => listCodeItem.add(CodeItemModel.fromJson(articleMap)),
  );

  return listCodeItem;
}
