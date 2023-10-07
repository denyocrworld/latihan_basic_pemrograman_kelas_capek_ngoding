### Latihan
1. Buatlah Project Flutter dengan perintah
```
flutter create tutorial_flutter
cd tutorial_flutter
dart pub get
code .
```

2. Install package dio, gunakan perintah berikut di terminal VsCode
(Ingat step ini tidak wajib dilakukan, hanya untuk latihan menambahkan package baru ke Aplikasi Flutter)
```
dart pub add dio
```

3. Tambahkan kode berikut sebelum main
```
// <<< disini yaa

void main () {
  ...
}
```
```
Future getUsers() async {
  var response = await Dio().get(
    "https://reqres.in/api/users",
      options: Options(
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
  Map obj = response.data;
  return response.data;
}

```

3. Ganti ke platform Android/Web/Windows Desktop
4. Tekan F5, Atur ke Dart/Flutter dan jalankan Aplikasi-nya
5. Jika Aplikasi berjalan tanpa masalah, selamat kamu sudah berhasil membuat project Flutter