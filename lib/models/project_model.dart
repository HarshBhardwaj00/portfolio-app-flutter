

class ProjectModel {
  final String imgURL;
  final String projectName;
  final String description;
 

  
  ProjectModel({
    required this.imgURL,
    required this.projectName,
    required this.description,
    
  });
}

List<ProjectModel> myProjects = [
  ProjectModel(
    projectName: "Weather App",
    description: "Get real-time weather updates and forecasts worldwide using OpenWeather API integration.",
    imgURL: "images/weather.png",
  ),
  ProjectModel(
    projectName: "Currency Converter",
    description: "Convert 100+ global currencies with live exchange rates and smooth user interface design.",
    imgURL: "images/currency-exchange.png",
  ),
  ProjectModel(
    projectName: "Book Shopping App",
    description: "Browse and buy books online with full cart functionality and secure checkout experience.",
    imgURL: "images/books.png",
  ),
];