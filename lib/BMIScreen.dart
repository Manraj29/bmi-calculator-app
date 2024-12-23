import 'package:flutter/material.dart';
import 'package:bmi_calculator/NavBar.dart';
import 'package:bmi_calculator/Results.dart';

class BMIScreen extends StatefulWidget {
  final Function changeTheme;
  final bool light;
  const BMIScreen({super.key, required this.changeTheme, required this.light});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  int weight = 0;
  int height = 0;
  int age = 0;
  String gender = ''; // Add a variable to store the selected gender

  void calculateBMI() {
    if (weight <= 0 || height <= 0 || age < 2 || age > 120 || gender == '') {
      if (weight <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid weight')),
        );
      }
      if (height <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid height')),
        );
      }
      if (age < 2 || age > 120) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid age')),
        );
      }
      if (gender == '') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select gender')),
        );
      } // Return 0 if weight or height is not set
    }

    double heightInMeters = height / 100; // Convert cm to meters
    double bmi = weight / (heightInMeters * heightInMeters);

    String interpretation = '';

    if (age >= 20) {
      // Adult BMI categories (same for males and females)
      if (bmi < 18.5) {
        interpretation = 'Underweight';
      } else if (bmi < 25) {
        interpretation = 'Normal weight';
      } else if (bmi < 30) {
        interpretation = 'Overweight';
      } else {
        interpretation = 'Obese';
      }
    } else {
      // Child BMI interpretation based on gender
      if (gender == 'male') {
        if (bmi < 16) {
          interpretation = 'Underweight (Male)';
        } else if (bmi < 20) {
          interpretation = 'Normal weight (Male)';
        } else if (bmi < 26) {
          interpretation = 'Overweight (Male)';
        } else {
          interpretation = 'Obese (Male)';
        }
      } else if (gender == 'female') {
        if (bmi < 14) {
          interpretation = 'Underweight (Female)';
        } else if (bmi < 18) {
          interpretation = 'Normal weight (Female)';
        } else if (bmi < 24) {
          interpretation = 'Overweight (Female)';
        } else {
          interpretation = 'Obese (Female)';
        }
      }
    }
    // print('BMI: $bmi');
    // print('Interpretation: $interpretation');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Calculating...'),
          // height should be 100
          insetPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          content: Container(
              height: 100,
              child: Center(child: const CircularProgressIndicator())),
        );
      },
    );
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Results(bmi: bmi, interpretation: interpretation, weight: weight, height: height, age: age, gender: gender),
        ),
      );
    });
  }


    @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: NavBar(changeTheme: widget.changeTheme, light: widget.light),
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'BMI Calculator',
          style: theme.appBarTheme.titleTextStyle, // Use current theme titleLarge text style
        ),
      ),
      body: Center(
        child: SingleChildScrollView(  // Wrap the body in a SingleChildScrollView
          child: Padding(
            // padding left, right only
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Body Mass Index (BMI) Calculator',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 10),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Height (cm)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              height = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Weight (kg)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              weight = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Age (ages: 2-120)',
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (String value) {
                            setState(() {
                              age = int.tryParse(value) ?? 0;
                            });
                          },
                        ),
                      ),
                      // Gender radio buttons
                      Row(
                        children: <Widget>[
                          Radio<String>(
                            value: 'male',
                            groupValue: gender,
                            onChanged: (String? value) {
                              setState(() {
                                gender = value!; // Update
                              });
                            },
                          ),
                          const Text('Male'),
                          Radio<String>(
                            value: 'female',
                            groupValue: gender,
                            onChanged: (String? value) {
                              setState(() {
                                gender =
                                    value!; // Update gender when a radio is selected
                              });
                            },
                          ),
                          const Text('Female'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          calculateBMI();
                        },
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          width: 80,
                          height: 35,
                          child: Center(
                            child: Text('Calculate'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
