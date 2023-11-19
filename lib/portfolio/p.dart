import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class Registration {
  final String name;
  final String email;

  Registration({required this.name, required this.email});
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String contentToShow = '';
  String userEmail = '';
  String userName = '';
  List<Registration> registrations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title:
            const Text('My Portfolio', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage("assets/images/r.jpg"),
            ),
            SizedBox(height: 16.0),
            Text(
              userName.isNotEmpty ? userName : 'Rafiul Islam',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24.0),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.email),
                title: Text(userEmail.isNotEmpty
                    ? userEmail
                    : 'rafiul15-14561@diu.edu.bd'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text('+88-01911050104'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.link),
                title: Text('GitHub: github.com/rafiul_561'),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: Icon(Icons.link),
                title: Text('LinkedIn: linkedin.com/in/Rafiul_561'),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contentToShow = 'about';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        206, 0, 123, 255), // Change the button color
                  ),
                  child: Text(
                    'About',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contentToShow = 'skills';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Change the button color
                  ),
                  child: Text(
                    'Skills',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      contentToShow = 'projects';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // Change the button color
                  ),
                  child: Text(
                    'Projects',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0), // Add some space
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _showRegistrationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 66, 188, 76), // Change the button color
                  ),
                  child: Text(
                    'Registration',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showRegistrationsDetailsDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 66, 188, 76), // Change the button color
                  ),
                  child: Text(
                    'Registrations Details',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            if (contentToShow == 'about') _buildAboutContent(),
            if (contentToShow == 'skills') _buildSkillsContent(),
            if (contentToShow == 'projects') _buildProjectsContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsContent() {
    return Column(
      children: [
        SizedBox(height: 24.0),
        Text(
          'Skills',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Divider(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Wrap(
          spacing: 20,
          runSpacing: 8.0,
          children: [
            Chip(label: Text('HTML')),
            Chip(label: Text('CSS')),
            Chip(label: Text('Flutter')),
            Chip(label: Text('Machine Learning')),
          ],
        ),
      ],
    );
  }

  Widget _buildProjectsContent() {
    return Column(
      children: [
        SizedBox(height: 24.0),
        Text(
          'Projects',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        ProjectCard(
          title: 'Flutter Project',
          description: 'Developed a mobile app using Flutter and Dart.',
        ),
        ProjectCard(
          title: 'Data Analysis Project',
          description: 'Conducted data analysis using Python and Pandas.',
        ),
      ],
    );
  }

  Widget _buildAboutContent() {
    return Column(
      children: [
        SizedBox(height: 24.0),
        Text(
          'About',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          'I am Rafiul Islam Sonet. I am a student of Daffodil International University.',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _showRegistrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    userName = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    userEmail = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  registrations
                      .add(Registration(name: userName, email: userEmail));
                  userName = '';
                  userEmail = '';
                });
                Navigator.of(context).pop();
              },
              child: Text('Register'),
            ),
          ],
        );
      },
    );
  }

  void _showRegistrationsDetailsDialog(BuildContext context) {
    if (registrations.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registrations Details'),
            content: Column(
              children: registrations.map((registration) {
                return ListTile(
                  title: Text('Name: ${registration.name}'),
                  subtitle: Text('Email: ${registration.email}'),
                );
              }).toList(),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registrations Details'),
            content: Text('No registrations available.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;

  const ProjectCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
