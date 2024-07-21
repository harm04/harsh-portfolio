
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController descriptionController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController featureController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    projectNameController.dispose();
    githubController.dispose();
    websiteController.dispose();
    featureController.dispose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Uint8List? thumbnail;

  Future<void> pickThumbnail() async {
    ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var selected = await image.readAsBytes();
      setState(() {
        thumbnail = selected;
      });
    }
  }

  Future<void> uploadMetadata() async {
    await _firestore
        .collection('projects')
        .doc(projectNameController.text)
        .set({
      'projectName': projectNameController.text,
      'description': descriptionController.text,
      'githubUrl': githubController.text,
      'features': featureController.text,
      'websiteUrl': websiteController.text,
      'apk': "",
      'techstackUrls': [],
      'screenshotsUrls': [],
      'thumbnail': ""
    });
  }

  List<PlatformFile>? _techstackfiles;
  List<String> techstackUrls = [];
 List<PlatformFile>?_apkresult;
 var apkurl;
  List<PlatformFile>? _screenshotsfiles;
  List<String> screenshotsUrls = [];

  final TextEditingController _projectNameController = TextEditingController();

  Future<void> _picktechstackFiles() async {
    FilePickerResult? techstackresult =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (techstackresult != null) {
      setState(() {
        _techstackfiles = techstackresult.files;
      });
    }
  }

  Future<void> _pickscreenshotsFiles() async {
    FilePickerResult? screenshotsresult =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (screenshotsresult != null) {
      setState(() {
        _screenshotsfiles = screenshotsresult.files;
      });
    }
  }
    Future<void> pickApk() async {
    FilePickerResult? apkresult =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (apkresult != null) {
      setState(() {
       _apkresult = apkresult.files;
      });
    }
  }

  Future<void> _uploadtechstack() async {
    for (var file in _techstackfiles!) {
      String fileName = file.name;
      Uint8List? fileBytes = file.bytes;
     
      if (fileBytes != null) {
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref('${projectNameController.text}/techstack/$fileName')
            .putData(fileBytes);

        String downloadURL = await snapshot.ref.getDownloadURL();

        techstackUrls.add(downloadURL);
      }
    }

    await FirebaseFirestore.instance
        .collection('projects')
        .doc(projectNameController.text)
        .update({
      'techstackUrls': techstackUrls,
    });
   

    setState(() {
      _techstackfiles = null;
      _projectNameController.clear();
      techstackUrls.clear();
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Files uploaded successfully')),
    );
  }

  Future<void> uploadApk() async {
    for (var file in _apkresult!) {
      String sfileName = file.name;
      Uint8List? sfileBytes = file.bytes;

      if (sfileBytes != null) {
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref('${projectNameController.text}/apk')
            .putData(sfileBytes);

        String apkUrl = await snapshot.ref.getDownloadURL();

      apkurl=apkUrl;
      }
    }

    await FirebaseFirestore.instance
        .collection('projects')
        .doc(projectNameController.text)
        .update({
      'apk': apkurl,
    });


    setState(() {
     _apkresult = null;
      _projectNameController.clear();
      apkurl.clear();
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Files uploaded successfully')),
    );
  }

  Future<void> _uploadscreenshots() async {
    for (var file in _screenshotsfiles!) {
      String sfileName = file.name;
      Uint8List? sfileBytes = file.bytes;

      if (sfileBytes != null) {
        TaskSnapshot snapshot = await FirebaseStorage.instance
            .ref('${projectNameController.text}/screenshots/$sfileName')
            .putData(sfileBytes);

        String screenUrls = await snapshot.ref.getDownloadURL();

        screenshotsUrls.add(screenUrls);
      }
    }

    await FirebaseFirestore.instance
        .collection('projects')
        .doc(projectNameController.text)
        .update({
      'screenshotsUrls': screenshotsUrls,
    });


    setState(() {
      _screenshotsfiles = null;
      _projectNameController.clear();
      screenshotsUrls.clear();
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Files uploaded successfully')),
    );
  }

  Future<void> uploadThumbnail() async {
    if (thumbnail == null) return;
    try {
      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref('${projectNameController.text}/thumbnail')
          .putData(thumbnail!);
      String thumbnailURL = await snapshot.ref.getDownloadURL();
      setState(() {
        thumbnail = null;
      });
      await _firestore
          .collection('projects')
          .doc(projectNameController.text)
          .update({
        'thumbnail': thumbnailURL,
      });
    } catch (err) {
      print(err.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  DottedBorder(
                    borderType: BorderType.Rect,
                    color: Colors.grey,
                    strokeWidth: 1,
                    child: GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () async {
                            pickThumbnail();
                            
                          },
                          child: Card(
                            child: SizedBox(
                                height: 200,
                                width: 360,
                                child: thumbnail != null
                                    ? Image.memory(thumbnail!)
                                    : const Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.upload,
                                              size: 50,
                                              color: Colors.grey,
                                            ),
                                            Text('Thumbnail'),
                                          ],
                                        ),
                                      )),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          width: 500,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              controller: projectNameController,
                              decoration: const InputDecoration.collapsed(
                                hintText: "Enter Project name",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: TextField(
                              maxLines: null,
                              controller: descriptionController,
                              decoration: const InputDecoration.collapsed(
                                hintText: "Enter description",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        controller: githubController,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Enter Github url",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        controller: websiteController,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Enter Website url",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: 200,
                    width: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        maxLines: null,
                        controller: featureController,
                        decoration: const InputDecoration.collapsed(
                          hintText: "Enter key features",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      _picktechstackFiles();
                    },
                    child: DottedBorder(
                      borderType: BorderType.Rect,
                      color: Colors.grey,
                      strokeWidth: 1,
                      child: const Card(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text('Techstack'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.Rect,
                    color: Colors.grey,
                    strokeWidth: 1,
                    child: GestureDetector(
                      onTap: () {
                       _pickscreenshotsFiles();
                      },
                      child: const Card(
                        child: SizedBox(
                          height: 100,
                          width: 150,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text('Select screenshots'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  DottedBorder(
                    borderType: BorderType.Rect,
                    color: Colors.grey,
                    strokeWidth: 1,
                    child: GestureDetector(onTap: (){
                      pickApk();
                    },
                      child: const Card(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.upload,
                                  size: 50,
                                  color: Colors.grey,
                                ),
                                Text('upload apk'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30,),
              GestureDetector(
                onTap: ()async{
                 await uploadMetadata();
                 await uploadThumbnail();
                 await _uploadtechstack();
                
                 await _uploadscreenshots();
                  await uploadApk();
                },
                child: Card(color: Colors.blue,child: Container(
                  height: 60,
                  width: 200,
                  child: const Center(child: Text('Submit'),),
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
