import 'package:f_20_sayi_tahmin_oyunu/tahminEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  anasayfa(),
    );
  }
}

class anasayfa extends StatefulWidget {

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ana sayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Spacer(),
              Text("Tahmin Oyunu",style: TextStyle(color: Colors.green,fontSize: 50, fontWeight: FontWeight.bold)),
              Spacer(),
              SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("resimler/zar.png"),
            ),
            Spacer(),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("OYUN BAŞLA"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => tahminekrani()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 8,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
