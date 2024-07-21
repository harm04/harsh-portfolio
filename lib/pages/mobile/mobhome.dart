import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harsh_profile/model/dataModel.dart';
import 'package:harsh_profile/pages/mobile/mobprojectDetails.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/link.dart';
import 'dart:html';

class MobHomePage extends StatefulWidget {
  const MobHomePage({super.key});

  @override
  State<MobHomePage> createState() => _MobHomePageState();
}

class _MobHomePageState extends State<MobHomePage> {
  Artboard? riveArtBoard;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/rive/space_coffee.riv').then((data) async {
      try {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'spaceCoffee');
        if (controller != null) {
          artboard.addController(controller);
        }
        setState(() {
          riveArtBoard = artboard;
        });
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 20, 44),
        body: riveArtBoard == null
            ? const SizedBox()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        const SizedBox(
                          height: 1100,
                          width: double.infinity,
                          child: const RiveAnimation.asset(
                            'assets/rive/space_coffee.riv',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  top: 40,
                                ),
                                child: CircleAvatar(
                                  radius: 128,
                                  backgroundColor: Colors.yellow,
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundImage:
                                        AssetImage("assets/images/harsh.jpg"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30, right: 18, left: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                          text: 'Hi! I am',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' Harsh Mali.',
                                              style: TextStyle(
                                                  color: Colors.purple,
                                                  fontSize: 30,
                                                  fontFamily: 'Kalam',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    RichText(
                                        text: const TextSpan(
                                            style: TextStyle(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                'Transforming ideas into elegant code structures is the art of ',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'Software Craftsmanship.',
                                            style: TextStyle(
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ]))
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: RichText(
                                  text: const TextSpan(
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text:
                                              'Passionate Flutter developer with 1.5 years of personal project experience, proficient in Firebase and user interfaces, pursuing a B.Tech in ',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Computer Engineering ',
                                          style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 30,
                                              fontFamily: 'Kalam',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              'from the University of Mumbai.',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 30),
                                child: Row(
                                  children: [
                                    Link(
                                        uri: Uri.parse(
                                            'https://github.com/harm04'),
                                        builder: (context, followLink) {
                                          return InkWell(
                                            onTap: followLink,
                                            child: const Icon(
                                              FontAwesomeIcons.github,
                                              size: 50,
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Link(
                                        uri: Uri.parse(
                                            'https://www.instagram.com/harsh_mali_4/'),
                                        builder: (context, followLink) {
                                          return InkWell(
                                            onTap: followLink,
                                            child: const Icon(
                                              FontAwesomeIcons.instagram,
                                              size: 50,
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Link(
                                        uri: Uri.parse(
                                            'https://www.linkedin.com/in/harsh-mali-b5399a2a7/'),
                                        builder: (context, followLink) {
                                          return InkWell(
                                            onTap: followLink,
                                            child: const Icon(
                                              FontAwesomeIcons.linkedin,
                                              size: 50,
                                            ),
                                          );
                                        }),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Link(
                                        uri: Uri.parse(
                                            'https://x.com/Harm_Mali'),
                                        builder: (context, followLink) {
                                          return InkWell(
                                            onTap: followLink,
                                            child: const Icon(
                                              FontAwesomeIcons.twitter,
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 1250,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 35,
                                      fontFamily: 'Kalam'),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Participated in multiple state and out-of-state '),
                                    TextSpan(
                                        text: 'hackathons, ',
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 38)),
                                    TextSpan(
                                        text:
                                            'showcasing innovative solutions and collaborating with peers. '),
                                    TextSpan(
                                        text:
                                            'Earned certificates in key technical areas, ',
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 38)),
                                    TextSpan(
                                      text:
                                          'demonstrating a commitment to continuous learning and skill enhancement.',
                                    ),
                                  ]),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Kalam'),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            'Vice Chairman at Computer Society of India (CSI), ',
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 23)),
                                    TextSpan(
                                      text:
                                          'University of Mumbai chapter, organizing and leading events to promote technical ',
                                    ),
                                    TextSpan(
                                        text: 'knowledge and skills. ',
                                        style: TextStyle(
                                            color: Colors.purple,
                                            fontSize: 23)),
                                    TextSpan(
                                      text: 'Active member of university ',
                                    ),
                                    TextSpan(
                                      text: 'tech clubs, ',
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 23),
                                    ),
                                    TextSpan(
                                      text:
                                          'contributing to workshops and seminars on ',
                                    ),
                                    TextSpan(
                                      text:
                                          'Flutter and mobile app development.',
                                      style: TextStyle(
                                          color: Colors.purple, fontSize: 23),
                                    ),
                                  ]),
                            ),
                            Image.asset(
                              'assets/images/skill_background.png',
                              fit: BoxFit.cover,
                              height:350,
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Projects',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 60,
                            ),
                          ),
                         StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('projects')
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  return SizedBox(
                                      height: 500,
                                      width:  MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            Data dataModel = Data.fromJson(
                                                snapshot.data.docs[index]);
                                            return Padding(
                                              padding:
                                                   EdgeInsets.all(8.0),
                                              child: Card(
                                                color: const Color.fromARGB(
                                                    31, 56, 56, 56),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        height: 220,
                                                        width:  MediaQuery.of(context).size.width,
                                                        decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    dataModel
                                                                        .thumbnail
                                                                        .toString()),
                                                                fit: BoxFit
                                                                    .cover)),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Text(
                                                          dataModel.projectName,
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Text(
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          dataModel.description,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 20),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) {
                                                              return MobProjectDetails(
                                                                projectName:
                                                                    dataModel
                                                                        .projectName,
                                                                description:
                                                                    dataModel
                                                                        .description,
                                                                techstack:
                                                                    dataModel
                                                                        .techstackUrls,
                                                                features:
                                                                    dataModel
                                                                        .features,
                                                                thumbnail:
                                                                    dataModel
                                                                        .thumbnail,
                                                                screenshot:
                                                                    dataModel
                                                                        .screenshotsUrls,
                                                                apkUrl:
                                                                    dataModel
                                                                        .apk,
                                                              );
                                                            }));
                                                          },
                                                          child: Card(
                                                            color: Colors
                                                                .purple,
                                                            child:
                                                                Container(
                                                              height: 40,
                                                              width: 130,
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  'Read more',
                                                                  style: TextStyle(
                                                                      color:
                                                                          Colors.white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }));
                                }),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                                       children: [
                                                         Text('Swipe right to view more'),
                                                         SizedBox(width: 5,),
                                                         Icon(Icons.arrow_circle_right_rounded)
                                                       ],
                                                     ),
                        ],
                      ),
                    ),
                   
                    const SizedBox(
                              height: 60,
                            ),
                            
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90.0),
                      child: Center(
                        child: Text(
                          'Contact Me',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Link(
                              uri: Uri.parse('https://github.com/harm04'),
                              builder: (context, followLink) {
                                return InkWell(
                                  onTap: followLink,
                                  child: const Icon(
                                    FontAwesomeIcons.github,
                                    size: 50,
                                  ),
                                );
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          Link(
                              uri: Uri.parse(
                                  'https://www.instagram.com/harsh_mali_4/'),
                              builder: (context, followLink) {
                                return InkWell(
                                  onTap: followLink,
                                  child: const Icon(
                                    FontAwesomeIcons.instagram,
                                    size: 50,
                                  ),
                                );
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          Link(
                              uri: Uri.parse(
                                  'https://www.linkedin.com/in/harsh-mali-b5399a2a7/'),
                              builder: (context, followLink) {
                                return InkWell(
                                  onTap: followLink,
                                  child: const Icon(
                                    FontAwesomeIcons.linkedin,
                                    size: 50,
                                  ),
                                );
                              }),
                          const SizedBox(
                            width: 10,
                          ),
                          Link(
                              uri: Uri.parse('https://x.com/Harm_Mali'),
                              builder: (context, followLink) {
                                return InkWell(
                                  onTap: followLink,
                                  child: const Icon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Center(
                        child: Text(
                          'Created with 💛 by @Harsh Mali',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
