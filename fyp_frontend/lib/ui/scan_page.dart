import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:fyp_frontend/ui/screens/results_page.dart'; // Import the ResultsPage

class ScanPage extends StatefulWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  File? selectedImage;
  Uint8List? webImage;
  String? apiResponse;
  List<String> responses = [];
  int? diseaseIndex;
  String? predictedClass;
  Uint8List? xaiImage;

  final List<String> diseaseList = [
    'Black Sigatoka',
    'Cordana',
    'Healthy',
    'Unrecognized Disease',
    'Panama',
    'Pestalotiopsis',
  ];

  @override
  Widget build(BuildContext context) {
    ui.Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Scan Page'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImageFromCamera,
                      child: Image.asset(
                        'assets/images/code-scan.png',
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tap to Scan',
                      style: TextStyle(
                        color: Constants.primaryColor.withOpacity(.80),
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _pickImageFromGallery,
                      child: Text('Upload Image'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Constants.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();

    if (!kIsWeb) {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        final File file = File(image.path);
        setState(() {
          selectedImage = file;
          webImage = null; // Reset web image if any
        });
        _uploadImage(await file.readAsBytes(), path.basename(image.path));
      } else {
        print("No Image has been Picked");
      }
    } else {
      // Handle web camera if needed
      print("Camera not supported on web");
    }
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    print("Picking Image");

    if (!kIsWeb) {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final File file = File(image.path);
        setState(() {
          selectedImage = file;
          webImage = null; // Reset web image if any
        });
        _uploadImage(await file.readAsBytes(), path.basename(image.path));
      } else {
        print("No Image has been Picked");
      }
    } else if (kIsWeb) {
      print("kIsWeb Image");

      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        final Uint8List bytes = await image.readAsBytes();
        setState(() {
          webImage = bytes;
          selectedImage = null; // Reset selected image if any
        });
        _uploadImage(bytes, path.basename(image.path));
      }
    }
  }

  Future<void> _uploadImage(Uint8List data, String filename) async {
    var uri = Uri.parse(
        "http://127.0.0.1:5000/predict"); // Update with the correct endpoint
    var request = http.MultipartRequest("POST", uri);
    request.files.add(http.MultipartFile.fromBytes(
      'image', // Ensure this matches the key expected by Flask
      data,
      filename: filename,
    ));

    var response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print("Response from the server: $responseBody");
      Map<String, dynamic> apiResponse = jsonDecode(responseBody);
      diseaseIndex = int.parse(apiResponse['predicted_class']);
      predictedClass =
          diseaseList[diseaseIndex!]; // Update your UI based on the response
      double confidenceLevel = double.parse(apiResponse['confidence_score']);
      print(predictedClass);

      // Navigate to ResultsPage with the disease name
      xaiImage = await _uploadImageXAI(data, filename);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(
            diseaseName: predictedClass!,
            xaiImage: xaiImage!,
            confidenceLevel: confidenceLevel,
            uploadedImage: data, // Pass the uploaded image
          ),
        ),
      );
    } else {
      print('Failed to upload image: ${response.statusCode}');
    }
  }

  Future<Uint8List> _uploadImageXAI(Uint8List data, String filename) async {
    var uri = Uri.parse(
        "http://127.0.0.1:5000/predictXai"); // Update with the correct endpoint
    var request = http.MultipartRequest("POST", uri);
    request.files.add(http.MultipartFile.fromBytes(
      'image', // Ensure this matches the key expected by Flask
      data,
      filename: filename,
    ));

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await response.stream.toBytes();
      return responseBody;
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
