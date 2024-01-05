/*import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pathprovider;
import 'package:petapplication/core/utils/size_config.dart';

class CameraAlt extends StatefulWidget {
  final List<CameraDescription> cameras ;
 const  CameraAlt(this.cameras, {super.key});
 

  @override
  State<CameraAlt> createState() => _CameraAltState();
}

class _CameraAltState extends State<CameraAlt> {
 late CameraController controller;
 bool isCapturing = false;
 // for switching camera
 int _seletedCameraIndex = 0;
 bool _isFrontCamera = false ;
 // for flash
 bool _isFlash = false ;
 // for focusing
 Offset? _focuspoint ;
 // for zoom
 double _currentZoom = 1.0 ;
 File? _capturedImage ;
 // for making sound
 AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
 @override
  void initState() {
    
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {
        
      });
    });
  }
    @override
    void dispose(){
      controller.dispose();
      super.dispose();
    }
    void _taggleFlash(){
      if(_isFlash){
        controller.setFlashMode(FlashMode.off);
        setState(() {
          _isFlash = false ;
        });
      }
      else{
        controller.setFlashMode(FlashMode.torch);
        setState(() {
          _isFlash = true;
        });
      }
    }
  @override
  Widget build(BuildContext context) {
   
  
   
    return  SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext cotext , BoxConstraints onstraints) {
            return Stack(
              children: [
                Positioned(
                  top:0 ,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 4, 4, 4)
                    ),
                    child:  Row(
                      children: [
                        const SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            _taggleFlash();
                          },
                          
                          child: _isFlash ==  false ?const Icon(Icons.flash_off,
                          
                          size: 30,
                          color: Colors.white,
                          )
                          :const Icon(Icons.flash_on,
                          
                          size: 30,
                          color: Colors.white,
                          )
                        ),
                        
                      ],
                    ),
                  ),
                 ),
                 Positioned.fill(
                          top: 0,
                          bottom: _isFrontCamera == false ? 0 : 0,
                          child: AspectRatio(aspectRatio: controller.value.aspectRatio,
                          child: CameraPreview(controller),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child:Container(
                            height: 170,
                            decoration: BoxDecoration(
                              color: _isFrontCamera == false ? const Color.fromARGB(92, 0, 0, 0) : Colors.blueAccent,

                            ),
                            child: Column(
                              
                              children: [
                                SizedBox(height: 40,),
                                Row(
                                children: [
                                  SizedBox(width: 30,),
                                  const Icon(Icons.photo,size: 80,),
                                   SizedBox(width: 80,),
                                  const Icon(Icons.camera,size: 80,),
                                  //const Icon(icon),
                                ],
                              )],
                            ),
                          ) )
              ],
            );
            
          }),
          ),
          
        
      
    );
  }
}*/