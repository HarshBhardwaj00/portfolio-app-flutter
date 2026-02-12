import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/view/Components/topbar.dart';

class MyDrawer extends StatelessWidget {
  final ScrollController scrollController;
  final List<GlobalKey> keys; 

  const MyDrawer({
    super.key, 
    required this.scrollController, 
    required this.keys, 
  });

  @override
  Widget build(BuildContext context) {
    return Drawer( // Changed from Scaffold to Drawer for better overlay behavior
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Close Button Header
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: textcolor, size: 30),
              ),
            ),
          ),
          
          Expanded(
            child: Center(
              // The TopBar will now handle the CertKey inside its internal list
              child: TopBar(
                scrollController: scrollController, 
                keys: keys,
              ),
            ),
          ),
        ],
      ),
    );
  }
}