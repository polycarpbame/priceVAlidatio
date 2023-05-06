import 'dart:io';
// ignore: unused_import
import 'dart:math';
import 'dart:convert';
import 'validator.dart';

void main() async {
  Future<List<dynamic>> readJsonFileAgent(String filePath) async {
    var input = await File(filePath).readAsString();
    var data = jsonDecode(input);
    //print(data[0]['first_name']);
    return data;
  }

  Future<List<dynamic>> readJsonFileOwner(String filePath) async {
    var input = await File(filePath).readAsString();
    var data = jsonDecode(input);
    //print(data[0]['first_name']);
    //print(data[0]['latitude']);
    return data;
  }

// a = sin²(Δlat/2) + cos(lat1) * cos(lat2) * sin²(Δlon/2)
// c = 2 * atan2( √a, √(1−a) )
// d = R * c

// ignore: unused_element

  TrashValidate.distance(
      Latitude1: 10.7408000000003,
      Latitude2: 10.791590000000042,
      Longitude1: 6.471850000000074,
      Longitude2: 6.4261600000000385);
  // print('''Enter the volume of your Trash
  // bucket for volumnn of 30
  // trash bag for a volumn of 35
  // wheelbarrow fro a volumn of 100
  // ''');
  // stdout.write('>> ');
  // String volumn = stdin.readLineSync() ?? "";
  // if (volumn.toUpperCase() == 'BUCKET' ||
  //     volumn.toUpperCase() == 'TRASH BAG' ||
  //     volumn.toUpperCase() == 'WHEELBARROW') {
  //   stdout.write('Enter number of ${volumn}s: ');
  //   dynamic numberOf = stdin.readLineSync();
  //   numberOf = int.parse(numberOf);
  //   print(TrashValidate.calTotalPrice(
  //       container: volumn.toLowerCase(), numberOf: numberOf));
  //   TrashValidate ntrash = new TrashValidate(
  //     numberOf: numberOf,
  //   );

  //   stdout.write("Do you wanner bit the price (y/n): ");
  //   String respond = stdin.readLineSync() ?? '';
  //   if (respond.toUpperCase() == 'Y') {
  //     stdout.write('Enter your privce: ');
  //     dynamic myPrice = stdin.readLineSync();
  //     myPrice = int.parse(myPrice);
  //     print(ntrash.bitPrice(container: volumn.toLowerCase(), price: myPrice));
  //   } else if (respond.toUpperCase() == 'N') {
  //     print('Price confirmed');
  //   }
  //   print(ntrash.TotallVolumn(volumn.toLowerCase()));
  // }
  //jsondata();
  Future<List> Owner = readJsonFileOwner('owner.json');
  var ownerResolved = await Owner;
  print(ownerResolved[0]['first_name']);

  Future<List> Agent = readJsonFileAgent('angent.json');
}
