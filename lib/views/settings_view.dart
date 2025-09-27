import 'package:ebooks/utils/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Opps...",
      style: TextStyle(
        color: Colors.white
      ),),
      backgroundColor: Appstyles.primaryColor2 ,),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1.0,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Image.asset(
              "assets/images/bg_image.PNG",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100,),
                Text("We are",
                style: GoogleFonts.dmSans(color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500)),
                 Text("Managing",
                style: GoogleFonts.dmSans(color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500)),
                 Text("Books",
                style: GoogleFonts.dmSans(color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold)),
                 Text("Stay tuned!",
                style: GoogleFonts.dmSans(color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w500)),
              ],
            ),
          )
        ],
      ),
    );
  }
}