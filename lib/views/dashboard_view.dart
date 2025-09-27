import 'package:ebooks/utils/appstyles.dart';
import 'package:ebooks/views/category_details_view.dart';
import 'package:ebooks/views/islamic_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
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
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.dmSans(
                          fontSize: 28,
                          color: Colors.white,
                          height: 1.1,
                        ),
                        children: [
                          const TextSpan(text: "Your Daily Dose of "),
                          TextSpan(
                            text: "Wisdom",
                            style: GoogleFonts.dmSans(
                              fontSize: 28,
                              color: Appstyles.primaryColor2, // highlighted
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: " & "),
                          TextSpan(
                            text: "Inspiration",
                            style: GoogleFonts.dmSans(
                              fontSize: 28,
                              color: Appstyles.primaryColor2, // highlighted
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                                    builder: (context) =>
                                        IslamicCategoriesView(),
                                  ),
                                );
                              },
                              icon: "assets/images/islamic_icon.png",
                              title: "Islamic Books",
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
                                      category: "Motivational",
                                      subCategory: "Motivational",
                                    ),
                                  ),
                                );
                              },
                              icon: "assets/images/motivational_icon.png",
                              title: "Motivational Books",
                            ),
                          ),
                        ],
                      ),
                    ),
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
        height: 200,
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
              Image.asset(icon),
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
