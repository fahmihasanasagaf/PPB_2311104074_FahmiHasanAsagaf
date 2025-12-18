import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write('Masukkan sebuah bilangan: ');
  String? input = stdin.readLineSync();
  int? bilangan = int.tryParse(input ?? '');

  if (bilangan == null) {
    print('Input tidak valid.');
    return;
  }

  // Cek apakah bilangan prima
  if (apakahPrima(bilangan)) {
    print('Bilangan prima');
  } else {
    print('Bukan bilangan prima');
  }
}

bool apakahPrima(int n) {
  if (n <= 1) return false; // 0 dan 1 bukan bilangan prima
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false; // ada pembagi selain 1 dan dirinya
  }
  return true;
}
