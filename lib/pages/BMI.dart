import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  int currentindex = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "BMI",
          style: TextStyle(
            fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", Colors.blue, 0),
                  radioButton("Woman", Colors.pink, 1),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Your Height in Cm:",
                style: TextStyle(
                  fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Height in cm",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder( // Menambahkan border pada TextField
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.black), // Warna border
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Your Weight in Kg:",
                style: TextStyle(
                  fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Weight in Kg",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    calculateBMI();
                    weightController.clear(); // Membersihkan nilai dalam weightController
                    heightController.clear(); // Membersihkan nilai dalam heightController
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "HASIL BMI",
                    style: TextStyle(
                      fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center( // Memasukkan hasil BMI ke dalam widget Center
                    child: Text(
                      "$bmiResult",
                      style: TextStyle(
                        fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: ElevatedButton(
          onPressed: () {
            changeIndex(index);
          },
          style: ElevatedButton.styleFrom(
            primary: currentindex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'Poppins', // Mengubah font menjadi 'Poppins'
              color: currentindex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double heightInMeters = height / 100.0;
    double bmi = 0.0;

    if (currentindex == 0) {
      // Perhitungan BMI untuk pria
      bmi = weight / (heightInMeters * heightInMeters);
    } else {
      // Perhitungan BMI untuk wanita
      bmi = (weight / (heightInMeters * heightInMeters)) + 1.5;
    }

    setState(() {
      bmiResult = bmi;
    });
  }
}
