# BMI Calculator App

A simple and interactive Flutter application to calculate and interpret Body Mass Index (BMI). The app supports dynamic themes (light/dark mode), allows users to input their details (gender, age, height, and weight), and provides BMI results with interpretations tailored for both adults and children.

---

## Features

- **Dynamic Light/Dark Mode**: Users can toggle between light and dark themes for a personalized experience.
- **Gender Selection**: The app allows users to select their gender for more accurate interpretation of BMI results.
- **Age and Child-Specific Interpretation**: The BMI calculation considers both age and gender to provide interpretations for adults and children.
- **Smooth Navigation**: Includes a loading screen before displaying results to enhance the user experience.
- **Simple and Intuitive UI**: A clean design for easy input and understanding of BMI results.
- **Proper Error Handling**: The app validates user input and displays error messages for incorrect data.

---

## Screenshots

| Home Screen | Navigation Bar | Result Screen | About BMI |
|:-----------:|:-------------:|:---------:|:--------------:|
| <img src="https://github.com/user-attachments/assets/5b975c16-f5be-414d-9a40-30ea39948c4d" alt="home.png" width="300px"/>  | <img src="https://github.com/user-attachments/assets/f2d56394-25ef-40d8-900e-2d733b3c6c3c" alt="navbar.png" width="300px"/> | <img src="https://github.com/user-attachments/assets/93d16667-686c-41c3-8bc2-0a505c386a0d" alt="result.png" width="300px" /> | <img src="https://github.com/user-attachments/assets/903acf8f-56ad-48fd-bef0-860597e2244c" alt="about.png" width="300px" />


| Light Mode | Dark Mode |
|:----------:|:---------:|
| <img src="https://github.com/user-attachments/assets/01225329-77f9-43b8-8435-19ad35d63636" alt="light.png" width="300px" /> | <img src="https://github.com/user-attachments/assets/3ab15c62-cf61-4452-b5e9-e60dbd4abd44" alt="dark.png" width="300px" /> |

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
