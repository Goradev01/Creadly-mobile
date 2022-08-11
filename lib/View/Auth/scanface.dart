// ignore_for_file: use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:creadlymobile/View/Auth/submitface.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class Scanface extends StatefulWidget {
  final CameraDescription camera;

  const Scanface({Key? key, required this.camera}) : super(key: key);

  @override
  State<Scanface> createState() => _ScanfaceState();
}


class _ScanfaceState extends State<Scanface> {
 
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final design = Ui();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return design.layout(Padding(
      padding: const EdgeInsets.fromLTRB(25, 35, 25, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffF8F8FA)),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 10,
                      color: design.blue,
                    )),
              ),
              design.wspacer(19),
              design.title('Face Scan'),
            ],
          ),
          Text(
            'Face Scan',
            style: TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.w700, color: design.ash),
          ),
          Container(
            width: width,
            alignment: Alignment.center,
            height: height / 1.7,
            decoration: BoxDecoration(
                border: Border.all(
              color: design.numb,
              width: 1,
            )),
            child: Container(
              width: width,
              alignment: Alignment.center,
              height: height / 1.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffE1E1EC),
                      Color(0xffFFFFFF),
                      Color(0xffE1E1EC),
                    ],
                  )),
              child: Container(
                  height: 195,
                  width: 163,
                  decoration: const BoxDecoration(),
                  child: ClipOval(
                    child: FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // If the Future is complete, display the preview.
                          return CameraPreview(_controller);
                        } else {
                          // Otherwise, display a loading indicator.
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  )),
            ),
          ),
          GestureDetector(
              onTap: () async {
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final image = await _controller.takePicture();

                  // If the picture was taken, display it on a new screen.
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Submitface(
                        // Pass the automatically generated path to
                        // the DisplayPictureScreen widget.
                        imagepath: image.path,
                      ),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.

                }
              },
              child: design.longButton(width, 'Scan'))
        ],
      ),
    ));
  }
}
