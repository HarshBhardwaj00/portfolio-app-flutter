import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive/responsive.dart';

class PrfileAndIntro extends StatelessWidget {
  const PrfileAndIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        // Ek hi Wrap use karenge taaki items flow kar sakein
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            // --- IMAGE SECTION ---
            SizedBox(
              width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context)
                  : Responsive.widthOfScreen(context) / 2,
              height: Responsive.isMobile(context)
                  ? Responsive.heightOfScreen(context) / 3
                  : Responsive.heightOfScreen(context) - 100,
              child: Image.asset("images/home_page.jpg", fit: BoxFit.contain),
            ),

            // --- TEXT BOX SECTION ---
            SizedBox(
              width: Responsive.isMobile(context)
                  ? Responsive.widthOfScreen(context)
                  : Responsive.widthOfScreen(context) / 2,
              // Fixed height hata kar constraints use karenge taaki overflow na ho
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(maxWidth: 450), 
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 8,
                        spreadRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Jitna content utni height
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello!",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.red,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Text(
                          "I'm Harsh Bhardwaj, \na Full stack Flutter Developer.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}