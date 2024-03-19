// ignore_for_file: sized_box_for_whitespace, avoid_print

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petapplication/main.dart';

class CameraAlt extends StatefulWidget {
  const CameraAlt({super.key});

  @override
  State<CameraAlt> createState() => _CameraAltState();
}

class _CameraAltState extends State<CameraAlt> {
  late CameraController _controllerr;

  @override
  void initState(){
    super.initState();
    _controllerr = CameraController(cameras[0], ResolutionPreset.max);
    _controllerr.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {
        
      });
    }).catchError((Object e){
      if(e is CameraException){
        switch (e.code){
          case 'CameraAccessDenied':
          print("Access was denied");
          break ;
          default:
          print(e.description);
          break;
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     // implement camera
     body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: CameraPreview(_controllerr),
        ),
          // add buttom to take photo
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width:  double.infinity,
                height: 350.h,
                color:const Color.fromARGB(91, 41, 46, 41),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () async{
                        if(
                          !_controllerr.value.isInitialized
                        ) {
                          return null;
                        }
                        if(
                          !_controllerr.value.isTakingPicture
                        ){
                          return null ;
                        }
                        try{
                          await _controllerr.setFlashMode(FlashMode.auto);
                          XFile picture = await _controllerr.takePicture();
                        }on CameraException catch (e){
                          debugPrint("error while take photo : $e");
                          return null ;
                        }
                      } ,
                                   
                    child:  IconButton(
                      color: Colors.blue,
                          onPressed: () {
                          },
                           icon: SvgPicture.asset('assets/icons/cameraa.svg'
                        ,width: 220.w,
                        height: 220.h,
                        ),
                           ),
                    
                    ),
                  ],
                ),
              ),
            ],
          )
      ],
     ),
    );
  }
}