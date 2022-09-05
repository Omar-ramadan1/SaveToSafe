import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:savetosafe/core/model/medical_appointment.dart';
import 'package:savetosafe/core/model/medicines.dart';
import 'package:savetosafe/core/service/appointment_api_service.dart';
import 'package:savetosafe/core/service/medicine_api_service.dart';
import 'package:savetosafe/core/utils/globals.dart';
import 'package:savetosafe/generated/l10n.dart';
import 'package:savetosafe/ui/widgets/custom_text_form_widget.dart';

class AddRemindersPage extends StatefulWidget {
  const AddRemindersPage({Key? key}) : super(key: key);
  static const String route = "add_reminder";

  @override
  _AddRemindersPageState createState() => _AddRemindersPageState();
}

class _AddRemindersPageState extends State<AddRemindersPage> {
  List<MedicalAppointment> appointmentsList = [];
  List<Medicine> medicinesList = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    MedicalAppointmentAPIService(context).get().then((appointments) {
      appointmentsList = [];
      appointments.forEach((a) {
        appointmentsList.insertAll(0, [a]);
      });
      setState(() {});
    });
    MedicineAPIService(context).get().then((medicines) {
      medicinesList = [];
      medicines.forEach((m) {
        //TODO check if insert at 0 is necessary
        medicinesList.insertAll(0, [m]);
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).reminderPageTitle),
        actions: [
          IconButton(
            onPressed: () async {
              print(
                  await FirebaseAuth.instance.currentUser?.getIdTokenResult());
            },
            icon: Icon(Icons.ac_unit),
          ),
        ],
      ),
  
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              medicineWidget(context),
              medicalAppointmentWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget medicineWidget(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).reminderPageMedicine,
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  medicineDialog(context).then((value) {
                    setState(() {});
                  });
                },
              ),
            ],
          ),
          ...medicinesList
              .asMap()
              .entries
              .map((e) => medicineTile(e.value, e.key, context)),
        ],
      ),
    );
  }

  Widget medicineTile(Medicine medicine, int index, BuildContext context) {
    return ExpansionTile(
      key: GlobalKey(),
      title: Text("${medicine.name}"),
      subtitle: Text(
        S.of(context).reminderPageMedicineRepetitionType +
            " ${S.of(context).reminderPageMedicineRepetitionTypeValue(medicine.repetition.toString().split(".")[1])}",
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: EdgeInsets.symmetric(horizontal: 30),
      children: [
        if (medicine.repetition == Repetition.daily)
          Text(
              "${S.of(context).reminderPageMedicineRepetition}: ${medicine.repetitionTime}"),
        if (medicine.repetition == Repetition.weekly)
          Text(
              "${S.of(context).reminderPageMedicineRepetition}: ${medicine.repetitionDays}"),
        if (medicine.repetition == Repetition.monthly)
          Text(
              "${S.of(context).reminderPageMedicineRepetition}: ${medicine.repetitionDates}"),
        Text(
            "${S.of(context).reminderPageMedicineRepetitionCount}: ${medicine.numberOfRepetition}"),
        Text("${S.of(context).reminderPageCreatedAt}: ${medicine.createdAt}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Text(
                S.of(context).reminderPageDelete,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                bool wasSuccess =
                    await MedicineAPIService(context).delete(medicine.id!);
                if (wasSuccess) {
                  setState(() {
                    medicinesList.removeAt(index);
                  });
                }
              },
            ),
            TextButton(
              child: Text(S.of(context).reminderPageEdit),
              onPressed: () {
                medicineDialog(context, medicine: medicine, index: index)
                    .then((value) {
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Future medicineDialog(BuildContext context,
      {Medicine? medicine, int? index}) {
    final TextEditingController nameController =
        TextEditingController(text: medicine?.name);
    final TextEditingController repDataController = TextEditingController();
    final TextEditingController repCountController = TextEditingController(
      text: medicine?.numberOfRepetition.toString(),
    );
    GlobalKey<FormState> key = GlobalKey<FormState>();
    assert((medicine != null && index != null) ||
        (medicine == null && index == null));
    Repetition repetition = medicine?.repetition ?? Repetition.daily;

    if (medicine != null) {
      switch (repetition) {
        case Repetition.daily:
          medicine.repetitionTime.forEach((element) {
            repDataController.text += element + ",";
          });
          repDataController.text = repDataController.text
              .substring(0, repDataController.text.length - 1);
          break;
        case Repetition.weekly:
          medicine.repetitionDays.forEach((element) {
            repDataController.text += element.substring(0, 3) + ",";
          });
          repDataController.text = repDataController.text
              .substring(0, repDataController.text.length - 1);

          break;
        case Repetition.monthly:
          medicine.repetitionDates.forEach((element) {
            repDataController.text += element.toString() + ",";
          });
          repDataController.text = repDataController.text
              .substring(0, repDataController.text.length - 1);

          break;
      }
    }

    return showDialog(
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: Text(S.of(context).reminderPageMedicineAdd),
              contentPadding: EdgeInsets.all(24),
              children: [
                Form(
                  key: key,
                  child: Column(
                    children: [
                      CustomTextFormWidget(
                        textController: nameController,
                        labelText: S.of(context).reminderPageMedicineName,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return S.of(context).reminderPageMedicineNameError;
                          }
                        },
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText:
                              S.of(context).reminderPageMedicineRepetitionType,
                        ),
                        value: repetition,
                        items: Repetition.values
                            .map(
                              (r) => DropdownMenuItem(
                                child: Text(S
                                    .of(context)
                                    .reminderPageMedicineRepetitionTypeValue(
                                        r.toString())),
                                value: r,
                              ),
                            )
                            .toList(),
                        onChanged: (Repetition? value) {
                          setState(() {
                            repetition = value!;
                            repDataController.text = "";
                          });
                        },
                      ),
                      CustomTextFormWidget(
                        textController: repCountController,
                        labelText:
                            S.of(context).reminderPageMedicineRepetitionCount,
                        textInputType: TextInputType.number,
                        validator: (value) {
                          value = value == "" ? "0" : value;
                          if (double.parse(value ?? "0") < 1) {
                            return S
                                .of(context)
                                .reminderPageMedicineRepetitionCountError;
                          }
                        },
                      ),
                      if (repetition == Repetition.daily)
                        CustomTextFormWidget(
                          textController: repDataController,
                          labelText:
                              S.of(context).reminderPageMedicineRepetition,
                          hintText: "Eg.  08:00, 13:00, 20:30",
                          validator: (value) {
                            if (value?.isEmpty ?? true)
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionTimesError;

                            List<String> inputs = value?.split(",") ?? [];
                            if (!inputs.every((element) {
                              if (!element.contains(":")) return false;
                              var hour = int.tryParse(element.split(":")[0]);
                              var min = int.tryParse(element.split(":")[1]);
                              if (hour == null || min == null) return false;
                              if ((hour >= 0 && hour < 24) &&
                                  (min >= 0 && min < 60)) return true;
                              return false;
                            })) {
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionTimesError;
                            }
                          },
                        ),
                      if (repetition == Repetition.weekly)
                        CustomTextFormWidget(
                          textController: repDataController,
                          labelText:
                              S.of(context).reminderPageMedicineRepetition,
                          hintText: "Eg.  sun, wed, fri",
                          validator: (value) {
                            if (value?.isEmpty ?? true)
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionDaysError;

                            List<String> inputs = value?.split(",") ?? [];
                            if (!inputs.every((element) =>
                                Globals.weekDays.containsKey(element.trim()))) {
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionDaysError;
                            }
                          },
                        ),
                      if (repetition == Repetition.monthly)
                        CustomTextFormWidget(
                          textController: repDataController,
                          labelText:
                              S.of(context).reminderPageMedicineRepetition,
                          textInputType: TextInputType.number,
                          hintText: "Eg.  7, 14, 21",
                          validator: (value) {
                            value = value == "" ? "0" : value;
                            if (value?.isEmpty ?? true)
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionDatesError;

                            List<String> inputs = value?.split(",") ?? [];

                            if (!inputs.every((element) {
                              if (element == "") return false;
                              return double.parse(element).floor() >= 1 &&
                                  double.parse(element).floor() <= 31;
                            })) {
                              return S
                                  .of(context)
                                  .reminderPageMedicineRepetitionDatesError;
                            }
                          },
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(S.of(context).reminderPageAppointmentSave),
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      if (medicine != null) {
                        List<int> dates = [];
                        List input = repDataController.text.split(",");
                        for (int i = 0; i < input.length; i++) {
                          dates.add(int.parse(input[i]));
                        }
                        Medicine a = await MedicineAPIService(context).update(
                          Medicine(
                            id: medicine.id,
                            name: nameController.text,
                            numberOfRepetition:
                                int.parse(repCountController.text),
                            repetition: repetition,
                            repetitionDates:
                                repetition == Repetition.monthly ? dates : [],
                            repetitionDays: repetition == Repetition.weekly
                                ? repDataController.text.split(",")
                                : [],
                            repetitionTime: repetition == Repetition.daily
                                ? repDataController.text.split(",")
                                : [],
                          ),
                        );
                        Navigator.of(context).pop();
                      } else {
                        List<int> dates = [];
                        List input = repDataController.text.split(",");
                        for (int i = 0; i < input.length; i++) {
                          dates.add(int.parse(input[i]));
                        }
                        Medicine a = await MedicineAPIService(context).create(
                          Medicine(
                            name: nameController.text,
                            numberOfRepetition:
                                int.parse(repCountController.text),
                            repetition: repetition,
                            repetitionDates:
                                repetition == Repetition.monthly ? dates : [],
                            repetitionDays: repetition == Repetition.weekly
                                ? repDataController.text.split(",")
                                : [],
                            repetitionTime: repetition == Repetition.daily
                                ? repDataController.text.split(",")
                                : [],
                          ),
                        );
                        medicinesList.insert(0, a);
                      }
                      // Navigator.of(context).pop();
                    } else {
                      print("NOT Valid");
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget medicalAppointmentWidget(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).reminderPageAppointment,
                style: Theme.of(context).textTheme.headline5,
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  medicalAppointmentDialog(context).then((value) {
                    setState(() {});
                  });
                },
              ),
            ],
          ),
          ...appointmentsList
              .asMap()
              .entries
              .map((e) => medicalAppointmentTile(e.value, e.key, context)),
        ],
      ),
    );
  }

  Widget medicalAppointmentTile(
      MedicalAppointment appointment, int index, BuildContext context) {
    return ExpansionTile(
      key: GlobalKey(),
      title: Text(
        "${appointment.name}",
      ),
      subtitle: Text(
        "${S.of(context).reminderPageAppointmentDate}: ${DateFormat.MMMd().format(appointment.date)} ${DateFormat.jm().format(appointment.date)}",
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      childrenPadding: EdgeInsets.symmetric(horizontal: 30),
      children: [
        Text(
          "${S.of(context).reminderPageCreatedAt}: ${DateFormat.yMMMd().add_jm().format(appointment.createdAt!)}",
          style: Theme.of(context).textTheme.caption,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              child: Text(
                S.of(context).reminderPageDelete,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                var wasSuccess = await MedicalAppointmentAPIService(context)
                    .delete(appointment.id!);
                if (wasSuccess) {
                  setState(() {
                    appointmentsList.removeAt(index);
                  });
                }
              },
            ),
            TextButton(
              child: Text(S.of(context).reminderPageEdit),
              onPressed: () {
                medicalAppointmentDialog(context,
                        appointment: appointment, index: index)
                    .then((value) {
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Future medicalAppointmentDialog(
    BuildContext contex, {
    MedicalAppointment? appointment,
    int? index,
  }) {
    final TextEditingController nameController =
        TextEditingController(text: appointment?.name);
    DateTime dateTimeController =
        appointment?.date ?? DateTime.now().add(Duration(hours: 1));
    GlobalKey<FormState> key = GlobalKey<FormState>();
    assert((appointment != null && index != null) ||
        (appointment == null && index == null));

    return showDialog(
      context: context,
      builder: (builder) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: Text(S.of(context).reminderPageAppointmentAdd),
              contentPadding: EdgeInsets.all(24),
              children: [
                Form(
                  key: key,
                  child: CustomTextFormWidget(
                    textController: nameController,
                    labelText: S.of(context).reminderPageAppointmentName,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return S.of(context).reminderPageAppointmentNameError;
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        showDatePicker(
                          context: context,
                          locale: Locale(Intl.getCurrentLocale()),
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 90)),
                        ).then((date) {
                          setState(() {
                            dateTimeController = date ?? DateTime.now();
                          });
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    Text(DateFormat.yMMMd().format(dateTimeController)),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.alarm),
                      onPressed: () async {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: dateTimeController.hour,
                            minute: dateTimeController.minute,
                          ),
                        ).then((time) {
                          setState(() {
                            dateTimeController = DateTime(
                              dateTimeController.year,
                              dateTimeController.month,
                              dateTimeController.day,
                              time?.hour ?? 0,
                              time?.minute ?? 0,
                            );
                          });
                        });
                      },
                    ),
                    SizedBox(width: 15),
                    Text(
                      DateFormat.jm().format(dateTimeController),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text(S.of(context).reminderPageAppointmentSave),
                  onPressed: () async {
                    if (key.currentState!.validate()) {
                      if (appointment != null) {
                        appointmentsList[index!] =
                            await MedicalAppointmentAPIService(context).update(
                          MedicalAppointment(
                            id: appointment.id,
                            name: nameController.text,
                            date: dateTimeController,
                          ),
                        );
                      } else {
                        MedicalAppointment a =
                            await MedicalAppointmentAPIService(context).create(
                          MedicalAppointment(
                            name: nameController.text,
                            date: dateTimeController,
                          ),
                        );
                        appointmentsList.insert(0, a);
                      }
                      Navigator.of(context).pop();
                    } else {
                      print("NOT Valid");
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
