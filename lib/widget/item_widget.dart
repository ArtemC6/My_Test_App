import 'package:flutter/material.dart';
import 'package:my_test_app/model/code_item_model.dart';
import 'package:my_test_app/widget/animation_widget.dart';

class itemCode extends StatelessWidget {
  CodeItemModel codeItemModel;
  int indexAnimation;

  itemCode(
      {Key? key, required this.codeItemModel, required this.indexAnimation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        height: height / 10,
        decoration: BoxDecoration(
          color: Color(
            int.parse(codeItemModel.colorBackground),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(height / 78),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  color: Color(int.parse(codeItemModel.iconColor)),
                ),
                child: const Icon(Icons.qr_code)),
            Padding(
              padding: EdgeInsets.only(left: height / 30),
              child: animatedText(height / 44, codeItemModel.text, Colors.black,
                  indexAnimation * 720, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class itemCategory extends StatelessWidget {
  List<String> listCategory;
  int indexAnimation, index;

  itemCategory(
      {Key? key,
      required this.listCategory,
      required this.indexAnimation,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: index == 0 ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: animatedText(height / 52, listCategory[index],
            index == 0 ? Colors.white : Colors.black, indexAnimation * 700, 1),
      ),
    );
  }
}
