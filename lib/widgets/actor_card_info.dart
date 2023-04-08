import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final String name;
  final String photoUrl;

  const ActorCard({
    Key? key,
    required this.name,
    required this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          ClipOval(
            child: Image.network(
              photoUrl,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromARGB(255, 16, 18, 54),
            ),
          ),
        ],
      ),
    );
  }
}
