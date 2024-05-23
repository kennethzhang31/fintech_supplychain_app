import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:fintech_/widgets/sidebar_menu.dart';
import 'package:fintech_/state/user_settings_provider.dart';
import 'package:fintech_/models/user_setting.dart';
import 'package:fintech_/models/user_plans.dart';

class User_Settings extends StatefulWidget {
  const User_Settings({super.key});

  @override
  State<User_Settings> createState() {
    return _UserSettingsState();
  }
}

class _UserSettingsState extends State<User_Settings> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  late Future<void> _fetchUserSettingsFuture;

  @override
  void initState() {
    super.initState();
    final userSettingsProvider = Provider.of<UserSettingsProvider>(context, listen: false);
    _fetchUserSettingsFuture = userSettingsProvider.fetchUserSettings();
    _fetchUserSettingsFuture.then((_) {
      _usernameController.text = userSettingsProvider.userSettings.username;
      _emailController.text = userSettingsProvider.userSettings.email;
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double myWidth = MediaQuery.of(context).size.width;
    double myHeight = MediaQuery.of(context).size.height;

    UserPlan currentPlan = UserPlan.Tier2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Settings'),
      ),
      drawer: const sidebarDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<void>(
              future: _fetchUserSettingsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching user settings'));
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: 'Username'),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final newUsername = _usernameController.text;
                          final newEmail = _emailController.text;
                          Provider.of<UserSettingsProvider>(context, listen: false).updateUserSettings(
                            UserSettings(
                              username: newUsername,
                              email: newEmail,
                            ),
                          );
                        },
                        child: const Text('Save Changes'),
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: myWidth * 0.8,
              height: myHeight * 0.1,
              child: InkWell(
                onTap: () => {
                  showPlanSelectionSheet(context, currentPlan)
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'S\'GO Subscription Plan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        _getPlan(currentPlan),
                        style: const TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}

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

int _getPrice(UserPlan plan){
  switch(plan){
    case UserPlan.Tier1:
      return 189;
    case UserPlan.Tier2:
      return 249;
    case UserPlan.Tier3:
      return 1500;
    default:
      return 0;
  }
}

void showPlanSelectionSheet(BuildContext context, UserPlan currentPlan) {

  showModalBottomSheet(
    context: context,
    builder: (context) {
      double myWidth = MediaQuery.of(context).size.width;
      double myHeight = MediaQuery.of(context).size.height;
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: myWidth,
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
                      width: myWidth * 0.3,
                      height: myHeight * 0.2,
                      decoration: BoxDecoration(
                        color: currentPlan == plan ? Color.fromARGB(255, 77, 129, 140) : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _getPlan(plan),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                          ),
                          Text(
                            '${_getPrice(plan).toString()} NTD / month',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      );
    },
  );
}