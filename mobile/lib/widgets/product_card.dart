import 'package:flutter/material.dart';
import 'package:mobile/utils/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    child: Image.asset("assets/images/apples.png", height: 91, width: 72),
                  )
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Text("8.00", style: TextStyle(
                      color: DColors.primaryGreen,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w900
                    )),
                    Text("Fresh Peach", style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w900
                    )),
                    Text("2.0 lbs", style: TextStyle(
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
    );
  }

}