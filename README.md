# Countries App

A Flutter application that displays information about countries around the world using Clean
Architecture principles.

## Architecture

This project follows Clean Architecture with three main layers:

### 1. Domain Layer

Contains business logic and rules of the application:

- Entities: Core business objects (Country)
- Repositories: Abstract definitions for data operations
- Use Cases: Application-specific business rules

### 2. Data Layer

Handles data management:

- Models: Data representations of entities
- Repositories: Implementations of domain repositories
- Data Sources: Remote and local data providers

### 3. Presentation Layer

Manages UI and state:

- BLoC: Business Logic Components for state management
- Pages: UI screens
- Widgets: Reusable UI components

## Key Features

- Fetching countries data from REST API
- Display list of countries with flags
- Error handling and network connectivity checks
- State management with BLoC pattern
- Unit tests for critical components

## Dependencies

- flutter_bloc: State management
- get_it: Dependency injection
- dartz: Functional programming concepts
- dio: HTTP client
- equatable: Value equality
- internet_connection_checker: Network connectivity
- cached_network_image: Image loading and caching
- json_annotation: JSON serialization
- mockito & bloc_test: Testing utilities

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate necessary files
4. Run `flutter run` to start the application

## Testing

Run tests with:
flutter test

## API

The app uses a custom API endpoint to fetch country data:
https://raw.githubusercontent.com/PouriaMoradi021/countries-api/refs/heads/main/countries.json

## Development Approach

This project was developed using:

1. Test-Driven Development (TDD) approach
2. SOLID principles
3. Clean Architecture patterns
4. BLoC pattern for state management