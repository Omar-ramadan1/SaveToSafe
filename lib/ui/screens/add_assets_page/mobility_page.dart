import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:savetosafe/core/utils/constants.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';

class MobilityWidget extends StatefulWidget {
  @override
  _MobilityWidgetState createState() => _MobilityWidgetState();
}

class _MobilityWidgetState extends State<MobilityWidget> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  String? dropDownValue1;

  @override
  void initState() {
    super.initState();
    dropDownValue1 = Constants.assetsMobilityTypes[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  'Mobile',
                  // style: FlutterFlowTheme.bodyText1.override(
                  //   fontFamily: 'Poppins',
                  //   fontSize: 18,.0
                  // ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Type',
                      // style: FlutterFlowTheme.bodyText1.override(
                      //   fontFamily: 'Poppins',
                      // ),
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropDownValue1,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      //_incrementCounter(newValue);
                      log('Changed!');
                      setState(() {
                        dropDownValue1 = newValue;
                      });
                    },
                    items: Constants.assetsMobilityTypes
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              CustomTextFormWidget(
                textController: textController1,
                labelText: 'Mark',
              ),
              CustomTextFormWidget(
                textController: textController2,
                labelText: 'Registration-number',
              ),
              InkWell(
                child: Text('Press me'),
                onTap: () {
                  print('${textController1.text},  ${textController2.text}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
