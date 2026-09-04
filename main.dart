import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const WispyApp());
}

Future<void> saveScore({
  required String name,
  required int score,
}) async {
  const String googleScriptUrl =
      'https://script.google.com/macros/s/AKfycbyO9fgy9MTaVYY4YAu2ErHNvUjRnH-tIhxTrMDRd9GOZ3CXL38gpbAlEhA6wCzaIaY7Jw/exec';

  const int maxScore = 30;
  final double percentage = (score / maxScore) * 100;

  try {
    await http.post(
      Uri.parse(googleScriptUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'score': score,
        'maxScore': maxScore,
        'percentage': percentage,
      }),
    );
  } catch (e) {
    print('Could not save score: $e');
  }
}

// =====================================================
// COLORS
// =====================================================

const Color wispyRed = Color(0xFFC62828);
const Color wispyDark = Color(0xFF151515);
const Color wispyGrey = Color(0xFF555555);
const Color wispyWhite = Color(0xFFFFFFFF);

// =====================================================
// APP
// =====================================================

class WispyApp extends StatelessWidget {
  const WispyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wispy',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: wispyRed,
        ),
        scaffoldBackgroundColor: Colors.transparent,
      ),
      home: const HomePage(),
    );
  }
}

// =====================================================
// BACKGROUND
// =====================================================

class WispyBackground extends StatelessWidget {
  final Widget child;

