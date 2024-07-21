// import 'package:flutter/material.dart';
// import 'package:harsh_profile/pages/web/webprojectDetails.dart';


// // ignore: must_be_immutable
// class WebProjectCard extends StatelessWidget {
//   final String projectName;
//   final String description;
//    List techstack;
//   final String features;
//   final String thumbnail;
//   List screenshot;



//    WebProjectCard({super.key, required this.projectName, required this.description, required this.techstack, required this.features, required this.thumbnail, required this.screenshot,});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: const Color.fromARGB(255, 32, 2, 63),
//       elevation: 48,
//       shadowColor: const Color.fromARGB(255, 3, 0, 7),
//       child: SizedBox(
//         height: 200,
//         width: MediaQuery.of(context).size.width * 0.35,
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 40, right: 30),
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 child: Image.asset('assets/images/dev.png'),
//               ),
//             ),
//             Padding(
//               padding:  const EdgeInsets.only(top: 30.0),
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.175,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                      Text(
//                      projectName,
//                       style: const TextStyle(
//                           color: Colors.purple,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 28,
//                           overflow: TextOverflow.ellipsis),
//                     ),
//                      Text(
//                       maxLines: 2,
//                       description,
//                       style: const TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Kalam',
//                           fontSize: 18,
//                           overflow: TextOverflow.ellipsis),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context){
//                           return WebProjectDetails(projectName: projectName, description: description, techstack: techstack, features: features, thumbnail: thumbnail, screenshot: screenshot);
//                         }));  
//                       },
//                       child: Card(
//                         elevation: 50,
//                         child: Container(
//                           height: 40,
//                           width: 140,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: const Color.fromARGB(255, 32, 2, 63),
//                               border: Border.all(color: Colors.white, width: 3)),
//                           child: const Center(
//                               child: Text(
//                             'Know more..',
//                             style: TextStyle(color: Colors.white),
//                           )),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
