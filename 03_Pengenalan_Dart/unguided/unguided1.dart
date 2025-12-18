import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write('Masukkan nilai: ');
  String? input = stdin.readLineSync();

  // Ubah input ke tipe int
  int? nilai = int.tryParse(input ?? '');

  // Pastikan nilai tidak null
  if (nilai == null) {
    print('Input tidak valid.');
    return;
  }

  // Panggil fungsi dan cetak hasilnya
  String hasil = cekNilai(nilai);
  if (hasil.isNotEmpty) {
    print('$nilai merupakan $hasil');
  } else {
    print('Nilai tidak valid.');
  }
}

String cekNilai(int nilai) {
  if (nilai > 70) {
    return 'Nilai A';
  } else if (nilai > 40 && nilai <= 70) {
    return 'Nilai B';
  } else if (nilai > 0 && nilai <= 40) {
    return 'Nilai C';
  } else {
    return '';
  }
}
