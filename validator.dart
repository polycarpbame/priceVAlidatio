import 'dart:io';
// ignore: unused_import
import 'dart:math';
import 'dart:convert';

// Future<void> jsondata() async {
//   File file = new File('angent.json');
//   String content = await file.readAsString();
//   Map<String, dynamic> data = jsonDecode(content);
//   print(data['agent_id']);
// }

dynamic category = [
  {'category': 'papers', 'deducePecentage': 0.7},
  {'category': 'food', 'deducePecentage': 0.8},
  {'category': 'glass', 'deducePecentage': 0.9},
];

dynamic infors = [
  {'name': 'bucket', 'volumn': 30, 'price': 250},
  {'name': 'trash bag', 'volumn': 35, 'price': 300},
  {'name': 'wheelbarrow', 'volumn': 100, 'price': 500}
];

class TrashValidate {
  var thresholdVolumn = 1500;

  final numberOf;
  TrashValidate({this.numberOf});
  TotallVolumn(container) {
    //var container = container
    for (var items in infors) {
      if (items['name'] == container) {
        var totalVolumn = items['volumn'] * this.numberOf;
        if (totalVolumn > thresholdVolumn) {
          return 'This owner is a business';
        }
        return 'Total volume ' + totalVolumn.toString();
      }
    }
  }

  static calTotalPrice({container, numberOf}) {
    for (var items in infors) {
      if (items['name'] == container) {
        var totalPrice = items['price'] * numberOf;
        return 'your price is $totalPrice';
      }
      return 'you did somthing';
    }
  }

  bitPrice({container, price}) {
    for (var items in infors) {
      if (items['name'] == container) {
        var totalPrice = items['price'] * this.numberOf;
        if (price < (totalPrice * 0.7)) {
          return 'your price must at least ${totalPrice * 0.7} and $totalPrice';
        }
        return '$price is okay';
      }
    }
  }

  static distance({Latitude1, Latitude2, Longitude1, Longitude2}) {
    Latitude1 = Latitude1 * (3.14 / 180.0);
    Latitude2 = Latitude2 * (3.14 / 180.0);
    Longitude1 = Longitude1 * (3.14 / 180.0);
    Longitude2 = Longitude2 * (3.14 / 180.0);
    double R = 6371;
    double latitudeDifferece = Latitude2 - Latitude1;
    double longitudeDifferece = Longitude2 - Longitude1;
    double a = pow(sin((latitudeDifferece / 2)), 2) +
        cos(Latitude1) * cos(Latitude2) * pow(sin(longitudeDifferece / 2), 2);
    double sqrtOfA = sqrt(a);
    double n = 1 - sqrtOfA;
    double sqrtOfA_1 = sqrt(n);
    double c = 2 * atan2(sqrtOfA, sqrtOfA_1);
    double distance = R * c;

    return distance;
  }
}
