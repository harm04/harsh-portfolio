import 'package:flutter/material.dart';
import 'dart:html';

// ignore: must_be_immutable
class MobProjectDetails extends StatelessWidget {
  final String projectName;
  final String description;
  List techstack;
  final String features;
  final String thumbnail;
  final screenshot;
  final apkUrl;

  MobProjectDetails({
    super.key,
    required this.projectName,
    required this.description,
    required this.techstack,
    required this.features,
    required this.thumbnail,
    required this.screenshot,
    this.apkUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 25, 20, 44),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 4.4,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        projectName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 3),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                              image: NetworkImage(thumbnail),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    features,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Tech stack used',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 100,
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: techstack.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          crossAxisCount: 6,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 90,
                            width: 90,
                            child: Image.network(
                              techstack[index],
                              fit: BoxFit.contain,
                            ),
                          );
                        }),
                  ),
                  const Text(
                    'Screenshots',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: screenshot.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Container(
                                  height: 500,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.purple, width: 3),
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          screenshot[index],
                                        ),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