  const WispyBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

// =====================================================
// QUESTIONS
// =====================================================

final List<Map<String, dynamic>> questions = [
  {
    'question':
        'What is the point where the x-axis and y-axis intersect called?',
    'choices': [
      'Quadrant',
      'Origin',
      'Coordinate',
      'Intercept',
    ],
    'answer': 'Origin',
    'points': 1,
  },
  {
    'question': 'Which coordinate represents the origin?',
    'choices': [
      '(1, 1)',
      '(0, 1)',
      '(1, 0)',
      '(0, 0)',
    ],
    'answer': '(0, 0)',
    'points': 1,
  },
  {
    'question':
        'In the ordered pair (-4, 7), what is the x-coordinate?',
    'choices': [
      '-4',
      '4',
      '7',
      '-7',
    ],
    'answer': '-4',
    'points': 1,
  },
  {
    'question':
        'In which quadrant is the point (5, -3) located?',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant IV',
    'points': 1,
  },
  {
    'question': 'Which point lies in Quadrant II?',
    'choices': [
      '(3, 5)',
      '(-3, 5)',
      '(-3, -5)',
      '(3, -5)',
    ],
    'answer': '(-3, 5)',
    'points': 1,
  },
  {
    'question': 'Which axis contains the point (0, -6)?',
    'choices': [
      'x-axis',
      'y-axis',
      'Both axes',
      'Neither axis',
    ],
    'answer': 'y-axis',
    'points': 1,
  },
  {
    'question':
        'What is the correct order when writing an ordered pair?',
    'choices': [
      'y-coordinate, then x-coordinate',
      'x-coordinate, then y-coordinate',
      'quadrant, then coordinates',
      'origin, then coordinates',
    ],
    'answer': 'x-coordinate, then y-coordinate',
    'points': 1,
  },
  {
    'question':
        'If a point has a positive x-coordinate and a positive y-coordinate, it is in:',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant I',
    'points': 1,
  },
  {
    'question':
        'Which point is located 4 units left and 2 units down from the origin?',
    'choices': [
      '(4, 2)',
      '(-4, 2)',
      '(-4, -2)',
      '(4, -2)',
    ],
    'answer': '(-4, -2)',
    'points': 1,
  },
  {
    'question': 'What is the y-coordinate of the point (8, -5)?',
    'choices': [
      '8',
      '-8',
      '5',
      '-5',
    ],
    'answer': '-5',
    'points': 1,
  },

  // PART II
  {
    'question': 'Identify the quadrant or axis for the point (6, 4).',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant I',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (-7, 2).',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant II',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (-5, -3).',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant III',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (4, -8).',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant IV',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (0, 9).',
    'choices': [
      'x-axis',
      'y-axis',
      'Quadrant I',
      'Origin',
    ],
    'answer': 'y-axis',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (-6, 0).',
    'choices': [
      'x-axis',
      'y-axis',
      'Quadrant III',
      'Origin',
    ],
    'answer': 'x-axis',
    'points': 1,
  },
  {
    'question': 'Identify the quadrant or axis for the point (0, 0).',
    'choices': [
      'x-axis',
      'y-axis',
      'Quadrant I',
      'Origin',
    ],
    'answer': 'Origin',
    'points': 1,
  },

  // PART III
  {
    'question': 'Point A is (2, 5). Which quadrant should A be plotted in?',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant I',
    'points': 1,
  },
  {
    'question':
        'Point B is (-4, 3). Which quadrant should B be plotted in?',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant II',
    'points': 1,
  },
  {
    'question':
        'Point C is (-3, -4). Which quadrant should C be plotted in?',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant III',
    'points': 1,
  },
  {
    'question':
        'Point D is (5, -2). Which quadrant should D be plotted in?',
    'choices': [
      'Quadrant I',
      'Quadrant II',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'Quadrant IV',
    'points': 1,
  },
  {
    'question':
        'Point E is (0, -5). Where should point E be plotted?',
    'choices': [
      'x-axis',
      'y-axis',
      'Quadrant III',
      'Quadrant IV',
    ],
    'answer': 'y-axis',
    'points': 1,
  },

  // PART IV
  {
    'question':
        'Point P is located at (-6, 4). Which statement is correct?',
    'choices': [
      'x = -6, y = 4, Quadrant II',
      'x = 6, y = 4, Quadrant I',
      'x = -6, y = -4, Quadrant III',
      'x = 4, y = -6, Quadrant IV',
    ],
    'answer': 'x = -6, y = 4, Quadrant II',
    'points': 3,
  },
  {
    'question':
        'Point Q is located at (3, -7). Which statement is correct?',
    'choices': [
      '3 units from the y-axis, 7 units from the x-axis, Quadrant IV',
      '7 units from the y-axis, 3 units from the x-axis, Quadrant I',
      '3 units from the x-axis, 7 units from the y-axis, Quadrant II',
      '3 units from the y-axis, 7 units from the x-axis, Quadrant III',
    ],
    'answer':
        '3 units from the y-axis, 7 units from the x-axis, Quadrant IV',
    'points': 3,
  },
  {
    'question':
        'A point starts at the origin and moves 5 units left and 6 units upward. What are its coordinates?',
    'choices': [
      '(5, 6)',
      '(-5, 6)',
      '(-5, -6)',
      '(5, -6)',
    ],
    'answer': '(-5, 6)',
    'points': 2,
  },
];

// =====================================================
// FLASHCARDS
// =====================================================

final List<Map<String, String>> flashcards = [
  {
    'question': 'What is the origin?',
    'answer':
        'The origin is the point where the x-axis and y-axis intersect: (0, 0).',
  },
  {
    'question': 'What is the correct order of an ordered pair?',
    'answer':
        'The x-coordinate comes first, followed by the y-coordinate: (x, y).',
  },
  {
    'question': 'What is the x-coordinate?',
    'answer':
        'The x-coordinate is the first number in an ordered pair.',
  },
  {
    'question': 'What is the y-coordinate?',
    'answer':
        'The y-coordinate is the second number in an ordered pair.',
  },
  {
    'question': 'What signs are used in Quadrant I?',
    'answer': 'Quadrant I has a positive x and positive y: (+, +).',
  },
  {
    'question': 'What signs are used in Quadrant II?',
    'answer': 'Quadrant II has a negative x and positive y: (-, +).',
  },
  {
    'question': 'What signs are used in Quadrant III?',
    'answer': 'Quadrant III has a negative x and negative y: (-, -).',
  },
  {
    'question': 'What signs are used in Quadrant IV?',
    'answer': 'Quadrant IV has a positive x and negative y: (+, -).',
  },
  {
    'question': 'Where is the point (0, 5)?',
    'answer': 'It is on the y-axis.',
  },
  {
    'question': 'Where is the point (-6, 0)?',
    'answer': 'It is on the x-axis.',
  },
  {
    'question': 'Where is the point (-4, 7)?',
    'answer': 'It is in Quadrant II.',
  },
  {
    'question': 'Where is the point (5, -3)?',
    'answer': 'It is in Quadrant IV.',
  },
];

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: WispyBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),

