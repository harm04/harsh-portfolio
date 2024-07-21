import 'package:flutter/material.dart';
import 'dart:html';
// ignore: must_be_immutable
class WebProjectDetails extends StatelessWidget {
  final String projectName;
  final apkUrl;
  final String description;
  List techstack;
  final String features;
  final String thumbnail;
  final screenshot;

  WebProjectDetails({
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
        child: Padding(
          padding: const EdgeInsets.only(left:250, right:250 ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 3.3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      projectName,
                      style: const TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 550,
                       
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
                      height: 20,
                    ),
                    Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Text(features,style: const TextStyle(color: Colors.white,fontSize: 30),),
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
                      height: 280,
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
                            
                             child: Image.network(techstack[index],fit: BoxFit.contain,),
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
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: screenshot.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 20,
                                  crossAxisCount: 3,
                                  childAspectRatio: 0.5),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 500,
                              width: 100,
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
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
