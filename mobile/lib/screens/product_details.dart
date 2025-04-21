import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/utils/colors.dart';
import 'package:mobile/widgets/actions_navigation.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          bottomNavigationBar: ActionsNavigation(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 400,
                  width: double.infinity,
                  child: Image.asset("assets/images/lemon.png"),
                ),
                Padding(padding: EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16.0,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("8.00", style: TextStyle(
                                    color: DColors.primaryGreen,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900
                                )),
                                Text("Organic Lemons", style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                )),
                                Text("1.50 lbs", style: TextStyle(
                                    color: DColors.grey,
                                    fontWeight: FontWeight.w500
                                ))
                              ],
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border_rounded))
                          ],
                        ),

                        Text("Organic Mountain works as a seller for many organic growers of organic lemons. Organic lemons are easy to spot in your produce aisle. They are just like regular lemons, but they will usually have a few more scars on the outside of the lemon skin. Organic lemons are considered to be the world's finest lemon for juicing", style: TextStyle(
                          color: Color(0xFF868889)
                        ))
                      ],
                    )),
              ],
            ),
          ),
        )
    );
  }
}
