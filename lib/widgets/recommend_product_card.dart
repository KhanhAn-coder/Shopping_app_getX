import 'package:flutter/material.dart';
import 'package:shopping_app_getx/models/welcome.dart';

class RecommendProductCard extends StatelessWidget {
  final Product product;
  const RecommendProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Material(
        elevation: 5.0,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Container(
          width: 400,
          height: 80,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.black.withOpacity(0.1)
            )
          ),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                    fit: BoxFit.cover
                  ),
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
              ),
              const SizedBox(width: 20,),
              SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text('\$ ${product.price.toString()}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
