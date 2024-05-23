import 'package:fintech_/views/orders.dart';
import 'package:flutter/material.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';
import 'package:fintech_/state/user_settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:fintech_/views/user_settings.dart';

class Console extends StatefulWidget {
  const Console({super.key});

  @override
  State<Console> createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  // ignore: unused_field
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final PageController _carouselController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    _carouselController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_carouselController.hasClients) {
        int nextPage = _carouselController.page!.round() + 1;
        if (nextPage >= 5) {
          nextPage = 0;
        }
        _carouselController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        ).then((_) => _startAutoScroll());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Console'),
      ),
      drawer: sidebarDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 22, 35, 54),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Consumer<UserSettingsProvider>(
              builder: (context, userSettingsProvider, child) {
                return InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const User_Settings())),
                  child: SizedBox(
                    height: myHeight * 0.1,
                    width: myWidth,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.06, vertical: myHeight * 0.03),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          userSettingsProvider.userSettings.username,
                          style: TextStyle(
                            fontSize: myHeight * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                height: myHeight * 0.80,
                width: myWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: myHeight * 0.28,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: [
                          _buildOrderInfoCard(),
                          _buildMessagingInfoCard(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: myWidth * 0.5,
                            height: myHeight * 0.5,
                            child: _buildNewsletterSection()
                          ),
                          const SizedBox(width: 5,),
                          SizedBox(
                            width: myWidth * 0.45,
                            height: myHeight * 0.45,
                            child:_buildImageCarousel(context)
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 5,
      child: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Orders())),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Pending: ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text('3', style: TextStyle(fontSize: 17),),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Processing: ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text('1',style: TextStyle(fontSize: 17),),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Shipped: ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text('2', style: TextStyle(fontSize: 17),),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Delivered: ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text('3',style: TextStyle(fontSize: 17),),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessagingInfoCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 5,
      child: InkWell(
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Recent Messages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsletterSection() {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s Going on Today?',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ' 
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context){
    return SizedBox(
      child: PageView(
        controller: _carouselController,
        children: [
          _carouselImage('assets/images/1.png'),
          _carouselImage('assets/images/2.png'),
          _carouselImage('assets/images/3.png'),
          _carouselImage('assets/images/4.png'),
          _carouselImage('assets/images/5.png'),
          ],
      ),
    );
  }

  Widget _carouselImage(String path){
    return Card(
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

