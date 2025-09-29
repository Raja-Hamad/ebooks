import 'package:ebooks/utils/appstyles.dart';
import 'package:ebooks/views/category_details_view.dart';
import 'package:ebooks/views/qiblah_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class IslamicCategoriesView extends StatefulWidget {
  IslamicCategoriesView({super.key});

  @override
  State<IslamicCategoriesView> createState() => _IslamicCategoriesViewState();
}

class _IslamicCategoriesViewState extends State<IslamicCategoriesView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background full-screen image
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset("assets/images/bg_image.PNG", fit: BoxFit.cover),
          ),

          // SafeArea + Padding container where you put your Column components
          SafeArea(
            child: Padding(
              // change these values to control padding from each side
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Example: Headline with 1-2 highlighted words
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.dmSans(
                              fontSize: 28,
                              color: Colors.white,
                              height: 1.1,
                            ),
                            children: [
                              TextSpan(
                                text: "Select ",
                                style: GoogleFonts.dmSans(
                                  fontSize: 28,
                                  color: Colors.white, // highlighted
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "Category",
                                style: GoogleFonts.dmSans(
                                  fontSize: 28,
                                  color: Appstyles.primaryColor2, // highlighted
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> QiblahScreen()));
                          },
                          child: Column(
                            children: [
                              Icon(Icons.directions,color: Colors.white),
                              Text("Qibla",
                              style: GoogleFonts.dmSans(color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),)
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Subheading / description (optional)
                    Text(
                      "Explore Islamic and motivational e-books to uplift your mind and soul.",
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "General",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/general_icon.png",
                              title: "General kutab",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "Hadith",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/hadith_icon.png",
                              title: "Hadiths",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "Tafseer",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/tafseer_icon.png",
                              title: "tafaseer ul Quran",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "Fiqah",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/fiqqa_icon.png",
                              title: "fiqqa Kutab",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "Fatwa",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/fatwa_icon.png",
                              title: "Fatwa Kutab",
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: ReusableContainer(
                              onPress: () {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryDetailsView(
                                      category: "Islamic",
                                      subCategory: "Darsi",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/darsi_icon.png",
                              title: "Darsi Kutab",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  String title;
  String icon;
  VoidCallback onPress;
  ReusableContainer({
    super.key,
    required this.onPress,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(icon, height: 100, width: 100, fit: BoxFit.cover),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  title,
                  style: GoogleFonts.dmSans(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
