  import 'package:a/pages/login_pages.dart';
  import 'package:flutter/material.dart';
  import 'package:introduction_screen/introduction_screen.dart';

  class OnBoard extends StatelessWidget {
    const OnBoard({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
       body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            titleWidget: Text(
              "Live Learning",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,  
              ),
            ),
            bodyWidget: Text(
              textAlign : TextAlign.center,
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                fontFamily: 'Poppins', // Ganti font untuk body
                fontSize: 16, // Ganti ukuran font sesuai kebutuhan
              ),
              ),
            image: Image.asset("lib/images/img-1.png",height: 200, width: 200,)
          ),
          PageViewModel(
            titleWidget: Text(
              "Write Title Of Page",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.bold,  
              ),
            ),
            bodyWidget: Text(
              textAlign : TextAlign.center,
              "Write the more description of the page.Write the more description of the page.",
              style: TextStyle(
                fontFamily: 'Poppins', // Ganti font untuk body
                fontSize: 16, // Ganti ukuran font sesuai kebutuhan
              ),
              ),
            image: Image.asset("lib/images/img-2.png",height: 200, width: 200,)
          ),
          PageViewModel(
            titleWidget: Text(
              "Write Title Of Page",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,  
              ),
            ),
            bodyWidget: Text(
              textAlign : TextAlign.center,
              "Write the more description of the page.Write the more description of the page.",
              style: TextStyle(
                fontFamily: 'Poppins', // Ganti font untuk body
                fontSize: 16, // Ganti ukuran font sesuai kebutuhan
              ),
              ),
            image: Image.asset("lib/images/img-3.png",height: 200, width: 200,)
            
          ),
        ],
        onDone: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginPage(), // Ganti LoginPage dengan nama kelas halaman login Anda
          ));
        },
        onSkip: () {
          // Fungsi yang akan dipanggil saat tombol "Skip" ditekan
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => LoginPage(), // Ganti LoginPage dengan nama kelas halaman login Anda
          ));
        },
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black
          ),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black
          ),
        ),
        dotsDecorator: DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(20.0, 10.0),
          color: Colors.black,
          activeColor: Colors.red,
          spacing: EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          )
        ),
       ),
      );
    }
  }
