# Modern Quran App 🕌

A comprehensive, modern Islamic app featuring Quran reading, audio recitations, Islamic literature, TikTok-style reminders, and community features.

## Features

### 📖 Quran Reading & Listening
- **Text Display**: Full Quran in Arabic with clear Madani script
- **Multiple Themes**: Light/dark mode with adjustable fonts
- **Translations**: Multi-language support (English, Urdu, French, etc.)
- **Audio Recitation**: Choose from leading reciters (Qaris)
- **Smart Playback**: Verse-by-verse with text highlighting
- **Memorization Mode**: Loop verses, hide text for testing
- **Progress Tracking**: Bookmarks, reading goals, and progress analytics

### 📚 Islamic Literature Library
- **E-Books**: Hadith collections, classical Islamic texts, pamphlets
- **Audiobooks**: Listen to popular Islamic books
- **Personal Library**: Save and organize your reading list
- **Advanced Search**: Search by book, author, topic, or keyword

### 🎬 TikTok-Style Islamic Content
- **Short Reminders**: Daily ayah, hadith, dua in video/audio format
- **Swipeable Feed**: Vertical scrolling like TikTok/Instagram Reels
- **Personalized Algorithm**: Based on your likes and follows
- **User Engagement**: Like, share, comment, and save content
- **Creator Tools**: Upload and share Islamic reminders (moderated)

### 👥 Community & Social Features
- **User Accounts**: Sign up with email, phone, or social login
- **Follow System**: Follow favorite reciters and content creators
- **Activity Feed**: Updates from followed creators
- **Profile Customization**: Avatar, country, favorite reciter

### 🔧 Additional Utilities
- **Prayer Times**: Accurate local schedules with Adhan notifications
- **Qibla Finder**: Compass for prayer direction
- **Islamic Calendar**: Special dates and Ramadan reminders
- **AI Assistant**: Ask questions about Islamic topics
- **Quizzes**: Interactive Quran and Islamic knowledge tests
- **Offline Access**: Download content for offline use

## Technology Stack

- **Framework**: Flutter 3.x
- **State Management**: Bloc/Cubit
- **Backend**: Firebase (Authentication, Firestore, Storage)
- **Audio**: Just Audio package
- **Video**: Video Player package
- **Local Storage**: Hive
- **Navigation**: Go Router
- **UI**: Material 3 Design with custom Islamic theming

## Project Structure

```
lib/
├── core/                 # Core utilities and constants
├── data/                # Data layer (repositories, data sources)
├── domain/              # Business logic (entities, use cases)
├── presentation/        # UI layer (screens, widgets, bloc)
├── shared/              # Shared widgets and utilities
└── main.dart           # App entry point
```

## Getting Started

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd modern-quran-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## Development Guidelines

- Follow Clean Architecture principles
- Use Bloc pattern for state management
- Implement proper error handling
- Write unit and widget tests
- Follow Material 3 design guidelines
- Ensure accessibility compliance

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Write tests
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

Built with ❤️ for the Muslim community