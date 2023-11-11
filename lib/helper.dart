import "package:intl/intl.dart" as intl;
class Helper  {
int toNumber(String number){
   int num = int.parse(number);
    return num;
}
String toRupiah(String jumlah){
      String formattedCurrency = intl.NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ').format(toNumber(jumlah));
      return formattedCurrency;
}

int jamToHarga(String start, String end, String harga){
  DateTime startDate = intl.DateFormat("HH:mm").parse(start);
  DateTime endDate = intl.DateFormat("HH:mm").parse(end);
  Duration diff = endDate.difference(startDate);
  int total = diff.inHours;
  int totalHarga = total * toNumber(harga);
  return totalHarga;

}

}