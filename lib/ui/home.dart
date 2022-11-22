import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemycoursepartquiz/provider/quizprovider.dart';
import 'package:udemycoursepartquiz/question/questions.dart';

class QuizApp extends StatelessWidget {
  QuizApp({super.key});
  List questionBank = [
    Question.name(
        "The ratio of width of our National flag to its length is 2:3", true),
    Question.name("COWS ARE CONSIDERED SACRED IN INDIA", true),
    Question.name(
        "THE CITY OF VARANASI IS BELIEVED TO BE ONE OF THE OLDEST LIVING CITIES IN THE WORLD",
        true),
    Question.name("INDIA IS HOME TO THE FAMOUS HOLI FESTIVAL", true),
    Question.name(
        "INDIA HAS THE THIRD HIGHEST AMOUNT OF BILLIONAIRES IN THE WORLD",
        true),
    Question.name(
        "WHEN FINISHED, THE CHENAB BRIDGE WILL BE THE HIGHEST IN THE WORLD",
        true),
    Question.name(
        "INDIA IS HOME TO THE WETTEST INHABITED PLACE ON EARTH", true),
    Question.name(
        "Shahjahan did not cut hands of workers who built Taj ", true),
    Question.name(
        "'Natya - Shastra' the main source of India's classical dances was written by Bharat muni",
        true),
    Question.name("'Dandia' is a popular dance of Gujarat", true),
    Question.name(
        "The words 'Satyameva Jayate' inscribed below the base plate of the emblem of India are taken from Mundak Upanishad",
        true),
    Question.name(
        "The Rath Yatra at Puri is celebrated in honour of which Hindu deity Shiva",
        false),
    Question.name("The book of Parsis is Gita", false),
    Question.name(
        "	'Kathakali' is a folk dance prevalent in the state Kerala", true),
    Question.name("The National Anthem was first sung in the year 1914", false),
    Question.name("Thillana is a format of Bharatanatyam", true),
    Question.name("Kathak is a classical dance of North India", true),
    Question.name("The head quarters of Sahitya Akademi is at Chennai", false),
    Question.name(
        "The dance encouraged and performance from the temple of Thanjavur was Bharatanatyam",
        true),
    Question.name(
        "The last Mahakumbh of the 20th century was held at Ujjain", false),
    Question.name("The National Song of India was composed by Iqbal", false),
    Question.name(
        "the first Indian citizen to win the Booker Prize was Arundhati Roy",
        true),
    Question.name("the last Mughal emperor of India was Bahādur Shāh II", true),
    Question.name("the Kargil War take place in the year 1999", true),
    Question.name(
        "Indian city hosted the first Kabaddi World Cup was Mumbai", true),
    Question.name(
        "the first Indian woman to be elected as President of United Nations General Assembly was Vijay Lakshmi Pandit",
        true),
    Question.name(" Indian festival is associated with colors is Holi", true),
    Question.name(
        " the only Indian cricketer to have scored 5000 runs in Test Cricket was Kapil Dev",
        true),
    Question.name("the Great Stupa situated in Madhya Pradesh", true),
    Question.name(
        " Indian festival is known as the festival of lights Diwali", true),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "True Citizen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.yellow,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/image/flag.png",
                width: 250,
                height: 180,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.0),
                    border: Border.all(
                        color: Colors.grey.shade400, style: BorderStyle.solid)),
                height: 120,
                child: Center(
                  child: Consumer<QuizProvider>(
                    builder: (context, value, child) {
                      return Text(
                        questionBank[value.currentIndex % questionBank.length]
                            .questionText,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    _checked(true, context);
                  },
                  fillColor: Colors.green,
                  child: const Icon(Icons.check),
                ),
                RawMaterialButton(
                  onPressed: () {
                    _checked(false, context);
                  },
                  fillColor: Colors.green,
                  child: const Icon(Icons.clear),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Provider.of<QuizProvider>(context, listen: false)
                        .nextQuestion();
                  },
                  fillColor: Colors.green,
                  child: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  _checked(bool userChoice, BuildContext context) {
    if (userChoice ==
        questionBank[
                Provider.of<QuizProvider>(context, listen: false).currentIndex]
            .isCorrect) {
      const snack = SnackBar(
        duration: Duration(milliseconds: 300),
        content: Text(
          "The Answer is Correct",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snack);
    } else {
      const snackB = SnackBar(
        duration: Duration(milliseconds: 300),
        content: Text("The Answer is Wrong",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackB);
    }
  }
}
