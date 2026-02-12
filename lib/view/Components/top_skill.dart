import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive/responsive.dart';
import 'package:portfolio_website/utils/colors.dart';

class TopSkills extends StatelessWidget {
  const TopSkills({super.key});

  @override
  Widget build(BuildContext context) {
    // 6 Skills with 100% working URLs
    final List<Map<String, String>> skills = [
      {"title": "Node JS", "url": "images/nodejs.png"},
      {"title": "Flutter", "url": "images/flutter.png"},
      {"title": "Firebase", "url": "images/firebase.png"},
      {"title": "GitHub", "url": "images/github (1).png"},
      {"title": "PostgreSQL", "url": "images/postgreesql.png"},
      {"title": "JavaScript", "url": "images/javascript.png"},
    ];

    return Column(
      children: [
        const Text(
          "My Top Skills",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: skills.map((skill) => SkillCard(
              title: skill['title']!,
              url: skill['url']!,
            )).toList(),
          ),
        ),
      ],
    );
  }
}

class SkillCard extends StatelessWidget {
  final String url;
  final String title;

  const SkillCard({super.key, required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.isMobile(context) ? 100 : 130,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: shadocolor,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Network image with better error handling
          Image.asset(
            url,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
            // Isse loading ke waqt khali nahi dikhega
            // loadingBuilder: (context, child, progress) {
            //   if (progress == null) return child;
            //   return const CircularProgressIndicator(strokeWidth: 2);
            // },
            // errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 40),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}