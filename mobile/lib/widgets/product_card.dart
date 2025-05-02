import 'package:flutter/material.dart';
import 'package:mobile/data/product.dart';
import 'package:mobile/screens/product_details.dart';
import 'package:mobile/utils/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails()));
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0), child: Column(
              children: [
                Stack(
                  children: [
                    Container(height: 84.0, width: 84.0, decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color(0xFFFFCEC1)
                    )),
                    Positioned(
                      top: 7.0,
                      left: 0,
                      right: 0,
                      child: Image.network(product.images[0], height: 91, width: 72),
                    )
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Text('${product.price}', style: TextStyle(
                          color: DColors.primaryGreen,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w900
                      )),
                      Text(product.name, style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w900
                      )),
                      Text('${product.lbs} lbs', style: TextStyle(
                          color: DColors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w900
                      ))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

}