                  // BIGGER LOGO
                  Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      color: wispyRed,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: [
                        BoxShadow(
                          color: wispyRed.withOpacity(0.35),
                          blurRadius: 22,
                          offset: const Offset(0, 9),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.auto_awesome,
                          color: Colors.white,
                          size: 48,
                        ),
                        Positioned(
                          bottom: 17,
                          child: Container(
                            width: 72,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'W',
                                style: TextStyle(
                                  color: wispyRed,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Wispy',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: wispyDark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Grade 8 Mathematics',
                    style: TextStyle(
                      fontSize: 19,
                      color: wispyGrey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Cartesian Plane',
                    style: TextStyle(
                      fontSize: 16,
                      color: wispyRed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 45),

                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: wispyRed,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const FlashcardPage(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book_rounded),
                          SizedBox(width: 10),
                          Text(
                            'Flashcards',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 65,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: wispyRed,
                        foregroundColor: Colors.white,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const QuizSetupPage(),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_note_rounded),
                          SizedBox(width: 10),
                          Text(
                            'Start Quiz',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  const Text(
                    'Learn • Practice • Improve',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8A8699),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// QUIZ SETUP
// =====================================================

class QuizSetupPage extends StatefulWidget {
  const QuizSetupPage({super.key});

  @override
  State<QuizSetupPage> createState() => _QuizSetupPageState();
}

class _QuizSetupPageState extends State<QuizSetupPage> {
  final TextEditingController nameController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void beginQuiz() {
    final name = nameController.text.trim();

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name first.'),
          backgroundColor: wispyDark,
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(
          studentName: name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: wispyDark,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Before You Begin'),
      ),
      body: WispyBackground(
        child: Container(
          color: Colors.black.withOpacity(0.12),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 15),

                const Icon(
                  Icons.location_on_rounded,
                  size: 65,
                  color: wispyRed,
                ),

                const SizedBox(height: 10),

                const Text(
                  'Get Ready!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: wispyDark,
                  ),
                ),

                const SizedBox(height: 30),

                // NAME CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: wispyDark,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Student Name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: wispyDark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: nameController,
                        style: const TextStyle(
                          color: wispyDark,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: wispyRed,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: wispyDark,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // INSTRUCTIONS CARD
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: wispyDark,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: wispyRed,
                      width: 2,
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quiz Instructions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        '• Read each question carefully.\n'
                        '• Choose the best answer.\n'
                        '• Take your time and think carefully.\n'
                        '• The quiz contains 25 questions.\n'
                        '• The maximum score is 30 points.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: wispyRed,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: beginQuiz,
                    child: const Text(
                      'Begin Quiz →',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// QUIZ PAGE
// RED + WHITE + BLACK DESIGN
// =====================================================

class QuizPage extends StatefulWidget {
  final String studentName;

  const QuizPage({
    super.key,
    required this.studentName,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestion = 0;
  int score = 0;
  String? selectedAnswer;

  void selectAnswer(String answer) {
    if (selectedAnswer != null) {
      return;
    }

    setState(() {
      selectedAnswer = answer;

      if (answer == questions[currentQuestion]['answer']) {
        score += questions[currentQuestion]['points'] as int;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    } else {
      saveScore(
        name: widget.studentName,
        score: score,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            score: score,
            studentName: widget.studentName,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    final choices =
        List<String>.from(question['choices'] as List);

    final correctAnswer = question['answer'] as String;

    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: wispyDark,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Question ${currentQuestion + 1} / ${questions.length}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: WispyBackground(
        child: Container(
          color: Colors.black.withOpacity(0.12),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                // =========================================
                // PROGRESS BAR
                // =========================================

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: wispyDark,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value:
                          (currentQuestion + 1) /
                              questions.length,
                      minHeight: 10,
                      backgroundColor: Colors.white,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        wispyRed,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // =========================================
                // QUESTION CARD
                // =========================================

                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: wispyRed,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.22),
                        blurRadius: 15,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: wispyDark,
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                        child: Text(
                          'QUESTION ${currentQuestion + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 13,
                            letterSpacing: 1,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        question['question'] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: wispyDark,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // =========================================
                // ANSWER CHOICES
                // =========================================

                ...choices.asMap().entries.map(
                  (entry) {
                    final index = entry.key;
                    final choice = entry.value;

                    final letter =
                        String.fromCharCode(65 + index);

                    final isSelected =
                        selectedAnswer == choice;

                    final isCorrect =
                        choice == correctAnswer;

                    Color buttonColor = Colors.white;
                    Color textColor = wispyDark;
                    Color borderColor = wispyDark;

                    // GREEN = CORRECT ANSWER
if (selectedAnswer != null && isCorrect) {
  buttonColor = Colors.green;
  textColor = Colors.white;
  borderColor = Colors.green;
}

// RED = SELECTED WRONG ANSWER
else if (selectedAnswer != null &&
    isSelected &&
    !isCorrect) {
  buttonColor = wispyRed;
  textColor = Colors.white;
  borderColor = wispyRed;
}

// WHITE = NORMAL
else {
  buttonColor = Colors.white;
  textColor = wispyDark;
  borderColor = wispyDark;
}

                    return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 12),

                      child: SizedBox(
                        width: double.infinity,

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            foregroundColor: textColor,
                            elevation: 2,
                            padding:
                                const EdgeInsets.all(18),
                            alignment: Alignment.centerLeft,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16),
                              side: BorderSide(
                                color: borderColor,
                                width: 2,
                              ),
                            ),
                          ),

                          onPressed: () {
                            selectAnswer(choice);
                          },

                          child: Row(
                            children: [
                              // LETTER BOX
                              Container(
                                width: 38,
                                height: 38,
                                alignment: Alignment.center,

                                decoration:
                                    BoxDecoration(
                                  color:
                                      selectedAnswer !=
                                              null &&
                                          isCorrect
                                      ? Colors.white
                                      : selectedAnswer !=
                                                  null &&
                                              isSelected
                                          ? wispyRed
                                          : wispyDark,

                                  borderRadius:
                                      BorderRadius.circular(10),
                                ),

                                child: Text(
                                  letter,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Text(
                                  choice,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:
                                        FontWeight.w600,
                                    color: textColor,
                                  ),
                                ),
                              ),

                              // RESULT ICON
                              if (selectedAnswer != null &&
                                  isCorrect)
                                const Icon(
                                  Icons.check_circle_rounded,
                                  color: Colors.white,
                                  size: 25,
                                )
                              else if (selectedAnswer != null &&
                                  isSelected &&
                                  !isCorrect)
                                const Icon(
                                  Icons.cancel_rounded,
                                  color: wispyRed,
                                  size: 25,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 8),

                // =========================================
                // FEEDBACK
                // =========================================

                if (selectedAnswer != null)
                  Container(
                    padding: const EdgeInsets.all(17),

                    decoration: BoxDecoration(
                      color: selectedAnswer == correctAnswer
                          ? wispyRed
                          : wispyDark,

                      borderRadius:
                          BorderRadius.circular(16),

                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),

                    child: Row(
                      children: [
                        Icon(
                          selectedAnswer == correctAnswer
                              ? Icons.check_circle_rounded
                              : Icons.info_rounded,
                          color: Colors.white,
                          size: 28,
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            selectedAnswer == correctAnswer
                                ? 'Correct!'
                                : 'Correct answer: $correctAnswer',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // =========================================
                // NEXT BUTTON
                // =========================================

                if (selectedAnswer != null)
                  SizedBox(
                    height: 58,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: wispyRed,
                        foregroundColor: Colors.white,
                        elevation: 4,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: nextQuestion,

                      child: Text(
                        currentQuestion ==
                                questions.length - 1
                            ? 'See Results'
                            : 'Next Question →',

                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// RESULTS PAGE
// =====================================================

class ResultPage extends StatelessWidget {
  final int score;
  final String studentName;

  const ResultPage({
    super.key,
    required this.score,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    const totalPoints = 30;

    final percentage =
        (score / totalPoints) * 100;

    String message;

    if (percentage >= 90) {
      message = 'Excellent work!';
    } else if (percentage >= 75) {
      message = 'Great job!';
    } else if (percentage >= 60) {
      message = 'Good effort! Keep practicing!';
    } else {
      message = 'Keep studying — you can do it!';
    }

    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: wispyDark,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Quiz Results'),
      ),

      body: WispyBackground(
        child: Container(
          color: Colors.black.withOpacity(0.12),

          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),

              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  // TROPHY
                  Container(
                    width: 110,
                    height: 110,

                    decoration: BoxDecoration(
                      color: wispyRed,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: wispyDark,
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.emoji_events_rounded,
                      color: Colors.white,
                      size: 58,
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    'Quiz Complete!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: wispyDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Great job, $studentName!',
                    style: const TextStyle(
                      fontSize: 20,
                      color: wispyDark,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // SCORE CARD
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 25,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(25),

                      border: Border.all(
                        color: wispyRed,
                        width: 4,
                      ),
                    ),

                    child: Column(
                      children: [
                        const Text(
                          'FINAL SCORE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                            color: wispyDark,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          '$score / $totalPoints',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: wispyRed,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: wispyDark,
                            borderRadius:
                                BorderRadius.circular(20),
                          ),
                          child: Text(
                            '${percentage.toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // MESSAGE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: wispyDark,
                      borderRadius:
                          BorderRadius.circular(18),
                    ),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 35),

                  // TRY AGAIN
                  SizedBox(
                    width: 220,
                    height: 52,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: wispyRed,
                        foregroundColor: Colors.white,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuizPage(
                              studentName: studentName,
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        'Try Again',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // HOME
                  SizedBox(
                    width: 220,
                    height: 52,

                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: wispyDark,
                        side: const BorderSide(
                          color: wispyDark,
                          width: 2,
                        ),
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16),
                        ),
                      ),

                      onPressed: () {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                      },

                      child: const Text(
                        'Back to Home',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// FLASHCARD PAGE
// RED + WHITE + BLACK DESIGN
// =====================================================

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() =>
      _FlashcardPageState();
}

class _FlashcardPageState
    extends State<FlashcardPage> {
  int currentCard = 0;
  bool showAnswer = false;

  void nextCard() {
    setState(() {
      if (currentCard < flashcards.length - 1) {
        currentCard++;
      } else {
        currentCard = 0;
      }

      showAnswer = false;
    });
  }

  void previousCard() {
    setState(() {
      if (currentCard > 0) {
        currentCard--;
      } else {
        currentCard = flashcards.length - 1;
      }

      showAnswer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final card = flashcards[currentCard];

    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: wispyDark,
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Flashcards',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: WispyBackground(
        child: Container(
          color: Colors.black.withOpacity(0.18),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                // =========================================
                // HEADER
                // =========================================

                Container(
                  width: double.infinity,

                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),

                  decoration: BoxDecoration(
                    color: wispyDark,
                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,

                        decoration: BoxDecoration(
                          color: wispyRed,
                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        child: const Icon(
                          Icons.style_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'CARTESIAN PLANE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              'Card ${currentCard + 1} of ${flashcards.length}',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                // =========================================
                // PROGRESS
                // =========================================

                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10),

                  child: LinearProgressIndicator(
                    value: (currentCard + 1) /
                        flashcards.length,

                    minHeight: 9,

                    backgroundColor:
                        Colors.white,

                    valueColor:
                        const AlwaysStoppedAnimation<Color>(
                      wispyRed,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // =========================================
                // FLASHCARD
                // =========================================

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        showAnswer = !showAnswer;
                      });
                    },

                    child: Container(
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(28),

                        border: Border.all(
                          color: wispyRed,
                          width: 4,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(
                              0.3,
                            ),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Column(
                        children: [
                          // RED TOP BAR
                          Container(
                            width: double.infinity,

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 15,
                            ),

                            decoration:
                                const BoxDecoration(
                              color: wispyRed,

                              borderRadius:
                                  BorderRadius.only(
                                topLeft:
                                    Radius.circular(23),
                                topRight:
                                    Radius.circular(23),
                              ),
                            ),

                            child: Text(
                              showAnswer
                                  ? 'ANSWER'
                                  : 'QUESTION',

                              textAlign:
                                  TextAlign.center,

                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight:
                                    FontWeight.w900,
                                letterSpacing: 2,
                              ),
                            ),
                          ),

                          // CARD CONTENT
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(
                                28,
                              ),

                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment
                                        .center,

                                children: [
                                  Container(
                                    width: 76,
                                    height: 76,

                                    decoration:
                                        const BoxDecoration(
                                      color: wispyDark,
                                      shape:
                                          BoxShape.circle,
                                    ),

                                    child: Icon(
                                      showAnswer
                                          ? Icons
                                              .lightbulb_rounded
                                          : Icons
                                              .help_outline_rounded,

                                      color:
                                          Colors.white,

                                      size: 42,
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 28),

                                  Text(
                                    showAnswer
                                        ? card['answer']!
                                        : card['question']!,

                                    textAlign:
                                        TextAlign.center,

                                    style:
                                        const TextStyle(
                                      fontSize: 24,
                                      fontWeight:
                                          FontWeight.w800,
                                      color: wispyDark,
                                      height: 1.35,
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 30),

                                  // TAP TO FLIP
                                  Container(
                                    padding:
                                        const EdgeInsets
                                            .symmetric(
                                      horizontal: 18,
                                      vertical: 11,
                                    ),

                                    decoration:
                                        BoxDecoration(
                                      color: wispyRed,
                                      borderRadius:
                                          BorderRadius
                                              .circular(
                                        25,
                                      ),
                                    ),

                                    child: Row(
                                      mainAxisSize:
                                          MainAxisSize.min,

                                      children: [
                                        const Icon(
                                          Icons
                                              .touch_app_rounded,
                                          color:
                                              Colors.white,
                                          size: 19,
                                        ),

                                        const SizedBox(
                                            width: 8),

                                        Text(
                                          showAnswer
                                              ? 'Tap for question'
                                              : 'Tap to reveal answer',

                                          style:
                                              const TextStyle(
                                            color:
                                                Colors.white,
                                            fontSize: 13,
                                            fontWeight:
                                                FontWeight
                                                    .bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // BLACK BOTTOM BAR
                          Container(
                            width: double.infinity,

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 10,
                            ),

                            decoration:
                                const BoxDecoration(
                              color: wispyDark,

                              borderRadius:
                                  BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(23),
                                bottomRight:
                                    Radius.circular(23),
                              ),
                            ),

                            child: Text(
                              showAnswer
                                  ? 'Review the answer'
                                  : 'Think before you flip!',

                              textAlign:
                                  TextAlign.center,

                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // =========================================
                // NAVIGATION
                // =========================================

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: previousCard,

                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        ),

                        label:
                            const Text('Previous'),

                        style:
                            OutlinedButton.styleFrom(
                          backgroundColor:
                              Colors.white,

                          foregroundColor:
                              wispyDark,

                          side:
                              const BorderSide(
                            color: wispyDark,
                            width: 2,
                          ),

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 15,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              16,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: nextCard,

                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                        ),

                        label:
                            const Text('Next'),

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              wispyRed,

                          foregroundColor:
                              Colors.white,

                          elevation: 3,

                          padding:
                              const EdgeInsets
                                  .symmetric(
                            vertical: 15,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  'Tap the card to flip it',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}