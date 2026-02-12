import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/responsive/responsive.dart';

class TopBar extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> keys;

  const TopBar({super.key, required this.scrollController, required this.keys});

  void scrollToSection(GlobalKey key, BuildContext context) {
    if (Responsive.isMobile(context)) {
      Navigator.pop(context);
    }

    final sectionContext = key.currentContext;
    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    
    return isMobile 
      ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildNavItems(context),
        )
      : Row(
          children: _buildNavItems(context),
        );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return [
      _navItem("About", () => scrollToSection(keys[0], context), isMobile),
      _navItem("Skill", () => scrollToSection(keys[1], context), isMobile),
      _navItem("Project", () => scrollToSection(keys[2], context), isMobile),
      
      // 1. ADD THIS NEW ITEM
      _navItem("Certificates", () => scrollToSection(keys[3], context), isMobile),
      
      
    ];
  }

  Widget _navItem(String title, VoidCallback onTap, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 20 : 0),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20, 
            color: textcolor, 
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}