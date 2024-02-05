// ignore_for_file: unused_import, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:petapplication/Welcome/presention/widgets/speaks_of_wanda_jack_yuna_gizmo.dart';
import 'package:petapplication/core/utils/widgets/repeatColorsUse.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petapplication/core/utils/size_config.dart';
import 'package:petapplication/core/utils/widgets/custom_buttom.dart';
import 'package:petapplication/pages/define_page/widgets/alart_dialog.dart';
import 'package:petapplication/pages/sign_login_acount/popup_surface.dart';

//import 'package:google_fonts/google_fonts.dart';
class Yuna extends StatelessWidget {
  const Yuna({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions

    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    return Container(
      color: kMainColorPage,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio,
          ),
          Positioned(
            top: 120,
            left: -30,
            bottom: 70,
            width: 300,
            child: Padding(
              padding:
                  const EdgeInsets.all(16.0), // Add padding of 8.0 to all sides
              child: Image.asset(
                'assets/image/Group315.png',

                //'assets/image/Group315.png',
                width: 180, // Set the width of the image
                height: 280, // Set the height of the image
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
          ),
          const Stack(
            alignment: Alignment.topLeft,
            children: [
              YunaSpeak(),
              /*Positioned(
                  right: 33,
                  left: SizeConfig.defaultSize! * 28,
                  bottom: SizeConfig.defaultSize! * 6,
                  child: const CustomGeneralButtom(
                    text: 'continue',
                  ),
                ),*/
              // Other widgets can be added here within the Stack if needed
            ],
          ),
        ],
      ),
    );
  }
}

