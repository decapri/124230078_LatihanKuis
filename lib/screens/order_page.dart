import 'package:flutter/material.dart';
import 'package:latihan_kuis_124230078/data/food_display.dart';

class OrderPage extends StatefulWidget {
  final int index;
  const OrderPage({super.key, required this.index});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController jumlahController = TextEditingController();
  String hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
        backgroundColor:  Color(0xFFFF4081),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(menuList[widget.index].imageUrls[0]),
            Text(
              menuList[widget.index].name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "${menuList[widget.index].about}"
              "Harga : ${menuList[widget.index].price}"
              ),
      
            // input jumlah
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: jumlahController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Masukkan Jumlah',
                  contentPadding: EdgeInsets.all(8.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF1E3A8A)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(0xFFFF4081), width: 2),
                  ),
                ),
              ),
            ),

            // button submit
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1E3A8A),
                ),
                onPressed: () {
                  int jumlah = int.tryParse(jumlahController.text) ?? 0;

                  // ambil angka
                  String hargaString =
                      menuList[widget.index].price.replaceAll(RegExp(r'[^0-9]'), '');
                  int harga = int.tryParse(hargaString) ?? 0;

                  setState(() {
                    hasil = "Total Harga = Rp ${jumlah * harga}";
                  });
                },
                child: const Text("Submit"),
              ),
            ),

            // hasil
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                hasil,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
