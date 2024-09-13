# Flutter CRUD Application

## Overview

This Flutter application demonstrates a basic CRUD (Create, Read, Update, Delete) functionality. It uses Riverpod for state management and interacts with a RESTful API provided by [crudcrud.com](https://crudcrud.com/api/f5c3405b295b4d2ba7906daf241850ff).

## Features

- **Create**: Add new items to the list.
- **Read**: View the list of items.
- **Update**: Edit existing items.
- **Delete**: Remove items from the list.

## Getting Started

### Prerequisites

- Flutter SDK
- Dart
- An IDE such as Visual Studio Code or Android Studio

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/ThetMaung2002/crud.git
    ```

2. Navigate to the project directory:

    ```bash
    cd crud
    ```

3. Install the dependencies:

    ```bash
    flutter pub get
    ```

4. Run the application:

    ```bash
    flutter run
    ```

## API Integration

This application uses the following API endpoint for CRUD operations:

- **Base URL**: `https://crudcrud.com/api/f5c3405b295b4d2ba7906daf241850ff`

## Code Overview

### State Management

The application uses [Riverpod](https://riverpod.dev) for state management. Key providers and state management logic are defined in the `lib/providers` directory.

### UI Components

The UI components are located in the `lib/screens` directory. The main screen displays the list of items and provides options to add, update, and delete items.

### Networking

API calls are handled in the `lib/services` directory. This includes the implementation of functions to interact with the CRUD API.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to suggest changes or improvements.

## Contact

For any questions or feedback, please contact [thetmaung013@gmail.com](mailto:thetmaung013@gmail.com).
