import 'package:flutter/material.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';

class ReportPage extends StatefulWidget{
  const ReportPage ({super.key});

  @override
  State<ReportPage> createState(){
    return _ReportPage();
  }
}

class _ReportPage extends State<ReportPage>{
  String imagePath = '';
  bool _imageIsGenerated = false;
  bool _isLoading = false;

  void generateImage(int type) {

    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () => {
      setState(() {
        if (type == 0){
          imagePath = 'assets/images/IncomeStatementSample.png';
        }
        else if (type == 1){
          imagePath = 'assets/images/CashflowStatementSample.png';
        }
        _imageIsGenerated = true;
        _isLoading = false;
      })
      } 
    );
  }

  @override
  Widget build(BuildContext context){  
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report'),
      ),
      drawer: const sidebarDrawer(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'Hello. how can I help you today?',
                    style: TextStyle(fontSize: 20)
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                    'Please select which one I should generate?',
                    style: TextStyle(fontSize: 15)
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 125, 210, 226)
                        ),
                        child: InkWell(
                          onTap: () => {
                            generateImage(0)
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Income Statement',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 125, 210, 226)
                        ),
                        child: InkWell(
                          onTap: () => {
                            generateImage(1)
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Cashflow Statement',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_imageIsGenerated) 
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Image.asset(imagePath),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {
          
                        }, 
                        child: const Text('Download')
                      )
                    ],
                  )
              ],
            )
          ),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      )
    );
  }
}