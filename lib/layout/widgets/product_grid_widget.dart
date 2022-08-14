import 'package:flutter/material.dart';
import 'package:shop_app/models/home_model.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({Key? key, required this.model}) : super(key: key);
  final Product model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(
              image: NetworkImage(model.image!),
              height: 200,
            ),
            model.discount != 0
                ? Container(
                    color: Colors.red,
                    width: 90,
                    child: const Text(
                      "DICOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                model.name!,
                style: const TextStyle(
                    fontSize: 14,
                    wordSpacing: 4,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Text(
                    '${model.price!}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  model.discount != 0
                      ? Text(
                          '${model.oldPrice!}',
                          style: const TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 2,
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  IconButton(
                    tooltip: 'Add to favoorites',
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    color: Colors.red.shade100,
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
