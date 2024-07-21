import 'package:cloud_firestore/cloud_firestore.dart';

class Data {
  final String projectName;
  final String description;
  final String githubUrl;
  final  thumbnail;
  final String features;
  final techstackUrls;
  final apk;
  final screenshotsUrls;
  final websiteUrl;

  const Data({
    required this.description,
    required this.projectName,
    required this.githubUrl,
    required this.websiteUrl,
    required this.features,
    required this.thumbnail,
    required this.techstackUrls,
    required this.apk,
    required this.screenshotsUrls,
  });


   factory Data.fromJson(DocumentSnapshot snapshot) {
    return Data(
      description: snapshot['description'],
      projectName: snapshot['projectName'],
      githubUrl: snapshot['githubUrl'],
      websiteUrl:snapshot['websiteUrl'],
      features:snapshot['features'],
      thumbnail:snapshot['thumbnail'],
      techstackUrls:snapshot['techstackUrls'],
      screenshotsUrls:snapshot['screenshotsUrls'],
      apk:snapshot['apk'],
  
    );
  }
}

 

