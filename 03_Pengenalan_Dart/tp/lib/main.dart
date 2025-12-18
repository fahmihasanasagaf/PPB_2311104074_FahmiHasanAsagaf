// Fungsi perkalian dua angka
// int kali(int a, int b) {
// return a * b;
// }

// void main() {
// int angka1 = 5;
// int angka2 = 4;

// int hasil = kali(angka1, angka2);

// print("Angka pertama: $angka1");
// print("Angka kedua: $angka2");
// print("Hasil perkalian: $hasil");
// }

void main() {
  // Perulangan for
  int jumlahFor = 0;
  for (int i = 1; i <= 10; i++) {
    jumlahFor += i;
  }
  print("Jumlah bilangan 1 sampai 10 dengan for: $jumlahFor");

  // Perulangan while
  int jumlahWhile = 0;
  int j = 1;
  while (j <= 10) {
    jumlahWhile += j;
    j++;
  }
  print("Jumlah bilangan 1 sampai 10 dengan while: $jumlahWhile");
}
