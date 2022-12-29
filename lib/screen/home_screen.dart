import 'package:flutter/material.dart';

import '../config/json_operation.dart';
import '../model/code_item_model.dart';
import '../widget/animation_widget.dart';
import '../widget/component_widget.dart';
import '../widget/panel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CodeItemModel> listCodeItem = [];

  @override
  void initState() {
    readJson().then((list) {
      setState(() => listCodeItem.addAll(list));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    if (listCodeItem.isNotEmpty) {
      return Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: SafeArea(
          child: Column(
            children: [
              const topPanel(),
              animationListViewCategory(height),
              animationListViewCode(listCodeItem, height),
            ],
          ),
        ),
      );
    }
    return loadingHScreen();
  }
}
