import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  TextEditingController tugas1Controller = TextEditingController();
  TextEditingController tugas2Controller = TextEditingController();
  TextEditingController utsController = TextEditingController();
  TextEditingController uasController = TextEditingController();

  String indexResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Index",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextField("Persentase Nilai Tugas 1 (15%)", tugas1Controller),
              buildTextField("Persentase Nilai Tugas 2 (15%)", tugas2Controller),
              buildTextField("Persentase Nilai UTS (30%)", utsController),
              buildTextField("Persentase Nilai UAS (40%)", uasController),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    calculateIndex();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontFamily: 'Poppins',
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
                    "INDEX NILAI ANDA ADALAH : ",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      "$indexResult",
                      style: TextStyle(
                        fontFamily: 'Poppins',
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

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  void calculateIndex() {
    double tugas1 = double.tryParse(tugas1Controller.text) ?? 0.0;
    double tugas2 = double.tryParse(tugas2Controller.text) ?? 0.0;
    double uts = double.tryParse(utsController.text) ?? 0.0;
    double uas = double.tryParse(uasController.text) ?? 0.0;

    double bobotTugas1 = 0.15;
    double bobotTugas2 = 0.15;
    double bobotUts = 0.30;
    double bobotUas = 0.40;

    double total = (tugas1 * bobotTugas1) + (tugas2 * bobotTugas2) + (uts * bobotUts) + (uas * bobotUas);

    String index = "";

    if (total >= 80) {
      index = "A";
    } else if (total >= 70) {
      index = "B";
    } else if (total >= 60) {
      index = "C";
    } else if (total >= 50) {
      index = "D";
    } else {
      index = "E";
    }

    setState(() {
      indexResult = index;
      tugas1Controller.clear();
      tugas2Controller.clear();
      utsController.clear();
      uasController.clear();
    });
  }
}
