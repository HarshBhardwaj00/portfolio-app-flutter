import 'package:flutter/material.dart';
import 'package:portfolio_website/responsive/responsive.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/view/Components/certificates.dart'; // Ensure this matches your filename

import 'package:portfolio_website/view/Components/drawer.dart';
import 'package:portfolio_website/view/Components/footer.dart';
import 'package:portfolio_website/view/Components/prfile_and_intro.dart';
import 'package:portfolio_website/view/Components/recent_project.dart';
import 'package:portfolio_website/view/Components/social_icons.dart';
import 'package:portfolio_website/view/Components/top_skill.dart';
import 'package:portfolio_website/view/Components/topbar.dart';
import 'package:portfolio_website/view/Components/about_me.dart';

class DeveloperPortfolio extends StatelessWidget {
  DeveloperPortfolio({super.key});
  
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // --- GLOBAL KEYS FOR SECTIONS ---
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey certKey = GlobalKey(); // 1. Added CertKey here
  final GlobalKey contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // 2. Created a list of keys to keep the code clean
    final List<GlobalKey> sectionKeys = [
      aboutKey, 
      skillKey, 
      projectKey, 
      certKey, 
      contactKey,
    ];

    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Harsh Bhardwaj',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: textcolor,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Responsive.isMobile(context)
              ? Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: IconButton(
                    onPressed: () => _globalKey.currentState!.openEndDrawer(),
                    icon: Icon(Icons.menu, color: textcolor, size: 35),
                  ),
                )
              : TopBar(
                  scrollController: _scrollController,
                  keys: sectionKeys, // 3. Updated list passed here
                ),
        ],
        elevation: 3,
        toolbarHeight: 70,
      ),
      endDrawer: Responsive.isMobile(context)
          ? MyDrawer(
              scrollController: _scrollController,
              keys: sectionKeys, // 4. Updated list passed here
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  PrfileAndIntro(), 
                  SizedBox(height: Responsive.isMobile(context) ? 40 : 0),
                  AboutMe(key: aboutKey),
                  const SizedBox(height: 55),
                  TopSkills(key: skillKey),
                  const SizedBox(height: 55),
                  RecentProject(key: projectKey),
                  const SizedBox(height: 55),
                  
                  // 5. Assigned the certKey to your section
                  CertificationSection(key: certKey), 
                  
                  
                  const SizedBox(height: 30),
                  Footer(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            const SocialIcons(),
          ],
        ),
      ),
    );
  }
}