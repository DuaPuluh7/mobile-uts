import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final List<String> temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"];
  String selectedUnit = "Celsius";
  TextEditingController inputController = TextEditingController();
  TextEditingController resultCelsiusController = TextEditingController();
  TextEditingController resultFahrenheitController = TextEditingController();
  TextEditingController resultKelvinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Temperature Converter",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: selectedUnit,
              items: temperatureUnits.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(
                    unit,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedUnit = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Unit',
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter temperature in $selectedUnit",
                filled: true,
                fillColor: Colors.white, // Background putih
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0), // Radius border
                  borderSide: BorderSide(color: Colors.black, width: 2.0), // Warna dan lebar border
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  calculateConversion();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  "Convert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            buildResultCard("Result in Celsius:", resultCelsiusController),
            buildResultCard("Result in Fahrenheit:", resultFahrenheitController),
            buildResultCard("Result in Kelvin:", resultKelvinController),
          ],
        ),
      ),
    );
  }

  Card buildResultCard(String label, TextEditingController controller) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
            ),
            TextField(
              controller: controller,
              readOnly: true,
              decoration: InputDecoration(
                hintText: label,
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void calculateConversion() {
    double inputValue = double.tryParse(inputController.text) ?? 0.0;
    double resultCelsius = 0.0;
    double resultFahrenheit = 0.0;
    double resultKelvin = 0.0;

    if (selectedUnit == "Celsius") {
      resultCelsius = inputValue;
      resultFahrenheit = (inputValue * 9 / 5) + 32;
      resultKelvin = inputValue + 273.15;
    } else if (selectedUnit == "Fahrenheit") {
      resultCelsius = (inputValue - 32) * 5 / 9;
      resultFahrenheit = inputValue;
      resultKelvin = (inputValue - 32) * 5 / 9 + 273.15;
    } else if (selectedUnit == "Kelvin") {
      resultCelsius = inputValue - 273.15;
      resultFahrenheit = (inputValue - 273.15) * 9 / 5 + 32;
      resultKelvin = inputValue;
    }

    setState(() {
      resultCelsiusController.text = resultCelsius.toStringAsFixed(2);
      resultFahrenheitController.text = resultFahrenheit.toStringAsFixed(2);
      resultKelvinController.text = resultKelvin.toStringAsFixed(2);
    });
  }
}
