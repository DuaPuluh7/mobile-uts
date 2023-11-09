import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';



class Kalkulator extends StatefulWidget {
  const Kalkulator({Key? key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  String userInput = "";
  String result = "0";
  
  List <String> buttonList = [
    'AC',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'C',
    '0',
    '.',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Kalkulator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userInput,
                    style: TextStyle(
                      fontSize: 32, 
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    result,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.white),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                itemCount: buttonList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ), 
                itemBuilder: (BuildContext context, int index){
                  return CustomButton(buttonList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
    Widget CustomButton(String text){
        return InkWell(
          splashColor: Color(0xFF1d2630),
          onTap: () {
            setState(() {
              handleButtons(text);
            });
          },
          child: Ink(
            decoration: BoxDecoration(
              color: getBgColor(text),  // Latar belakang tombol hitam
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0.5,
                  offset: Offset(-3, -3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color : getColor(text),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
    }
   getColor(String text){
    if (
      text == "/" || 
      text == "*" || 
      text == "+" || 
      text == "-" || 
      text == "C" || 
      text == "(" || 
      text == ")"){
      return Color.fromARGB(255, 252, 100, 100);
    }
    return Colors.white;

  }

  getBgColor(String text){
    if (text == "AC"){
      return Color.fromARGB(255, 252, 100, 100);
    }
    if (text == "="){
      return Colors.green;
    }
  }
 void handleButtons(String text) {
  if (text == "AC") {
    userInput = ""; // Membersihkan inputan saat tombol "AC" ditekan
    result = "0";
  } else if (text == "C") {
    if (userInput.isNotEmpty) { // Anda perlu mengecek apakah userInput tidak kosong sebelum mencoba menghapus karakter terakhir
      userInput = userInput.substring(0, userInput.length - 1);
    }
  } else if (text == "=") {
    result = calculate();
    userInput = result;
    if (result.endsWith(".0")) {
      result = result.replaceAll(".0", "");
    }
  } else {
    userInput = userInput + text;
  }
}


  String calculate(){
    try {
      var exp = Parser().parse(userInput);
      var evaluation = exp.evaluate(EvaluationType.REAL,ContextModel());
      return evaluation.toString();
    } catch(e){
      return "Error";
    }
  }
 
}
