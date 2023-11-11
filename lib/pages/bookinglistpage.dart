import 'package:flutter/material.dart';
import 'package:sewalapangan/pages/lapangan/bookingdetail.dart';
import 'package:sewalapangan/helper.dart';

class BookingListPage extends StatefulWidget {
  const BookingListPage({super.key});

  @override
  State<BookingListPage> createState() => _BookingListPageState();
}

class _BookingListPageState extends State<BookingListPage> {
  Helper helper = Helper();

  List<Map<String, String>> lapanganList = [
    {
      "nama": "Lapangan 1",
      "harga": "100000",
      "tanggal": "12/11/2023",
      "start_time": "12:00",
      "end_time": "14:00",
      "status": "confirmed",
    },
    {
      "nama": "Lapangan 2",
      "harga": "100000",
      "tanggal": "8/11/2023",
      "start_time": "10:00",
      "end_time": "11:00",
      "status": "done",
    },
    {
      "nama": "Lapangan 3",
      "harga": "100000",
      "tanggal": "11/11/2023",
      "start_time": "17:00",
      "end_time": "18:00",
      "status": "waiting",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const <Widget>[
                      Text(
                        'Booking History',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'List Lapangan :',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              const Divider(
                height: 20,
                thickness: 2,
                indent: 0,
                endIndent: 0,
              ),

              //container for List Lapangan listview scrollable
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      //loop through listLapangan
                      for (var i = 0; i < lapanganList.length; i++) ...[
                        Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 56.0),
                            title: Row(children: [
                              Text(
                                "${lapanganList[i]["nama"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              if (lapanganList[i]["status"] == "confirmed") ...[
                                Icon(
                                  Icons.check,
                                  color: Colors.lightGreen,
                                ),
                              ] else if(lapanganList[i]["status"] == "done") ...[
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  semanticLabel: "done",
                                  
                                ),
                              ] else if(lapanganList[i]["status"] == "waiting") ...[
                                Icon(
                                  Icons.payment,
                                  color: Colors.yellow,
                                ),
                              ],
                            ]),
                            subtitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${lapanganList[i]["tanggal"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${lapanganList[i]["start_time"]} - ${lapanganList[i]["end_time"]}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 40,
                              child: TextButton(
                                  onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>   BookingDetail(
                                            id: "$i",
                                            namaLapangan: "${lapanganList[i]["nama"]!}",
                                            harga: "${lapanganList[i]["harga"]!}",
                                            tanggal: "${lapanganList[i]["tanggal"]}",
                                            startTime: "${lapanganList[i]["start_time"]}",
                                            endTime: "${lapanganList[i]["end_time"]}",
                                            status: "${lapanganList[i]["status"]}",
                                          ),
                                        ),
                                      ),
                                  child: Icon(Icons.calendar_month)),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
