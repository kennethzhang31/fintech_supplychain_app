import 'package:flutter/material.dart';
import 'package:fintech_/models/user_plans.dart';

class PlanSelectionSheet extends StatefulWidget {
  final UserPlan currentPlan;

  const PlanSelectionSheet({Key? key, required this.currentPlan}) : super(key: key);

  @override
  _PlanSelectionSheetState createState() => _PlanSelectionSheetState();
}

class _PlanSelectionSheetState extends State<PlanSelectionSheet> {

  String _getPlan(UserPlan plan){
    switch(plan){
      case UserPlan.Tier1:
        return 'Tier 1';
      case UserPlan.Tier2:
        return 'Tier 2';
      case UserPlan.Tier3:
        return 'Tier 3';
      default:
        return 'No Plan';
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: screenWidth,
        child: Column(
          children: [
            const Text(
              'S\'GO Subscription Plan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: UserPlan.values.map((plan) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                      color: widget.currentPlan == plan ? Color.fromARGB(255, 77, 129, 140) : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        _getPlan(plan),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
