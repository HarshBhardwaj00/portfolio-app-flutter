import 'package:flutter/material.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/responsive/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentProject extends StatelessWidget {
  const RecentProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Some of My Recent Projects",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Wrap(
          children: [
            ProjectCard(
              projectModel: myProjects[0],
              url: "https://github.com/HarshBhardwaj00/Nimbus.git",
            ),
            ProjectCard(
              projectModel: myProjects[1],
              url: "https://github.com/HarshBhardwaj00/CoinConvo.git",
            ),
            ProjectCard(
              projectModel: myProjects[2],
              url: "https://github.com/HarshBhardwaj00/Book-Shopping-App.git",
            ),
          ],
        ),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final ProjectModel projectModel;
  final String url;
  const ProjectCard({super.key, required this.projectModel, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(15),
      child: Wrap(
        children: [DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 4, spreadRadius: 3),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: SizedBox(
            width: Responsive.isMobile(context)
                ? Responsive.widthOfScreen(context) * 0.9
                : Responsive.widthOfScreen(context) / 4,
               
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Image.asset(projectModel.imgURL,
                    height: 150, // Sabhi images ki height same rakhein
                width: 150,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 150,
                    child: Icon(Icons.money_off, size: 50), 
                  );
                },
                    ),
                  ),
                  Text(
                    projectModel.projectName,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                    child: Wrap(
                      children: [
                      Center(
                        child: Text(
                          projectModel.description,
                          style: TextStyle(
                            fontSize: 16,
                          
                           
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(top: 15, bottom: 6),
                    child: TextButton(
                      onPressed: () async {
                        final Uri uri = Uri.parse(url);
                        if (!await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
                        )) {
              throw 'Could not launch $url';
                        }
                      },
                      
                      child: Text("Check In Out on GitHub", style: TextStyle(fontSize: 17)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ]
      ),
    );
  }
}
