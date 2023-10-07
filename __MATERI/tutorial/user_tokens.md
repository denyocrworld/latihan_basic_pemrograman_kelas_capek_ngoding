Baik, mari kita lakukan perubahan tersebut.

**Tutorial Laravel: Migrasi dan CRUD untuk Tabel `user_tokens`**

**0. Ambil credentials.json**
- Buka project Firebase, masuk ke Project Settings.
- Klik tab <b>Cloud Messaging</b>
- Pilih <b>Manage Service Accounts</b>
- Klik <b>Create Service Account</b>
- Isi *Service Account Name* dan klik <b>Create and Continue</b>
- Klik <b>Done</b>
- Klik Service Account yang baru saja dibuat
- Klik tab <b>Keys</b>
- Klik <b>ADD KEY</b>
- Klik <b>Create new key</b>
- Pilih <b>JSON</b>
- Secara otomatis itu akan mendownload file.json
- Copy file itu dan letakkan di root project Laravel
- Rename jadi <b>credentials.json</b>
- Seharusnya file ini satu level dengan composer.json

**1. Migrasi Tabel `user_tokens`**
Buat migrasi untuk tabel `user_tokens`:
```bash
php artisan make:migration create_user_tokens_table
```
Buka file migrasi yang baru saja dibuat di `database/migrations/`:
```php
public function up()
{
    Schema::create('user_tokens', function (Blueprint $table) {
        $table->id();
        $table->integer('user_id'); // Menggunakan integer
        $table->string('token');
        $table->timestamps();

        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });
}
```
Lakukan migrasi:
```bash
php artisan migrate
```

**2. Membuat Model untuk `user_tokens`**
Buat model untuk `user_tokens`:
```bash
php artisan make:model UserToken
```
Buka file model yang baru saja dibuat di `app/Models/UserToken.php`:
```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserToken extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'token'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
```

Dalam model di atas, kita telah mendefinisikan kolom-kolom yang dapat diisi (`$fillable`) serta relasi ke model `User`.

Dengan menambahkan langkah ini, Anda sekarang memiliki model `UserToken` yang siap digunakan bersama dengan migrasi dan controller yang telah Anda buat sebelumnya.

**3. Membuat Endpoint CRUD untuk `user_tokens`**
Buat controller untuk `user_tokens`:
```bash
php artisan make:controller UserTokenController
```
Buka `app/Http/Controllers/UserTokenController.php`:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\UserToken;

class UserTokenController extends Controller
{
    public function index()
    {
        $tokens = UserToken::all();
        return response(['data' => $tokens], 200);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'token' => 'required|string',
        ]);

        $id = request()->user()["id"];
        $data["id_user"] = $id;

        $currentUserToken = UserToken::where("token", $data['token'])->first();
        if (!$currentUserToken) {
            UserToken::create($data);
        }

        return response()->json([], 201);
    }

    public function show(UserToken $token)
    {
        return response(['data' => $token], 200);
    }

    public function update(Request $request, UserToken $token)
    {
        $token->update($request->all());
        return response(['data' => $token], 200);
    }

    public function destroy(UserToken $token)
    {
        $token->delete();   
        return response(['data' => 'Token deleted'], 200);
    }
}
```

**4. Mendaftarkan di `routes/api.php`**
Buka file `routes/api.php` dan tambahkan rute untuk `user_tokens`:
```php
// routes/api.php

Route::middleware('auth:sanctum')->group(function () {
    ...
    Route::post('/tokens', [UserTokenController::class, 'store']);
});
```

**5. Membuat NotificationService**
Buatlah NotificationService di `app/Services/NotificationService.php` isi dengan kode berikut:
```php
<?php

namespace App\Services;

use App\Models\UserToken;
use Illuminate\Support\Facades\Http;
use Google_Client;

class NotificationService
{
    static public function sendFCMNotificationToUser($id_user, $title, $body, $data = [])
    {
        $tokens = UserToken::where("id_user", $id_user)->get();
        foreach ($tokens as $userToken) {
            $fcmToken = $userToken->token;
            NotificationService::sendFCMNotification($fcmToken, $title, $body);
        }
    }

    static public function sendFCMNotification($fcmToken, $title, $body, $data = [])
    {
        $url = 'https://fcm.googleapis.com/v1/projects/abzensi-online/messages:send';
        $headers = [
            'Authorization' => 'Bearer ' . NotificationService::getAccessTokenFromServiceAccount(),
            'Content-Type' => 'application/json',
        ];
        $payload = [
            'message' => [
                'token' => $fcmToken,
                'notification' => [
                    'title' => $title,
                    'body' => $body,
                ],
                "data" => [
                    "key1" =>  "value1",
                    "key2" =>  "value2"
                ]
            ],
        ];

        $response = Http::withHeaders($headers)->post($url, $payload);
        return $response->json();
    }

    static public function getAccessTokenFromServiceAccount()
    {
        $client = new Google_Client();

        // Lokasi file service-account.json yang Anda simpan
        $pathToServiceAccount = base_path('credentials.json');

        $client->useApplicationDefaultCredentials();
        $client->addScope('https://www.googleapis.com/auth/firebase.messaging');
        $client->setAuthConfig($pathToServiceAccount);

        // Dapatkan token akses
        $token = $client->fetchAccessTokenWithAssertion();

        return $token['access_token'];
    }
}

```

**6. Gunakan NotificationService untuk Mengirim Notifikasi dari Laravel**
Sekarang kamu bisa mengirimkan notification ke Client.
Kamu cukup menjalankan perintah berikut ketika kamu ingin mengirimkan notification ke Client.

```php
NotificationService::sendFCMNotificationToUser($id, "Berhasil check in hari ini!", "");
```

Isi $id dengan user_id dari user yang ingin dikirimkan notifications.

```php
return NotificationService::sendFCMNotification(
    "fcm_token_flutter",
    "Pesan",
    "Ini body"
);
```

```php
return NotificationService::sendFCMNotification(
    "efM0yMaZSFKEtixHrpRoml:APA91bGDzBIgBHgSFt_Y2l4R9-ESk4Q-sgFB-IPAI2OesfVz7o6swLmdVh5l3EgIKAAvHWtG2mr3rxZQkqpwzLGbBnpQ1bIaJa9ZuWERZYqiHTf2BdoWGGnorBEIvswdyzrTkrGVq8P8",
    "Pesan",
    "Ini body"
);
```
