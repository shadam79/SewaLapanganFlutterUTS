import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:sewalapangan/helper.dart';

class BookingForm extends StatefulWidget {
  final String namaLapangan;
  final String hargaLapangan;
  const BookingForm(
      {super.key, required this.namaLapangan, required this.hargaLapangan});

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _phoneNumber;
  late String _date;
  late String _time;
  late String _field;
  late String _additionalNotes;
  TimeOfDay? selectedTime;
  TimeOfDay? endSelectedTime;
  DateTime? _selectedDate;
  String _formattedDate = '';
  TextDirection textDirection = TextDirection.ltr;
  Helper helper = Helper();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _formattedDate = intl.DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectHour(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input, // Set entry mode to input
    );

    if (pickedTime != null) {
      // Create a new TimeOfDay object with minutes set to zero
      TimeOfDay selectedHour = TimeOfDay(hour: pickedTime.hour, minute: 0);
      setState(() {
        selectedTime = selectedHour;
      });
    }
  }
    Future<void> _selectEndHour(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: endSelectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input, // Set entry mode to input
    );

    if (pickedTime != null) {
      // Create a new TimeOfDay object with minutes set to zero
      TimeOfDay selectedHour = TimeOfDay(hour: pickedTime.hour, minute: 0);
      setState(() {
        endSelectedTime = selectedHour;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking Form'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 350,
                          height: 200,
                          child: Image.asset(
                            "assets/images/lapangan/lapangan.webp",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(widget.namaLapangan,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(helper.toRupiah(widget.hargaLapangan),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.normal)),
                            Text(" / Jam",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.normal))
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 20,
                      thickness: 2,
                    ),
                    GestureDetector(
                      onTap: () async {
                        _selectDate(context);
                      },
                      child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(children: [
                                      _selectedDate != null
                                          ? Text("${_formattedDate}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800,
                                                  fontWeight:
                                                      FontWeight.normal))
                                          : Text("Select Date",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800,
                                                  fontWeight:
                                                      FontWeight.normal))
                                    ]))
                              ])),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        _selectHour(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  selectedTime != null
                                      ? Text("${selectedTime?.hour}:00",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.normal))
                                      : Text("Start Hour",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.normal))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        _selectEndHour(context);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  endSelectedTime != null
                                      ? Text("${endSelectedTime?.hour}:00",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.normal))
                                      : Text("End Hour",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.normal))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedTime == null) {
                            // Show an error message if time is not selected.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please select a time.'),
                            ));
                            return;
                          }

                          DateTime selectedDate = DateTime.parse(
                              _date); // Assuming _date is in a valid format

                          // Check if the selected date is before the current date.
                          if (selectedDate.isBefore(DateTime.now())) {
                            // Show an error message if the selected date is in the past.
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please select a  date.'),
                            ));
                            return;
                          }

                          // Now you can use the selected date and time for further processing.
                          // For example, you can send the data to an API, save it to a database, etc.
                          // Perform your booking logic here.
                          // _name, _phoneNumber, _date, _time, _field, and _additionalNotes contain the user input values.
                        }
                      },
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
