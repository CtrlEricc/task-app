# Task App

![Screenshot_1737692519](https://github.com/user-attachments/assets/95701a87-8bd9-4f80-a83d-195fc4731acb) ![Screenshot_1737689689](https://github.com/user-attachments/assets/efb19da6-2ada-4a83-87d4-a1236bce888c)       ![Screenshot_1737689633](https://github.com/user-attachments/assets/208477c1-7d69-4b41-8c6c-630bbdc4b9cd)  


This documentation provides information about the structure, functionality, and development best practices of the "Task App" application. The app was developed in Flutter, following the MVVM design pattern and using Provider for state management.

## App Overview
The "Task App" allows users to manage their tasks efficiently and features a user-friendly interface. It offers functionalities such as:
- task creation by category,
- marking tasks as completed or not, and
- task deletion.

## Running the App
Before starting, ensure you have the latest version of the Flutter SDK and an emulator properly installed and configured [as per the official documentation](https://docs.flutter.dev/get-started/install), and then follow these steps:
- Clone this repository;
- Run `flutter pub get` in the CLI from the project directory;
- Done! You can now test the Flutter app.

## Running the Code Challenges
To run the proposed challenges in "Parte 1" and "Parte 3," follow these steps:
- In the CLI, navigate to the app directory by executing `cd desafios`;
- Then run `dart desafio_1.dart` to execute the function proposed in "Parte 1," or  
- Run `dart desafio_3.dart` to execute the function proposed in "Parte 3";  
- You can then test the proposed solutions.

## Design Pattern and State Management
For this application, the **MVVM** (Model-View-ViewModel) design pattern was chosen, along with **Provider** (which simplifies state management and provides reactive notifications), [both recommended by the official Flutter documentation](https://docs.flutter.dev/app-architecture). They provide the following advantages:

**Clarity in Responsibility Separation:** The MVVM pattern organizes the code into three main layers:
- **Model:** Represents the application's data and its manipulation logic. In this case, it includes models like `TaskModel` and persistence entities like `TaskEntity`.
- **View:** The user interface (UI) that reflects the data provided by the ViewModel and delegates user actions.
- **ViewModel:** Acts as the bridge between the View and the Model. It manages the state and business logic, providing formatted data to the UI and reacting to interactions.

**Reactivity:** Using Provider for state management allows Views to be automatically notified of data changes in the ViewModel, eliminating the need for manual state management in the UI.

**Scalability:** The clear separation of responsibilities in MVVM facilitates the introduction of new features and screens. The ViewModel encapsulates the logic and can be independently tested, ensuring that the UI remains decoupled from the business rules.

## Data Flow
![Screenshot 2025-01-23 at 23 47 22](https://github.com/user-attachments/assets/5b402344-bb04-420e-9222-28ede3e7c276)

The data flow in the app follows the principles of the **MVVM** (Model-View-ViewModel) architectural pattern described in the official Flutter documentation. This pattern is used to maintain a clear separation between business logic, state management, and the user interface, promoting organization and scalability.

**General Data Flow Structure**
1. **User Interactions:**
   - The interaction begins in the View (e.g., `HomeScreen` or `AddTaskScreen`), where the user performs actions like adding, editing, or deleting a task.
   - The actions are forwarded to the ViewModel through specific methods.

2. **Processing in the ViewModel:**
   - The ViewModel (e.g., `HomeViewModel` or `AddTaskViewModel`) acts as a bridge between the View and the Model. It processes the requests received from the View and interacts with the Repository to fetch, save, or update the data.
   - The ViewModel also manages the application's state and exposes formatted data to the View via observable properties.

3. **Interaction with the Repository:**
   - The Repository (`TaskRepository`) encapsulates persistence calls and abstracts data access.
   - It interacts directly with the DAO (`TaskDao`) to perform local database operations using Drift or simulates data initialization via mock data.

4. **Data Updates:**
   - After processing, the ViewModel notifies the View about data changes via Provider, which automatically updates the user interface with the new state.

5. **UI Rendering:**
   - The View observes the state managed by the ViewModel and reflects data changes reactively, ensuring the UI is always synchronized with the current application state.

## Directory Structure
```
lib/
├── data/
│   ├── datasources/
│   │   ├── local/
│   │   │   ├── dao/
│   │   │   │   └── task_dao.dart
│   │   │   └── local_database.dart
│   ├── mock_data.dart
│   ├── repositories/
│   │   └── task_repository.dart
├── domain/
│   ├── entities/
│   │   └── task_entity.dart
│   ├── enums/
│   │   └── task_type_enum.dart
│   ├── models/
│   │   └── task_model.dart
│
├── ui/
│   ├── add_task/
│   │   ├── view_model/
│   │   │   └── add_task_viewmodel.dart
│   │   └── widgets/
│   │       └── add_task_screen.dart
│   ├── core/
│   │   ├── themes/
│   │   │   ├── colors.dart
│   │   │   └── theme.dart
│   │   ├── widgets/
│   │   │   ├── custom_dropdown_form_field.dart
│   │   │   ├── custom_elevated_button.dart
│   │   │   ├── custom_text_form_field.dart
│   │   │   └── custom_toast.dart
│   ├── home/
│   │   ├── view_model/
│   │   │   └── home_viewmodel.dart
│   │   └── widgets/
│   │   │   ├── task_tile.dart
│   │   │   └── home_screen.dart
│   ├── splash/
│   │   └── widgets/
│   │       └── splash_screen.dart
├── utils/
│   └── repository_exception.dart
├── routes.dart
├── main.dart
```

## Best Practices
The best practices followed in this application include:

- Use of a robust architecture (MVVM), recommended by the Flutter team.
- Clear separation of responsibilities.
- Reactive state management with Provider.
- Reusable components and consistent visual theming.
- Error handling and user feedback.

These practices make the application scalable, maintainable, and provide a great user experience.

## Libraries/Packages Used
**[drift](https://pub.dev/packages/drift)**:  
Package for managing SQLite databases in Flutter, with reactive APIs and support for complex queries.  

**[path](https://pub.dev/packages/path)**:  
Library for file and directory path manipulation, allowing operations like combination and normalization.  

**[path_provider](https://pub.dev/packages/path_provider)**:  
Package for accessing system-specific directory paths, such as cache or local storage.  

**[provider](https://pub.dev/packages/provider)**:  
Popular package for state management, using dependency injection and reactive notifications.  

**[flutter_svg](https://pub.dev/packages/flutter_svg)**:  
Library for rendering SVG files in Flutter, allowing scalable vector graphics to be displayed.  

**[uuid](https://pub.dev/packages/uuid)**:  
Package for generating universally unique identifiers (UUIDs), commonly used for creating unique IDs.  

**[sqlite3_flutter_libs](https://pub.dev/packages/sqlite3_flutter_libs)**:  
Library that includes SQLite binaries required for Flutter applications, optimizing local database usage.  

**[shared_preferences](https://pub.dev/packages/shared_preferences)**:  
Package for simple data storage (key-value), ideal for user preferences and settings.  

**[http](https://pub.dev/packages/http)**:  
Library for making HTTP requests, used for consuming REST APIs and handling web calls.  

## The end 👨‍💻
This documentation provides an overview of the "Task App", its architecture, code structure, and best practices. It should serve as a helpful guide for developers aiming to understand and contribute to the application's codebase.
