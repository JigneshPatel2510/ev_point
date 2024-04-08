import 'package:ev_point/tab/account%20tab/paymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Booking extends StatefulWidget {
  final dynamic stationDetails;
  final dynamic vehicleDetails;
  final dynamic chargerDetails;

  const Booking(
      {super.key,
      this.stationDetails,
      this.vehicleDetails,
      this.chargerDetails});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController timeinput = TextEditingController();
  TextEditingController selectdate = TextEditingController();
  String duration = "";
  Map<String, dynamic> bookingDetails = {};

  @override
  void initState() {
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text("Booking",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Select Date",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade200)),
                child: CalendarDatePicker(

                  initialDate: DateTime.now(),
                  firstDate: DateTime(2019),
                  lastDate: DateTime(2030),
                  onDateChanged: (value) {
                    selectdate.text = getDateInFormat(value);
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Select Arrival Time",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              TextField(
                readOnly: true,
                controller: timeinput,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  if (pickedTime != null) {
                    setState(() {
                      timeinput.text = pickedTime
                          .format(context); //set the value of text field.
                    });
                  } else {

                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Time is not selected")));
                  }
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    suffixIcon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 30,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Select Charging Duration",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(
                      value: 15,
                      child: Text(
                        '15 Mins',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                  DropdownMenuItem(
                      value: 30,
                      child: Text(
                        '30 Mins',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                  DropdownMenuItem(
                      value: 45,
                      child: Text(
                        '45 Mins',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                  DropdownMenuItem(
                      value: 60,
                      child: Text(
                        '1 Hour',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                  DropdownMenuItem(
                      value: 90,
                      child: Text(
                        '1/2 Hour',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                  DropdownMenuItem(
                      value: 120,
                      child: Text(
                        '2 Hours',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      )),
                ],
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
                onChanged: (value) {
                  // debugPrint(value);
                  duration = value.toString();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                    Text(
                        "You can only book available times. Unavailable \ntime means someone else have booked it.")
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            bookingDetails = {
              "date": selectdate.text,
              "time": timeinput.text,
              "duration": duration
            };




            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentMethod(
                    stationDetails: widget.stationDetails,
                    vehicleDetails: widget.vehicleDetails,
                    chargerDetails: widget.chargerDetails,
                    bookingDetails: bookingDetails,
                  ),
                ));

            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => ReviewSummary(
            //           stationDetails: widget.stationDetails,
            //           vehicleDetails: widget.vehicleDetails,
            //           chargerDetails: widget.chargerDetails,
            //           bookingDetails: bookingDetails),
            //     ));
          },
          child: Material(
            borderRadius: BorderRadius.circular(25),
            child: Container(
                height: 50,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                    child: Text("Continue",
                        style: TextStyle(color: Colors.white)))),
          ),
        ),
      ),
    );
  }

  String getDateInFormat(date) {
    return DateFormat('MMM,dd yyyy').format(date);
  }
}
