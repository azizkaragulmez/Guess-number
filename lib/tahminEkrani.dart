import 'dart:math';

import 'package:f_20_sayi_tahmin_oyunu/sonucekrani.dart';
import 'package:flutter/material.dart';

class tahminekrani extends StatefulWidget {
  const tahminekrani({super.key});

  @override
  State<tahminekrani> createState() => _tahminekraniState();
}
class _tahminekraniState extends State<tahminekrani> {

  var tfTahmin = TextEditingController(); // bir TextField (veya TextFormField) bileşeninin içeriğini kontrol etmek, değiştirmek veya okumak için kullanılır.
  int rasgeleSayi=0;
  int kalanHak =5;
  String yonlendirme ="";

  @override
  void initState() {  //StatefulWidget'in durum (state) sınıfı içinde bulunan ve widget oluşturulurken bir kez çalışan özel bir metottur.
    super.initState();
    rasgeleSayi = Random().nextInt(101);  //0-100 arasında sayı üretiri
    print("Rastgele sayı : $rasgeleSayi");

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("tahmin ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,  //aralı direk boşluk verdik
          children: [
            Text("Kalan Hak : $kalanHak",style: TextStyle(color: Colors.pink,fontSize: 30, fontWeight: FontWeight.bold)),
            Text("Yardım : $yonlendirme",style: TextStyle(color: Colors.grey,fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,   //yazdığımızın ortada olmasını istedik
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("TAHMİN ET"),
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak -1;
                  });
                  int tahmin = int.parse(tfTahmin.text);
                  if(tahmin == rasgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonucekrani(sonuc: true)));
                    return;  //return kullanarak butonun çalışmasını durudurucaz
                  }
                  if (tahmin > rasgeleSayi){
                    setState(() {
                      yonlendirme ="Tahmini Azalt";
                    });
                  }
                  if (tahmin < rasgeleSayi){
                    setState(() {
                      yonlendirme ="Tahmini Arttır";
                    });
                  }
                  if(kalanHak ==0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => sonucekrani(sonuc: false,)));
                  }
                  tfTahmin.text="";  //içini temizliyoruz ki daha rahat tahmin girebilelim
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
