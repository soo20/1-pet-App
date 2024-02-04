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
        foregroundColor: const Color(0xff707070),
        leadingWidth: 50,
      ),
      extendBodyBehindAppBar: true,
      body: const JackDefineText(),
    );
  }
}
