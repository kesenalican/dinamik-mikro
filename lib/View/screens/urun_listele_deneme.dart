import 'package:flutter/material.dart';

import '../styles/colors.dart';
import 'home_page.dart';

List<Map> doctors = [
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist'
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist'
  }
];


class UrunListeleDeneme extends StatefulWidget {
  const UrunListeleDeneme({Key? key}) : super(key: key);

  @override
  State<UrunListeleDeneme> createState() => _UrunListeleDenemeState();
}

class _UrunListeleDenemeState extends State<UrunListeleDeneme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Top Doctor',
            style: TextStyle(
              color: Color(MyColors.header01),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          for (var doctor in doctors)
            TopDoctorCard(
              img: doctor['img'],
              doctorName: doctor['doctorName'],
              doctorTitle: doctor['doctorTitle'],
            )
        ],
      ),
    );
  }
}
