import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/widgets/info_card.dart';
import 'package:flutter_application_1/widgets/text_card.dart';

class UserDetails extends StatelessWidget {
  final User user;
  final String imagepath;

  // Corrected constructor with named parameters
  const UserDetails({
    super.key, // Named parameter for key
    required this.user,
    required this.imagepath, // Required parameter for user
  }); // Properly call super constructor with key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ID #${user.id}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        imagepath,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Text(
                      "${user.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "@${user.username}",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    InfoCard(
                      title: "email",
                      description: user.email,
                      icon: Icons.email,
                      user: user,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextCard(
                          text: "street",
                          subtext: user.address["street"],
                        ),
                        TextCard(
                          text: "suite",
                          subtext: user.address["suite"],
                        ),
                        TextCard(
                          text: "ctiy",
                          subtext: user.address["city"],
                        ),
                      ],
                    ),
                    InfoCard(
                      title: "phone",
                      description: user.phone,
                      icon: Icons.phone,
                      user: user,
                    ),
                    InfoCard(
                      title: "website",
                      description: user.website,
                      icon: Icons.web,
                      user: user,
                    ),
                    InfoCard(
                      title: "company",
                      description: user.company['name'],
                      icon: Icons.house_sharp,
                      user: user,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
