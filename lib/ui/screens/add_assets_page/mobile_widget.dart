import 'package:flutter/material.dart';
import 'package:savetosafe/core/utils/constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  String dropdownValue = Constants.assetsMobilityTypes[0];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Text('Mobile:'),
                    Row(
                      children: [
                        Text('Typ:'),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Auto',
                              'Mobile wagen',
                              'Motorrad',
                              'Fahrrad'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Text('Select Item'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Marke:'),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Auto',
                              'Mobile wagen',
                              'Motorrad',
                              'Fahrrad'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Text('Select Item'),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                    TextField(
                      decoration:
                          InputDecoration(labelText: 'Fahrzeugsschein-Nummer'),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: Constants.padding,
        //   right: Constants.padding,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: Constants.avatarRadius,
        //     child: ClipRRect(
        //         borderRadius:
        //             BorderRadius.all(Radius.circular(Constants.avatarRadius)),
        //         child: Image.asset("assets/model.jpeg")),
        //   ),
        // ),
      ],
    );
  }
}
