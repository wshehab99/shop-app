import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';

class PageVeiwItemBuilder extends StatelessWidget {
  PageVeiwItemBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);
  BoardingModel? model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model!.image!),
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          model!.title!,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          model!.body!,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
