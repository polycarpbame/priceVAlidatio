import 'dart:io';

void main() {
  print('''Enter the volume of your Trash
  bucket for volumnn of 30
  trash bag for a volumn of 35
  wheelbarrow fro a volumn of 100
  ''');
  stdout.write('>> ');
  String volumn = stdin.readLineSync() ?? "";
  if (volumn.toUpperCase() == 'BUCKET' ||
      volumn.toUpperCase() == 'TRASH BAG' ||
      volumn.toUpperCase() == 'WHEELBARROW') {
    stdout.write('Enter number of ${volumn}s: ');
    dynamic numberOf = stdin.readLineSync();
    numberOf = int.parse(numberOf);
    print(TrashVolume.calTotalPrice(container: volumn, numberOf: numberOf));
    TrashVolume ntrash = new TrashVolume(
      numberOf: numberOf,
    );

    stdout.write("Do you wanner bit the price (y/n): ");
    String respond = stdin.readLineSync() ?? '';
    if (respond.toUpperCase() == 'Y') {
      stdout.write('Enter your privce: ');
      dynamic myPrice = stdin.readLineSync();
      myPrice = int.parse(myPrice);
      print(ntrash.bitPrice(container: volumn, price: myPrice));
    } else if (respond.toUpperCase() == 'N') {
      print('Price confirmed');
    }
    print(ntrash.TotallVolumn(volumn));
  }
}

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

class TrashVolume {
  var thresholdVolumn = 1500;

  final numberOf;
  TrashVolume({this.numberOf});
  TotallVolumn(container) {
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
}
