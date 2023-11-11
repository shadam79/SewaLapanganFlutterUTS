import 'package:flutter/material.dart';
import 'package:sewalapangan/pages/lapangan/formbooking.dart';
import "package:intl/intl.dart" as intl;
import 'package:sewalapangan/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Helper helper = Helper();

  List<Map<String, String>> lapanganList = [
    {
      "nama": "Lapangan 1",
      "harga": "100000",
    },
    {
      "nama": "Lapangan 2",
      "harga": "100000",
    },
    {
      "nama": "Lapangan 3",
      "harga": "100000",
    },
    {
      "nama": "Lapangan 4",
      "harga": "100000",
    },
    {
      "nama": "Lapangan 5",
      "harga": "100000",
    },
    {
      "nama": "Lapangan 6",
      "harga": "100000",
    }
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
                        'Selamat Datang',
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
                            title: Text("${lapanganList[i]["nama"]}"),
                            subtitle: Text(
                                helper.toRupiah(lapanganList[i]['harga']!)),
                            trailing: TextButton(
                                onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BookingForm(
                                          namaLapangan:
                                              lapanganList[i]["nama"]!,
                                          hargaLapangan:
                                              lapanganList[i]["harga"]!,
                                        ),
                                      ),
                                    ),
                                child: Icon(Icons.calendar_month)),
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