class Jack extends StatelessWidget {
  const Jack({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate height based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 70; // Adjust the width as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: -200,
              bottom: 40,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(92.0),
                child: Image.asset(
                  'assets/image/Group327.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Stack(
              alignment: Alignment.topLeft,
              children: [
                JackSpeak(),
                /*Positioned(
                  right: 33,
                  left: SizeConfig.defaultSize! * 28,
                  bottom: SizeConfig.defaultSize! * 6,
                  child: const CustomGeneralButtom(
                    text: 'continue',
                  ),
                ),*/
                // Other widgets can be added here within the Stack if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Gizmo extends StatelessWidget {
  const Gizmo({super.key});
  // Set your desired aspect ratio

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 160,
              right: 155,
              bottom: 55,
              width: screenWidth / 4.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/image/Group737.png',
                  width: screenWidth / 1.55, // Adjust the width
                  height: screenHeight * 0.1, // Adjust the height as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Stack(
              alignment: Alignment.topLeft,
              children: [
                GizmoSpeak(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*class TextOverImageItem4 extends StatelessWidget {
  const TextOverImageItem4({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 420; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: [
            Positioned(
              top: 170,
              right: -177,
              bottom: -45,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(165.0),
                child: Image.asset(
                  'assets/image/monkey.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Stack(
              alignment: Alignment.topLeft,
              children: [
                Component1311(),
                /*Positioned(
                  right: 33,
                  left: SizeConfig.defaultSize! * 28,
                  bottom: SizeConfig.defaultSize! * 6,
                  child: const CustomGeneralButtom(
                    text: 'continue',
                  ),
                ),*/
                // Other widgets can be added here within the Stack if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
/*class TextOverSVGImage6 extends StatelessWidget {
  const TextOverSVGImage6({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 220; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 164,
              right: -166,
              bottom: 20,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Image.asset(
                  'assets/image/Group766.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                const Component1312(),
                Stack(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              350.5, 585.5, 30.5, 88.0),
                          child: SizedBox.expand(
                              child: SvgPicture.string(
                            '<svg viewBox="0.5 0.5 77.0 87.2" ><path transform="translate(0.01, -0.04)" d="M 0.5325672626495361 73.12496948242188 C -0.08815998584032059 71.99888610839844 8.200075149536133 68.23758697509766 16.50662612915039 61.48662948608398 C 19.20220947265625 59.2972297668457 31.79381561279297 49.06557464599609 37.11680603027344 34.73848342895508 C 43.76163864135742 16.85592460632324 35.74916839599609 1.645504832267761 39.42672729492188 0.5544970631599426 C 41.86486053466797 -0.1691493988037109 47.08609008789062 6.50704288482666 49.96993255615234 13.04385852813721 C 55.70707702636719 26.04364967346191 52.33479690551758 38.78591918945312 53.33101272583008 38.89760208129883 C 54.41372299194336 39.01851654052734 56.3206787109375 23.7425651550293 58.8849983215332 23.76748657226562 C 61.17965316772461 23.79056167602539 62.90751266479492 36.05562973022461 63.23008728027344 38.82560729980469 C 63.5211181640625 41.32421875 63.69309234619141 42.80474090576172 63.4844856262207 44.91845321655273 C 63.20973587036133 47.70504379272461 62.53914642333984 48.89481353759766 63.08966064453125 49.26863479614258 C 64.63740539550781 50.31903076171875 70.73681640625 41.79034423828125 74.69115447998047 42.75120544433594 C 78.2218017578125 43.60813140869141 79.05821990966797 62.65385055541992 73.82907104492188 75.54682922363281 C 70.29379272460938 84.26490783691406 61.37965774536133 88.43114471435547 58.4548225402832 87.64741516113281 C 56.44110870361328 87.10740661621094 53.07009506225586 83.46330261230469 47.80253982543945 80.24503326416016 C 42.53498458862305 77.02676391601562 42.6530647277832 76.57961273193359 37.38460922241211 74.77432250976562 C 32.11615753173828 72.96903228759766 26.62038040161133 71.99314117431641 26.62038040161133 71.99314117431641 C 26.62038040161133 71.99314117431641 15.66605854034424 71.65066528320312 9.152786254882812 72.21894836425781 C 5.697996139526367 72.52069854736328 0.6436315774917603 73.32633209228516 0.5325672626495361 73.12496948242188 Z" fill="none" stroke="#000000" stroke-width="1.1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.contain,
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              270.5, 585.5, 110.5, 88.0),
                          child: SizedBox.expand(
                            child: Transform.rotate(
                                angle: 2 * 3.14159 / 2, // Rotate by 180 degrees in radians
                                child: SvgPicture.string(
                                  '<svg viewBox="4.5 2.3 77.0 87.2" ><path transform="translate(4.5, 2.28)" d="M 0.03283151984214783 14.61571502685547 C -0.5878950953483582 15.74179840087891 7.700329303741455 19.50309753417969 16.00686836242676 26.25405120849609 C 18.70244789123535 28.44345092773438 31.29403686523438 38.67510604858398 36.61701965332031 53.00219345092773 C 43.26184463500977 70.88475036621094 35.2493782043457 86.09516906738281 38.92693328857422 87.18617248535156 C 41.36506271362305 87.90982055664062 46.58628845214844 81.23362731933594 49.47012710571289 74.69681549072266 C 55.20726776123047 61.697021484375 51.83499145507812 48.95475387573242 52.83120727539062 48.84307098388672 C 53.91391372680664 48.7221565246582 55.82086944580078 63.99810791015625 58.38518524169922 63.97318267822266 C 60.67983627319336 63.95011138916016 62.40769195556641 51.68504333496094 62.73026657104492 48.91506576538086 C 63.02129745483398 46.41645431518555 63.19327163696289 44.93593215942383 62.98466491699219 42.82221984863281 C 62.70991897583008 40.03562927246094 62.03932952880859 38.84586334228516 62.58984375 38.47204208374023 C 64.13758850097656 37.42164611816406 70.23699188232422 45.9503288269043 74.19132995605469 44.98946762084961 C 77.72196960449219 44.13254165649414 78.55838775634766 25.08682632446289 73.32924652099609 12.19384765625 C 69.79396820068359 3.47576904296875 60.87984848022461 -0.6904678344726562 57.95501708984375 0.09326171875 C 55.94130325317383 0.633270263671875 52.57029724121094 4.277374267578125 47.3027458190918 7.495643615722656 C 42.03519439697266 10.71391296386719 42.15327453613281 11.16106414794922 36.88482666015625 12.96635437011719 C 31.61637878417969 14.77164459228516 26.12061309814453 15.74754333496094 26.12061309814453 15.74754333496094 C 26.12061309814453 15.74754333496094 15.16630268096924 16.09001922607422 8.65303897857666 15.52173614501953 C 5.198254108428955 15.21998596191406 0.1438956558704376 14.41435241699219 0.03283151984214783 14.61571502685547 Z" fill="none" stroke="#000000" stroke-width="1.1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
                /*Positioned(
                  right: 33,
                  left: SizeConfig.defaultSize! * 28,
                  bottom: SizeConfig.defaultSize! * 6,
                  child: const CustomGeneralButtom(
                    text: 'continue',
                  ),
                ),*/
                // Other widgets can be added here within the Stack if needed
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/

class Wanda extends StatelessWidget {
  const Wanda({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate dimensions based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 220; // Adjust this value as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Container(
        color: kMainColorPage,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 144,
              left: -130,
              bottom: 20,
              width: itemWidth,
              child: Padding(
                padding: const EdgeInsets.all(124.0),
                child: Image.asset(
                  'assets/image/Group1021.png',
                  width: itemWidth,
                  height: itemHeight,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Stack(
              alignment: Alignment.topLeft,
              children: [
                WandaSpeak(),
                ],
            ),
          ],
        ),
      ),
    );
  }
}

class JackDefineImage extends StatelessWidget {
  const JackDefineImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate aspect ratio based on screen dimensions
    double aspectRatio = screenWidth / screenHeight;

    // Calculate height based on a 16:9 aspect ratio
    double itemWidth = screenWidth - 70; // Adjust the width as needed
    double itemHeight = itemWidth / 16 * 9;

    return AspectRatio(
      aspectRatio: aspectRatio, // Set your desired aspect ratio here
      child: Stack(
        children: [
          Positioned(
            top: 90,
            left: -250,
            bottom: 10,
            width: itemWidth,
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Image.asset(
                'assets/image/Group1340.png',
                width: itemWidth,
                height: itemHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topLeft,
            children: [
              const JackDefineSpeak(),
              Positioned(
                right: 140,
                left: SizeConfig.defaultSize! * 15.5,
                bottom: SizeConfig.defaultSize! * 6,
                child: CustomGeneralButtom3(
                  text: '',
                  boxColor: kMainColor,
                  height: 58,
                  textColor: null,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => const AlartDialogPage());
                  },
                ),
              ),
              // Other widgets can be added here within the Stack if needed
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
const String _svg_wadptu =
    '<svg viewBox="6.0 0.0 221.0 37.0" ><path transform="translate(-628.34, 3069.19)" d="M 634.3417358398438 -3032.1884765625 L 640.6785888671875 -3069.1884765625 L 659.6895141601562 -3046.848876953125 L 824.4493408203125 -3046.848876953125 L 844.2520751953125 -3069.1884765625 L 855.3417358398438 -3032.1884765625" fill="none" stroke="#081e17" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
