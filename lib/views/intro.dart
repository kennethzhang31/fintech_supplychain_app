import 'package:fintech_/views/console.dart';
import 'package:flutter/material.dart';
import 'package:fintech_/widgets/floating_text.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState(){
    return _IntroPageState();
  }
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context){

    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: myWidth,
          height: myHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: myHeight * 0.02,),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/images/blockchain.png'
                )
              ),
              SizedBox(height: myHeight * 0.03,),
              SizedBox(
                width: myWidth * 0.7,
                child: Column(
                  children: [
                    floatingWidget(
                      dx: 0.5,
                      dy: -0.5,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Welcome to S\'Go',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 40, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.black,
                            shadows: [Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            )]
                          )
                        ),
                      )
                    ),
                    SizedBox(height: myHeight * 0.03,),
                    floatingWidget(
                      dx: -0.5,
                      dy: 0.5,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Make use of modern technology to ease your life',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 22, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.black,
                            shadows: [Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            )]
                          )
                        ),
                      )
                    ),
                    SizedBox(height: myHeight * 0.03,),
                    floatingWidget(
                      dx: 0.5,
                      dy: -0.5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Blockchain and AI in the palm of your hands',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.black,
                            shadows: [Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 2,
                            )]
                          )
                        ),
                      )
                    ),
                  ]
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.04
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(_createRoute());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 156, 220, 255),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05, vertical: myHeight* 0.013),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Start S\'GO Right Now!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          RotationTransition(
                            turns: AlwaysStoppedAnimation(310/360),
                            child: Icon(Icons.arrow_forward_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]
          )
        )
      )
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  const Console(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 600)
    );
  }
}