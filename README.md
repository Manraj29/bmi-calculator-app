# BMI Calculator App

A simple and interactive Flutter application to calculate and interpret Body Mass Index (BMI). The app supports dynamic themes (light/dark mode), allows users to input their details (gender, age, height, and weight), and provides BMI results with interpretations tailored for both adults and children.

---

## Features

- **Dynamic Light/Dark Mode**: Users can toggle between light and dark themes for a personalized experience.
- **Gender Selection**: The app allows users to select their gender for more accurate interpretation of BMI results.
- **Age and Child-Specific Interpretation**: The BMI calculation considers both age and gender to provide interpretations for adults and children.
- **Smooth Navigation**: Includes a loading screen before displaying results to enhance the user experience.
- **Simple and Intuitive UI**: A clean design for easy input and understanding of BMI results.

---

## Screenshots

| Home Screen | Result Screen | About BMI | Navigation Bar |
|:-----------:|:-------------:|:---------:|:--------------:|
| home.png    | result.png    | about.png | navbar.png     |

| Light Mode | Dark Mode |
|:----------:|:---------:|
| light.png  | dark.png  |

---

## How to Use the App

1. Enter your **age**, **weight** (in kg), and **height** (in cm).
2. Select your **gender** using the radio buttons.
3. Press the **Calculate BMI** button.
4. Wait for the loading screen to display your result.
5. View your BMI and interpretation on the result screen.

---

## Technologies Used

- **Flutter**: Cross-platform development framework.
- **Dart**: Programming language used with Flutter.
- **Material Design**: UI components to build a visually appealing app.

---

## How BMI is Calculated
Example Calculations:
- **Adult Male (25 years, 178 cm, 69.8 kg):**
    - BMI = 24.2 (Normal weight)
- **Adult Female (35 years, 162.5 cm, 59.9 kg):**
    - BMI = 22.1 (Normal weight)
- **Child (10 years, 142.5 cm, 38.6 kg):**
    - BMI-for-age percentile = 50th percentile (Normal weight)

---

## Project Structure

```
lib/
|-- main.dart
|-- BMIScreen.dart        # Home screen for inputting details
|-- BMIResultScreen.dart  # Result screen showing BMI and interpretation
|-- AboutBMI.dart         # Additional information about BMI
|-- NavBar.dart           # Navigation bar for app-wide navigation
```

---

## How to Run the Project

1. Clone this repository:

   ```bash
   git clone https://github.com/Manraj29/bmi-calculator-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd bmi-calculator-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

---