import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  DateTime dateTime = DateTime.now();
  late String currentItemSelected;
  bool customType = false;
  @override
  void initState() {
    super.initState();
    currentItemSelected = 'Playing';
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Flexible(
      child: AlertDialog(
        scrollable: true,
        backgroundColor: const Color(0xffEFE7E7),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              size.width * 0.058), // Set the border radius of the button
        ),
        title: const Text(
          'Add a new event',
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyle(
          height: 0.0,
          fontFamily: 'Cosffira',
          fontSize: size.width * 0.077,
          fontWeight: FontWeight.w800,
          color: const Color(0xff4A5E7C),
        ),
        content: Container(
          color: const Color(0xffEFE7E7),
          height: customType ? size.height * 0.9 : size.height * 0.7,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Event type',
                  style: TextStyle(
                    height: 0.0,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.048,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffBEC2CC),
                  ),
                ),
              ),
              Container(
                width: size.width * 0.84,
                padding: EdgeInsets.all(size.width * 0.02),
                margin: EdgeInsets.only(
                  top: size.height * 0.017,
                  bottom: size.height * 0.03,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    size.width * 0.045,
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, size.width * 0.002),
                      color: const Color.fromARGB(143, 3, 3, 3),
                      blurRadius: size.width * 0.01,
                    ),
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    padding: EdgeInsets.only(
                      left: size.height * 0.01,
                    ),
                    dropdownColor: const Color.fromARGB(255, 221, 212, 214),
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff4A5E7C),
                    ),
                    value: currentItemSelected,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xffA26874),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        currentItemSelected = newValue!;
                        if (currentItemSelected == 'Custom') {
                          customType = true;
                        } else {
                          customType = false;
                        }
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Gromming',
                        child: Text(
                          'Gromming',
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Playing',
                        child: Text('Playing'),
                      ),
                      DropdownMenuItem(
                        value: 'Medical Checkup',
                        child: Text('Medical Checkup'),
                      ),
                      DropdownMenuItem(
                        value: 'Bathing',
                        child: Text('Bathing'),
                      ),
                      DropdownMenuItem(
                        value: 'Walking',
                        child: Text('Walking'),
                      ),
                      DropdownMenuItem(
                        value: 'Custom',
                        child: Text('Custom'),
                      ),
                    ],
                  ),
                ),
              ),
              if (customType)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      heightFactor: 0.0,
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Your Custom Type',
                        style: TextStyle(
                          height: 0.0,
                          fontFamily: 'Cosffira',
                          fontSize: size.width * 0.048,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffBEC2CC),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        SizedBox(
                          width: size.width * 0.46,
                          height: size.height * 0.084,
                          child: TextField(
                            style: TextStyle(
                              fontFamily: 'Cosffira',
                              fontSize: size.width * 0.040,
                              fontWeight: FontWeight.normal,
                              color: const Color.fromARGB(255, 37, 40, 50),
                            ),
                            cursorColor: const Color(0xffA26874),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xff4A5E7C),
                                ),
                                borderRadius: BorderRadius.circular(size.width *
                                    0.067), // Same as the container's border radius
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xffA26874),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * 0.067),
                                ),
                              ),
                              // Background color
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/add_event_page_icons/check_custom_type.png',
                            width: size.width * 0.128,
                            height: size.height * 0.135,
                          ),
                          onPressed: () {
                            setState(() {
                              customType = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    heightFactor: 0.0,
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Event Date',
                      style: TextStyle(
                        height: 0.0,
                        fontFamily: 'Cosffira',
                        fontSize: size.width * 0.048,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffBEC2CC),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.03,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.46,
                        height: size.height * 0.084,
                        child: TextField(
                          style: TextStyle(
                            fontFamily: 'Cosffira',
                            fontSize: size.width * 0.040,
                            fontWeight: FontWeight.normal,
                            color: const Color.fromARGB(255, 37, 40, 50),
                          ),
                          cursorColor: const Color(0xffA26874),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xff4A5E7C),
                              ),
                              borderRadius: BorderRadius.circular(size.width *
                                  0.067), // Same as the container's border radius
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xffA26874),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(size.width * 0.067),
                              ),
                            ),
                            // Background color
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      IconButton(
                        icon: Image.asset(
                          'assets/icons/add_event_page_icons/event-calender-date-note-svgrepo-com.png',
                          width: size.width * 0.118,
                          height: size.height * 0.1,
                        ),
                        onPressed: () {
                          setState(() {
                            customType = false;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SfDateRangePicker(
                yearCellStyle: DateRangePickerYearCellStyle(
                  textStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.050,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4A5E7C),
                  ),
                  todayTextStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffA26874),
                  ),
                ),
                selectionColor: const Color(0xffA26874),
                selectionTextStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 255, 255, 255)),
                monthCellStyle: DateRangePickerMonthCellStyle(
                  textStyle: TextStyle(
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.040,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey),
                  todayTextStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffA26874),
                  ),
                ),
                headerStyle: DateRangePickerHeaderStyle(
                  textAlign: TextAlign.left,
                  textStyle: TextStyle(
                    fontFamily: 'Cosffira',
                    fontSize: size.width * 0.055,
                    fontWeight: FontWeight.normal,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  backgroundColor: const Color(0xffA26874),
                ),
                showActionButtons: true,
                todayHighlightColor: const Color(0xffffffff),
                backgroundColor: const Color(0xffffffff),
                view: DateRangePickerView.month,
                monthViewSettings:
                    const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            // Align buttons at the ends
            children: [
              ElevatedButton(
                onPressed: () {
                  // Action for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffB5C0D0),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.028,
                    vertical: size.height * 0.025,
                  ), // Adjust the padding as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        26.0), // Set the border radius of the button
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.06,
                    right: size.width * 0.06,
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for the button
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA26874),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.028,
                    vertical: size.height * 0.025,
                  ), // Adjust the padding as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        26.0), // Set the border radius of the button
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.06,
                    right: size.width * 0.06,
                  ),
                  child: Text(
                    'Finish',
                    style: TextStyle(
                      height: 0.0,
                      fontFamily: 'Cosffira',
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
