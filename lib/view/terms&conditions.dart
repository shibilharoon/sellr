import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome to Sellr!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'These terms and conditions outline the rules and regulations for the use of Sellr\'s application, located at your app\'s URL.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Introduction',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'By accessing this application we assume you accept these terms and conditions. Do not continue to use Sellr if you do not agree to take all of the terms and conditions stated on this page.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '2. Intellectual Property Rights',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Other than the content you own, under these terms, Sellr and/or its licensors own all the intellectual property rights and materials contained in this application. You are granted limited license only for purposes of viewing the material contained on this application.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '3. Restrictions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'You are specifically restricted from all of the following:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Publishing any application material in any other media;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Selling, sublicensing and/or otherwise commercializing any application material;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Publicly performing and/or showing any application material;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Using this application in any way that is or may be damaging to this application;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this application;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '- Using this application to engage in any advertising or marketing;',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '4. Your Content',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'In these application Standard Terms and Conditions, "Your Content" shall mean any audio, video text, images or other material you choose to display on this application. By displaying Your Content, you grant Sellr a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '5. Payment',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'All payment transactions will be processed securely through our payment gateway provider. You must only provide payment details if you are the authorized account holder or have explicit permission from the account holder.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '6. Changes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'We reserve the right to modify these terms and conditions at any time. Your continued use of the application after such modifications will constitute acknowledgment and agreement to abide and be bound by the modified terms and conditions.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
