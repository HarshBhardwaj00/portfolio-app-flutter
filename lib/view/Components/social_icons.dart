import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 5,
      top: Responsive.isMobile(context)?Responsive.heightOfScreen(context)*0.1 : Responsive.heightOfScreen(context)*0.2,
      child: SizedBox(
        width: 45, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SocialIconDesign(
              iconUrl: "images/github.png", 
              socialLink: "https://github.com/HarshBhardwaj00",
            ),
            const SizedBox(height: 12),
            SocialIconDesign(
              iconUrl: "images/linkedin.png", 
              socialLink: "https://www.linkedin.com/in/harsh-bhardwaj-a03434327/",
            ),
          ],
        ),
      ),
    );
  }
}
class SocialIconDesign extends StatelessWidget {
  final String iconUrl;
  final String socialLink;
  const SocialIconDesign({
    super.key,
    required this.iconUrl,
    required this.socialLink,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Colors.transparent,
      onPressed: () {
        launchUrl(Uri.parse(socialLink
        )
        );
      },
        
      child: Image.asset(iconUrl, fit: BoxFit.cover),
    );
  }
}
