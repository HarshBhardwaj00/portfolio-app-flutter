import "package:flutter/material.dart";
import "package:portfolio_website/responsive/responsive.dart";

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(

      horizontal: Responsive.isMobile(context) ? 40 : 80,

    ),
    child: Column(children: [Center(
      
      child: Text("About Me",style: TextStyle(
            fontSize: 25,fontWeight: FontWeight.bold


      )),
      
    
    
    ),
    Text("I am Harsh Bhardwaj, a passionate Full Stack Flutter Developer dedicated to building high-performance, visually stunning, and user-friendly mobile and web applications. With a strong foundation in both frontend design and backend integration, I love turning complex problems into clean, scalable code. I’m always eager to learn new technologies and push the boundaries of what's possible with Dart and Flutter.",style: TextStyle(fontSize: Responsive.isMobile(context) ? 18 : 20),
    textAlign: TextAlign.justify,
    ),
    
    ])
    
    );
  }
}