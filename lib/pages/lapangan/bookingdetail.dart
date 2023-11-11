import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sewalapangan/helper.dart';

class BookingDetail extends StatefulWidget {
  final String namaLapangan;
  final String harga;
  final String tanggal;
  final String startTime;
  final String endTime;
  final String status;
  final String id;
  const BookingDetail(
      {super.key,
      required this.id,
      required this.namaLapangan,
      required this.harga,
      required this.tanggal,
      required this.startTime,
      required this.endTime,
      required this.status});

  @override
  State<BookingDetail> createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  Helper helper = Helper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Booking Detail #${widget.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text('Tanggal: '),
                Text(widget.tanggal),
              ],
            ),
            Row(
              children: [
                Text('Jam: '),
                Text("${widget.startTime} - ${widget.endTime}"),
              ],
            ),
            Row(children: [
              Text('Harga: '),
              Text(helper.toRupiah("${helper.jamToHarga(widget.startTime, widget.endTime, widget.harga)}")),
            ],),
            Row(
              children: [
                Text('Status: '),
                //if confirmed color blue if done color green if waiting color yellow
                if (widget.status == "confirmed")
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Confirmed',
                        style: TextStyle(color: Colors.white),
                      )),
                if (widget.status == "done")
                  const Text(
                    'Done',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                if (widget.status == "waiting")
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Waiting for payment',
                        style: TextStyle(color: Colors.black),
                      )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            if (widget.status == "waiting")
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      launchUrl(Uri.parse("https://api.whatsapp.com/send/?phone=6288809364009&text=Halo%20Saya%20ingin%20Membayar%20booking%20dengan%20id%20%2A${widget.id}%2A%20Berjumlah:%0d%0a%2A${helper.toRupiah("${helper.jamToHarga(widget.startTime, widget.endTime, widget.harga)}")}%2A&type=phone_number&app_absent=0"));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Bayar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
