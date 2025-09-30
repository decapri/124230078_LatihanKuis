import 'package:flutter/material.dart';
import 'package:latihan_kuis_124230078/auth/login_page.dart';
import 'package:latihan_kuis_124230078/data/food_display.dart';
import 'package:latihan_kuis_124230078/screens/order_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF4081),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Halooo @$username",
              style: const TextStyle(fontSize: 17, color: Colors.deepPurple),
            ),
            const Text(
              "Mau makan apaa",
              style: TextStyle(fontSize: 14, color: Colors.deepPurpleAccent),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Gambar Banner Responsif: Menggunakan 25% dari tinggi layar
          Image.network(
            "https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/p1/916/2025/05/29/PSX_20250529_101311-392770967.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25, // Responsive height
          ),
          const SizedBox(height: 10),
          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              // 2. GridView Responsif: Menggunakan LayoutBuilder untuk menentukan jumlah kolom
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Hitung jumlah kolom: 3 kolom jika lebar > 600, selain itu 2 kolom
                  final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      // Rasio aspek item untuk memastikan tombol "Pesan" terlihat
                      childAspectRatio: 0.75, 
                    ),
                    itemBuilder: (context, index) {
                      return _menuList(context, index);
                    },
                    itemCount: menuList.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuList(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return OrderPage(index: index);
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                menuList[index].imageUrls[0],
                fit: BoxFit.cover,
                height: 90, // Tinggi gambar tetap, rasio aspek grid yang mengatur
                width: double.infinity,
              ),
            ),
            Expanded( // 3. Konten Item Responsif: Mengisi sisa ruang
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menuList[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1, // Memastikan nama tidak terlalu panjang
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text("Harga : ${menuList[index].price}"),

                    const Spacer(), // Mendorong tombol ke bawah
                    
                    // Tombol Pesan Responsif
                    SizedBox(
                      width: double.infinity, // Membuat tombol mengisi lebar kartu
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF1E3A8A),
                          padding: const EdgeInsets.symmetric(vertical: 8), // Padding lebih kecil agar lebih ringkas
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderPage(index: index);
                              },
                            ),
                          );
                        },
                        child: const Text("Pesan"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}