import 'package:flutter/material.dart';
import 'package:mywork/calculator/scientificCalculator.dart';
import 'package:mywork/portfolio/p.dart';
import 'package:mywork/weather/we.dart';

void main() {
  runApp(const MyApp());
}

const Color mainColor = Color(0xFF006405);
const Color white = Color(0xFFFFFFFF);
const Color iconColor = Color(0xFF006405); // Color for icons
const Color secondColor = Color(0xFF5DFAFF); // Color for selected item

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeActivity());
  }
}

class HomeActivity extends StatefulWidget {
  HomeActivity({Key? key});

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RafiulPortfolio"),
        backgroundColor: const Color(0xFF9123A0),
        elevation: 10,
        toolbarHeight: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              showSnackBar(context, "Notifications is clicked");
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              showSnackBar(context, "Settings is clicked");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: mainColor),
                accountName: const Text("Rafiul Islam"),
                accountEmail: const Text("rafiul15-14561@diu.edu.bd"),
                currentAccountPicture: Image.network(profileImage),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text("Open List View"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListViewPage(imageItem),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white, // Set navigation bar color to white
        elevation: 10,
        currentIndex: _currentIndex,
        unselectedItemColor: iconColor, // Icon color for unselected items
        selectedItemColor: secondColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),

          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Sci-Calculator"),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "Quiz"),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "MyApp"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Portfolio"),
          // Additional navigation item
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          HomeContent(),
          ScientificCalculator(),
          QuizApp(),
          MyApp1(),
          PortfolioScreen(),
          // Replace with the content for AnotherIcon
          Center(
            child: Text(
              'This is the content for AnotherIcon',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  var imageItem = [
    {"img": "https://unsplash.com/photos/_wYQnEAMAQk", "title": "Amm2"},
    // Add other image items here...
  ];

  String profileImage =
      "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1931&q=80";
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1485965120184-e220f721d03e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
          // Replace with your background image URL
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ],
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(
      'What is the OS used by hackers?',
      ['Windows', 'Linux', 'Debian', 'Ubuntu'],
      'Linux',
    ),
    Question(
      'Which country has the most powerful Cyber Army?',
      ['USA', 'Russia', 'China', 'France'],
      'USA',
    ),
    Question(
      'What is the capital of France?',
      ['Berlin', 'London', 'Madrid', 'Paris'],
      'Paris',
    ),
    Question(
      'Which planet is known as the Red Planet?',
      ['Earth', 'Mars', 'Venus', 'Jupiter'],
      'Mars',
    ),
    Question(
      'Which gas do plants absorb from the atmosphere?',
      ['Carbon dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'],
      'Carbon dioxide',
    ),
    Question(
      'Who wrote the play "Romeo and Juliet"?',
      ['Charles Dickens', 'William Shakespeare', 'Jane Austen', 'Mark Twain'],
      'William Shakespeare',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ${_currentQuestionIndex + 1}/${_questions.length}',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 10),
        Text(
          _questions[_currentQuestionIndex].question,
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        Column(
          children: _questions[_currentQuestionIndex].options.map((option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                if (option == _questions[_currentQuestionIndex].answer) {
                  // Correct answer
                  showSnackBar(context, 'Correct!');
                } else {
                  // Incorrect answer
                  showSnackBar(context, 'Incorrect.');
                }
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Move to the next question
            setState(() {
              if (_currentQuestionIndex < _questions.length - 1) {
                _currentQuestionIndex++;
              } else {
                // Quiz completed
                showSnackBar(context, 'Quiz Completed!');
              }
            });
          },
          child: Text('Next Question'),
        ),
      ],
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final String answer;

  Question(this.question, this.options, this.answer);
}

class ListViewPage extends StatelessWidget {
  final List<Map<String, String>> imageList;

  ListViewPage(this.imageList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image List View"),
      ),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(imageList[index]["title"] ?? ""),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullImagePage(imageList[index]["img"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FullImagePage extends StatelessWidget {
  final String imageUrl;

  FullImagePage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Image View"),
      ),
      body: Center(
        child: Hero(
          tag: "image_${imageUrl}",
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
