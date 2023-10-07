### Latihan
1. Buatlah Project Dart (Console) dengan perintah berikut:
```
dart create tutorial_dart
cd tutorial_dart
dart pub get
code .
```

2. Tambahkan kode berikut di bin/tutorial_dart.dart
```
void main() {
  String nama = "Deny";
  int umur = 21;
  int jamPerHari = 3;
  int target100Jam = (100 / jamPerHari).ceil();

  int bulanKerja = ((target100Jam + 60) / 30).ceil();

  print("Hello, nama saya $nama");
  print("Umur saya $umur tahun");

  print("---");

  print("Saya akan jadi programmer yang handal");
  print("Untuk itu saya berkomitmen untuk:");

  print("---");

  print("** Ngoding $jamPerHari jam per hari");
  print("** di luar Kelas Online dan melihat Tutorial di YouTube");

  print("---");

  print(
    "Sehingga dalam $target100Jam hari, saya sudah paham Basic Dart dan Flutter",
  );

  print("---");

  print(
    "${target100Jam + (20 / jamPerHari).ceil()} hari saya mulai terbiasa membuat UI di Flutter",
  );
  print(
    "${target100Jam + (30 / jamPerHari).ceil()} hari saya mulai terbiasa mengintegrasikan Flutter dengan API",
  );

  print("---");

  print(
    "${target100Jam + (50 / jamPerHari).ceil()} hari saya sudah punya 10 Portofolio UI, masing2 3-5 halaman saja",
  );

  print(
    "${target100Jam + (70 / jamPerHari).ceil()} hari saya sudah punya 1 Portofolio Full Apps yang terintegrasi dengan API",
  );
  print(
    "${target100Jam + (80 / jamPerHari).ceil()} hari saya sudah menyiapkan CV ATS Friendly yang menerapkan metode STAR",
  );

  print("---");

  print("Saya akan siap bekerja dalam : $bulanKerja bulan");
}

```

3. Jalankan Program Dart dengan perintah:
```
dart bin/tutorial.dart
```

4. Sekarang coba jalankan dengan cara lain (hot-reload), pastikan kamu sudah install NodeJS dan nodemon.
```
dart bin/tutorial.dart
```