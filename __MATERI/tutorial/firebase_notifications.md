**Tutorial Laravel: Membuat CRUD API untuk Users dan Products**

**1. Membuat Database di MySQL**
Buka MySQL console:
```bash
mysql -u root
```
Buat database:
```sql
CREATE DATABASE laravel_db;
EXIT;
```

**2. Membuat Project Laravel**
```bash
composer create-project --prefer-dist laravel/laravel laravel_project
cd laravel_project
```

**3. Konfigurasi .env**
Buka file `.env` dan konfigurasikan database:
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel_db
DB_USERNAME=root
DB_PASSWORD=
```

**4. Migrasi Tabel Users dengan Kolom Role**
```bash
php artisan make:migration add_role_to_users_table
```
Buka file migrasi yang baru saja dibuat di `database/migrations/`:
```php
public function up()
{
    Schema::table('users', function (Blueprint $table) {
        $table->string('role')->default('admin');
    });
}
```
Lakukan migrasi:
```bash
php artisan migrate
```

**5. Membuat CRUD Users di Controller**
```bash
php artisan make:controller UserController
```
Buka `app/Http/Controllers/UserController.php`:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $sort = $request->input('sort', 'id');
        $order = $request->input('order', 'asc');
        $limit = $request->input('limit', 10);

        $users = User::when($search, function ($query, $search) {
            return $query->where('name', 'like', "%$search%");
        })->orderBy($sort, $order)->paginate($limit);

        return response(['data' => $users], 200);
    }

    public function store(Request $request)
    {
        $user = User::create($request->all());
        return response(['data' => $user], 201);
    }

    public function show(User $user)
    {
        return response(['data' => $user], 200);
    }

    public function update(Request $request, User $user)
    {
        $user->update($request->all());
        return response(['data' => $user], 200);
    }

    public function destroy(User $user)
    {
        $user->delete();
        return response(['data' => 'User deleted'], 200);
    }
}
```

**6. Membuat AuthController**
```bash
php artisan make:controller AuthController
```
Buka `app/Http/Controllers/AuthController.php`:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if (Auth::attempt($request->only('email', 'password'))) {
            $user = Auth::user();
            $token = $user->createToken('authToken')->plainTextToken;
            return response(['data' => ['user' => $user, 'token' => $token]], 200);
        }
        return response(['data' => 'Invalid credentials'], 401);
    }

    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();
        return response(['data' => 'Logged out successfully'], 200);
    }
}
```

**7. Daftarkan ke routes/api.php**
```php
// routes/api.php

Route::post('api/auth/login', [AuthController::class, 'login']);
Route::post('api/auth/logout', [AuthController::class, 'logout']);
Route::apiResource('users', UserController::class);
```

**8. Migrations untuk Products**
```bash
php artisan make:migration create_products_table
```
Buka file migrasi di `database/migrations/`:
```php
public function up()
{
    Schema::create('products', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->double('price');
        $table->timestamps();
    });
}
```
Lakukan migrasi:
```bash
php artisan migrate
```

**9. Membuat Model untuk Products**
```bash
php artisan make:model Product
```

**10. Membuat CRUD Products di ProductController**
```bash
php artisan make:controller ProductController
```
Buka `app/Http/Controllers/ProductController.php`:
```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $search = $request->input('search');
        $sort = $request->input('sort', 'id');
        $order = $request->input('order', 'asc');
        $limit = $request->input('limit', 10);

        $products = Product::when($search, function ($query, $search) {
            return $query->where('name', 'like', "%$search%");
        })->orderBy($sort, $order)->paginate($limit);

        return response(['data' => $products], 200);
    }

    public function store(Request $request)
    {
        $product = Product::create($request->all());
        return response(['data' => $product], 201);
    }

    public function show(Product $product)
    {
        return response(['data' => $product], 200);
    }

    public function update(Request $request, Product $product)
    {
        $product->update($request->all());
        return response(['data' => $product], 200);
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return response(['data' => 'Product deleted'], 200);
    }
}
```

**11. Daftarkan ProductController di routes/api.php**
```php
// routes

/api.php

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('products', ProductController::class);
});
```

**12. Seeder untuk Users**
```bash
php artisan make:seeder UserSeeder
```
Buka `database/seeders/UserSeeder.php`:
```php
<?php

use Illuminate\Database\Seeder;
use App\Models\User;
use Faker\Factory as Faker;

class UserSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1, 10) as $index) {
            User::create([
                'name' => $faker->name,
                'email' => $faker->email,
                'password' => bcrypt('password'),
                'role' => 'admin'
            ]);
        }
    }
}
```

**13. Seeder untuk Products**
```bash
php artisan make:seeder ProductSeeder
```
Buka `database/seeders/ProductSeeder.php`:
```php
<?php

use Illuminate\Database\Seeder;
use App\Models\Product;
use Faker\Factory as Faker;

class ProductSeeder extends Seeder
{
    public function run()
    {
        $faker = Faker::create();

        foreach (range(1, 50) as $index) {
            Product::create([
                'name' => $faker->productName,
                'price' => $faker->randomFloat(2, 10, 1000)
            ]);
        }
    }
}
```

**14. Menjalankan Seeder**
```bash
php artisan db:seed --class=UserSeeder
php artisan db:seed --class=ProductSeeder
```

Dengan mengikuti tutorial di atas, Anda telah berhasil membuat CRUD API untuk Users dan Products di Laravel dengan proteksi Sanctum dan penggunaan Faker untuk seeding data. Selamat mencoba!