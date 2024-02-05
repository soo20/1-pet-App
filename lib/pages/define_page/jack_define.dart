import 'package:flutter/material.dart';
import 'package:petapplication/Welcome/presention/widgets/image_of_yuna_gizmo_wanda_jack.dart';

import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';

class JackDefine extends StatelessWidget {
  const JackDefine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColorPage,
      appBar: AppBar(
        elevation: 1,

        automaticallyImplyLeading: true,

        //iconTheme: IconThemeData.fallback(),
        forceMaterialTransparency: true,
        toolbarOpacity: 1,
        toolbarHeight: 55,
        
        leadingWidth: 50,
      
         leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color:  Color(0xff2A606C),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          iconSize: 39.0,
          padding: const EdgeInsets.only(
              left: 6.0), // Set the size of the arrow icon
        ),
      ),
      extendBodyBehindAppBar: true,
      body: const JackDefineImage(),
    );
  }
}
