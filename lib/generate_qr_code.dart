import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateState();
}

class _GenerateState extends State<GenerateQRCode> {
  final TextEditingController urlController = TextEditingController();
  // Humne ek alag variable banaya hai taaki button click par hi QR update ho
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sirf tabhi dikhayen jab qrData khali na ho
              if (qrData.isNotEmpty)
                Column(
                  children: [
                    QrImageView(
                      data: qrData,
                      size: 200,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

              TextField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: 'Enter your data',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Enter your data',
                  prefixIcon: const Icon(Icons.link),
                ),
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // Button click hone par UI update karein
                  setState(() {
                    qrData = urlController.text;
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}