import 'package:ebooks/utils/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbihView extends StatefulWidget {
  const TasbihView({super.key});

  @override
  State<TasbihView> createState() => _TasbihViewState();
}

class _TasbihViewState extends State<TasbihView> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter(); // jab screen open ho counter load karo
  }

  /// counter load karne ka function
  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt("tasbih_counter") ?? 0;
    });
  }

  /// counter save karne ka function
  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("tasbih_counter", counter);
  }

    /// counter reset karne ka function
  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = 0;
    });
    await prefs.setInt("tasbih_counter", 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appstyles.primaryColor2,
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){
              _resetCounter();
            },
            child: Image.asset("assets/images/reset.png",
            height: 40,
            width: 40,
            fit: BoxFit.cover,
            color: Colors.white ,),
          ),
        )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Background image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/images/bg_image.PNG",
              fit: BoxFit.cover,
            ),
          ),

          /// Main white container (center)
          Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                counter.toString(),
                style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// Small circular container (top-right of white box)
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 170 / 2 - 90,
            right: MediaQuery.of(context).size.width / 2 - 170 / 2 - 15,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  counter++;
                });
                await _saveCounter(); // save karo jab bhi counter update ho
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
