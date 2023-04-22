import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({Key? key, required this.summaryData})
      : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData
              .map(
                (question) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (question['correct_answer'] ==
                                  question['user_answer'])
                              ? const Color.fromARGB(255, 126, 190, 238)
                              : const Color.fromARGB(255, 244, 113, 238)),
                      width: 30,
                      height: 30,
                      child: Text(
                        ((question['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            question['question'] as String,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 236, 236, 236),
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            question['user_answer'] as String,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 201, 153, 251),
                            ),
                          ),
                          Text(
                            question['correct_answer'] as String,
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 126, 190, 238),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
