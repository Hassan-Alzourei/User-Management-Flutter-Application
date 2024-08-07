import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  const InfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        8,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: ListTile(
          leading: Icon(
            icon,
            size: 20,
            color: Colors.orange,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
