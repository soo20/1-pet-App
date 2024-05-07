import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petapplication/some_files_to_data/today_and_future_reminders_data.dart';

late Size size;

class BuildReminderCard extends StatefulWidget {
  const BuildReminderCard({
    super.key,
    required this.remindersData,
    required this.onPressed,
  });
  final Reminders remindersData;
  final void Function()? onPressed;

  @override
  State<BuildReminderCard> createState() => _BuildReminderCard();
}

class _BuildReminderCard extends State<BuildReminderCard> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height <= 707.4285714285714
          ? size.height * 0.117
          : size.height * 0.105,
      margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.02, vertical: size.height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0.r)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 10.0.r),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.01),
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: widget.onPressed,
              icon: Image.asset(
                widget.remindersData.checked
                    ? 'assets/icons/home_page_after_adding_reminders_icons/checked_button.png'
                    : 'assets/icons/home_page_after_adding_reminders_icons/unchecked_button.png',
                height: 63.h,
                width: 65.w,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.001),
              child: ClipOval(
                child: Image(
                  image: AssetImage(
                    widget.remindersData.imageUrl,
                  ),
                  width: size.width * 0.150,
                  height: size.height * 0.150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.03,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.remindersData.petName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.070,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A5E7C),
                      height: 0.0,
                    ),
                  ),
                  Text(
                    '${widget.remindersData.eventTitle} ${widget.remindersData.time}',
                    style: TextStyle(
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.046,
                        fontWeight: FontWeight.w100,
                        color: const Color.fromARGB(72, 74, 94, 124)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
