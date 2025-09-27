import 'package:ebooks/utils/appstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:permission_handler/permission_handler.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({Key? key}) : super(key: key);

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

class _QiblahScreenState extends State<QiblahScreen> {
  final _qiblahCompass = FlutterQiblah.qiblahStream;

  Future<void> requestPermissions() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      await Permission.location.request();
    }
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qibla Direction",
      style: TextStyle(
        color: Colors.white
      ),),
      backgroundColor: Appstyles.primaryColor2 ,),
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
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          /// Qiblah Compass UI in center
          StreamBuilder<QiblahDirection>(
            stream: _qiblahCompass,
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.error, color: Colors.red, size: 60),
                      SizedBox(height: 10),
                      Text(
                        "Device ka compass theek se kaam nahi kar raha.\n"
                        "Apna mobile 8-shape motion main ghumaye (calibration ke liye).\n"
                        "Aur ensure karein ke Location permission allow hai.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                );
              }

              final qiblahDirection = snapshot.data;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                    angle: (qiblahDirection?.qiblah ?? 0) * (3.1416 / 180),
                    child: Image.asset(
                      'assets/images/compass_icon.png',
                      width: 200,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Qibla Direction: ${qiblahDirection?.qiblah.toStringAsFixed(2)}°",
                    style:  TextStyle(fontSize: 18, color: Colors.white,
                    fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
