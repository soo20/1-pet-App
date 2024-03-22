// ignore_for_file: avoid_print, unnecessary_null_comparison, unused_local_variable, use_build_context_synchronously

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petapplication/pages/page3/camera_screen.dart';

class CameraAlt extends StatefulWidget {
  const CameraAlt({super.key});

  @override
  State<CameraAlt> createState() => _CameraAltState();
}

class _CameraAltState extends State<CameraAlt> {
  late CameraController cameraController;
  late List cameras;
  late int selectedCameraIndex;
  late String imagePath;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = initializeCamera();
  }


  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();

      if (cameras.isNotEmpty) 
      {
        selectedCameraIndex = 0;
        await _initCameraController(cameras[selectedCameraIndex]);
      } 
      else 
      {
        print('No camera available');
      }
    } 
    catch (e)
     {
      print('Error initializing camera: $e');
    }
  }


  Future<void> _initCameraController(CameraDescription cameraDescription) async {
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.yuv420, // Specify the image format group
    );

    cameraController.addListener(() {
      if (mounted) 
      {
        setState(() {});
      }

      if (cameraController.value.hasError) 
      {
        print('Camera error: ${cameraController.value.errorDescription}');
      }
    });

    try 
    {
      await cameraController.initialize();
    } 
    catch (e) 
    {
      print('Error initializing camera controller: $e');
    }
  }


  @override
  void dispose() 
  {
    cameraController.dispose();
    super.dispose();
  }


  /// Display Camera preview.
  Widget _cameraPreviewWidget({required CameraController cameraController})  {
    if (cameraController == null || !cameraController.value.isInitialized) 
    {
      return  Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
           fontFamily: 'Cosffira',
           fontSize: 35.sp,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return Container(
       height: double.infinity,
          width: double.infinity,
          color: Colors.transparent,

      child: CameraPreview(cameraController)
      );
  }



  /// Display the control bar with buttons to take pictures
  Widget _cameraControlWidget(context) {
    return Expanded(
     
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(width: 50.w,),
           Transform.scale(
            scale: 0.90,
             child: FloatingActionButton(
               heroTag: "btn1",
                backgroundColor: Colors.transparent,
                onPressed: () 
                {
                 _onGalleryPressed();
                },
                 shape: const CircleBorder(),
                child: SvgPicture.asset(
                 
                   'assets/icons/Gallarry.svg',
                  // color: Colors.black,
                  width: 350.w,
                  height: 250.h, 
                ),
              ),
           ),
           SizedBox(width: 230.w,),
            Transform.scale(
            scale: 1.32,
             child: FloatingActionButton(
               heroTag: "btn2",
                backgroundColor: Colors.transparent,
                onPressed: () 
                {
                  _onCapturePressed(context);
                },
                 shape: const CircleBorder(),
                child: SvgPicture.asset(
                  'assets/icons/cameraa.svg',
                  // color: Colors.black,
                  width: 300.w,
                  height: 300.h, 
                ),
              ),
           )

          ],
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff9F9A95),
          ),
          onPressed: () 
          {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(
              left: 6.0
              ), 
        ),
      ),
       extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
          width: double.infinity,
           color: Colors.transparent,
            child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,

              children: [
                Expanded(
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) 
                    {
                      if (snapshot.connectionState == ConnectionState.done) 
                      {
                        return _cameraPreviewWidget(cameraController: cameraController);
                      } 
                      else
                      {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                 color: Colors.transparent,
                    height: 235.h,
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                  //  color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _cameraControlWidget(context),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _showCameraException(CameraException e) {
    String errorText = 'Error:${e.code}\nError message : ${e.description}';
    print(errorText);
  }


  void _onCapturePressed(context) async {
    try {
      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      XFile picture = await cameraController.takePicture(); // Capture picture without passing path argument

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imgPath: picture.path, onCapturePressed: (buildContext ) {  }, // Use the path from the XFile
          ),
        ),
      );
    } 
    on CameraException catch (e) 
    {
      _showCameraException(e);
    }
  }

  
  Future<void> _onGalleryPressed() async {
  if (!mounted) return; // Ensure the widget is still mounted

  BuildContext? context = this.context;
  try {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null && context != null) 
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            imgPath: image.path, onCapturePressed: (buildContext ) {  },
          ),
        ),
      );
    }
  } 
  catch (e) 
  {
    print('Error selecting image from gallery: $e');
  }
}


}