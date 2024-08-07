import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/api.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/provider/user_provider.dart';
import 'package:flutter_application_1/widgets/user_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchUsers(); // Call async method from initState
  }

  Future<void> _fetchUsers() async {
    // Call fetchUsers from the provider to get users
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    await userProvider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "Users",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: userProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : userProvider.errorMessage != null
                ? Center(
                    child: Text(userProvider.errorMessage!),
                  )
                : ListView.builder(
                    itemCount: userProvider.users.length,
                    itemBuilder: (context, index) {
                      User user = userProvider.users[index];

                      int n = Random().nextInt(5) + 1; // Random image selector

                      return UserCard(
                        imagePath: 'assets/images/user${n}.png',
                        user: user,
                      );
                    }),
      ),
    );
  }
}
