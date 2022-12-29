import 'package:flutter/material.dart';

import 'animation_widget.dart';

class topPanel extends StatelessWidget {
  const topPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          animatedText(height / 28, 'Мои коды', Colors.black, 600, 1),
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.topRight,
            children: [
              Icon(
                Icons.notifications,
                size: height / 20,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
