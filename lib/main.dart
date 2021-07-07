import 'package:covid_onboarding/slider.dart';
import 'package:covid_onboarding/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: OnBoarding(),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        image: 'assets/img_1.png',
        title: 'Get Vaccinate',
        text: 'Vaccination is an important step to stop the pandemic.'),
    SliderPage(
        image: 'assets/img_2.png',
        title: 'Take Care Of Elderly People',
        text: 'Keeps checking up on elderly people time to time.'),
    SliderPage(
        image: 'assets/img_3.png',
        title: 'Proper Treatment',
        text:
            'Self quarantine yourself if you started showing symptoms of COVID-19.'),
    SliderPage(
        image: 'assets/img_4.png',
        title: 'Meditation Is The Key',
        text:
            'Helps in calmness and physical relaxation, and enhance overall health.'),
    SliderPage(
        image: 'assets/img_5.png',
        title: 'Stay Inside',
        text: 'Without any reason, recommend to don’t go outside.'),
    SliderPage(
        image: 'assets/img_6.png',
        title: 'Consult doctors.',
        text:
            'Doctors advices are always helpful, please consult doctor before using some home remedies of treatment.'),
    SliderPage(
        image: 'assets/img_7.png',
        title: 'Maintain Social Distance',
        text: 'Encourage others to maintain social distance.'),
    SliderPage(
        image: 'assets/img_8.png',
        title: 'Eat Healthy Food',
        text:
            'A high protein and vitamin enriched food has a big roll in maintaining health.'),
    SliderPage(
        image: 'assets/img_9.png',
        title: ' Stay Hydrated',
        text:
            'It is necessary to drink minimum 2.7 litres of water everyday, even when you’re not thirsty.'),
    SliderPage(
        image: 'assets/img_10.png',
        title: 'Get Tested',
        text:
            'If you have symptoms of Novel Coronavirus, Do a COVID test from your nearest hospital.'),
  ];

  _onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'COVID Advices',
          style: GoogleFonts.poppins(fontSize: 18, color: black900),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, index) {
              return _pages[index];
            },
            scrollDirection: Axis.horizontal,
            controller: _controller,
            onPageChanged: _onPageChange,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: (index == _currentPage)
                          ? black900
                          : black900.withOpacity(0.5),
                    ),
                  );
                }),
              ),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 50,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 50,
                  decoration: BoxDecoration(
                      color: black900, borderRadius: BorderRadius.circular(10)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Center(
                          child: Text(
                            'Stay Save',
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 18),
                          ),
                        )
                      : Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )
        ],
      ),
    );
  }
}
