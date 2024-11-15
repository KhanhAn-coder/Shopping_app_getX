import 'package:flutter/material.dart';
import 'package:shopping_app_getx/models/welcome.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(product.thumbnail),
                fit: BoxFit.cover
              ),
              color: Colors.grey.withOpacity(0.3)
            ),
          ),
          const SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: Text(product.title,
                  style: const TextStyle(
                      fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Text('\$ ${product.price.toString()}',
                style: const TextStyle(
                    fontSize: 20,
                  fontWeight: FontWeight.w700
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
