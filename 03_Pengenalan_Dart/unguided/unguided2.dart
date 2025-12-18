import 'dart:io';

void main() {
  // Meminta input dari user
  stdout.write('Masukkan tinggi piramida: ');
  String? input = stdin.readLineSync();
  int? tinggi = int.tryParse(input ?? '');

  if (tinggi == null || tinggi <= 0) {
    print('Input tidak valid.');
    return;
  }

  // Loop untuk membuat piramida
  for (int i = 1; i <= tinggi; i++) {
    // Spasi di kiri
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(' ');
    }
    // Bintang di tiap baris
    for (int k = 1; k <= (2 * i - 1); k++) {
      stdout.write('*');
    }
    // Pindah ke baris berikutnya
    print('');
  }
}
