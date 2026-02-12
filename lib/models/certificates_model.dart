class Certificate {
  final String title;
  final String organization;
  final String date;
  final String imageUrl;
  final String credentialUrl; // New field for the link

  Certificate({
    required this.title,
    required this.organization,
    required this.date,
    required this.imageUrl,
    required this.credentialUrl,
  });
}