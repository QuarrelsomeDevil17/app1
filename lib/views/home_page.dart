import 'package:app1/constants/routes.dart';
import 'package:flutter/material.dart';

class HomeBage extends StatelessWidget {
  const HomeBage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.white,
            child: Image(
              image: AssetImage(
                'lib/images/scene2.jpg',
              ),
            ),
          ),
          Text(
            "Genduu",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontFamily: 'Pacifico'),
          ),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'SourceSans3',
                fontWeight: FontWeight.bold,
                letterSpacing: 4),
          ),
          SizedBox(
            height: 25,
            width: 200,
            child: Divider(
              color: Colors.teal.shade100,
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 40,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(loginRoute);
                      },
                      child: const Text(
                        "+91-9999999999",
                        style: TextStyle(fontSize: 20, color: Colors.teal),
                      ))
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    size: 40,
                    color: Colors.teal,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "info@yshvrd.com",
                    style: TextStyle(fontSize: 20, color: Colors.teal),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
