import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("© 2026 Harsh Bhardwaj. All rights reserved."),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Built with ❤️ by Harsh"),
            //TextButton(
            //   onPressed: () {
            //     launchUrl(
            //       Uri.parse(
            //         "https://www.linkedin.com/in/harsh-bhardwaj-a03434327?utm_source=share_via&utm_content=profile&utm_medium=member_android",
            //       ),
            //     );
            //   },
            //   child: Text("Harsh"),
            // ),
          ],
        ),
      ],
    );
  }
}
