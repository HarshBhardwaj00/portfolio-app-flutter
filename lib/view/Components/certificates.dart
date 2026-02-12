import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import this
import 'package:portfolio_website/models/certificates_model.dart';

class CertificationSection extends StatelessWidget {
   CertificationSection({super.key}); 

  final List<Certificate> certificates = [
    Certificate(
      title: "Aws Certified Cloud Practitioner",
      organization: "Amazon",
      date: "Dec 2025",
      imageUrl: "images/badge_aws_new.png",
      credentialUrl: "https://cp.certmetrics.com/amazon/en/public/verify/credential/ee1ee170650f4a009da7bb826a0ba1bd", 
    ),
    Certificate(
      title: "Aws Certified AI Practitioner",
      organization: "Amazon",
      date: "Dec 2025",
      imageUrl: "images/aws-certified-ai-practitioner.png",
      credentialUrl: "https://cp.certmetrics.com/amazon/en/public/verify/credential/0ab4ec9845454c1f8b7f9a1ae1884b6e",
    ),
  ];

  // Helper function to launch URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Certifications",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
          ),
          const SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisExtent: 120,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: certificates.length,
            itemBuilder: (context, index) {
  final cert = certificates[index];
  return Card(
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: InkWell( // Tap effect ke liye
      onTap: () => _launchURL(cert.credentialUrl),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: cert.imageUrl.startsWith('http')
                  ? Image.network(cert.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                  : Image.asset(cert.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            // Text Section (Expanded use karne se text bahar nahi jayega)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    cert.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 2, // Text 2 lines tak wrap hoga
                    overflow: TextOverflow.ellipsis, // Agar phir bhi bada ho toh "..." dikhayega
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${cert.organization} • ${cert.date}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.open_in_new, size: 16, color: Colors.blueGrey),
          ],
        ),
      ),
    ),
  );
},
          ),
        ],
      ),
    );
  }
}