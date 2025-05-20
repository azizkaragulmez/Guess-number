import 'dart:math';

import 'package:flutter/material.dart';

class sonucekrani extends StatefulWidget {


 late bool sonuc;
 sonucekrani({required this.sonuc});

 @override
  State<sonucekrani> createState() => _sonucekraniState();
}
class _sonucekraniState extends State<sonucekrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: widget.sonuc ? Image.asset("resimler/mutlu.png") : Image.asset("resimler/uzgun.png"),
            ),
            Text(widget.sonuc ? "Kazandınız" : "Kaybettiniz",style: TextStyle(color: Colors.green,fontSize: 50, fontWeight: FontWeight.bold)),
            ElevatedButton(
              child: Text("Tekrar Dene"),
              onPressed: () {
               Navigator.pop(context);  //geldiğin sayfaya geri döndük
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

          ],
        ),
      ),
    );
  }
}
