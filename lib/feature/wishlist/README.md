# Wishlist Feature

A comprehensive wishlist feature for the AI Movie App, implemented using Clean Architecture principles with BLoC pattern for state management.

## 🏗️ Architecture Overview

The wishlist feature follows Clean Architecture with the following layers:

### Domain Layer
- **Entities**: Core business objects (`WishlistItem`)
- **Repositories**: Abstract interfaces defining data operations
- **Use Cases**: Business logic operations

### Data Layer
- **Data Sources**: Remote (Supabase) and Local (SharedPreferences) implementations
- **Models**: Data transfer objects extending domain entities
- **Repository Implementation**: Concrete implementation of repository interface

### Presentation Layer
- **Cubit**: State management using BLoC pattern
- **Views**: UI components and screens
- **Widgets**: Reusable UI components

## 📁 File Structure

```
lib/feature/wishlist/
├── domain/
│   ├── entities/
│   │   └── wishlist_item.dart
│   ├── repositories/
│   │   └── wishlist_repository.dart
│   └── usecases/
│       ├── add_to_wishlist_usecase.dart
│       ├── remove_from_wishlist_usecase.dart
│       ├── get_wishlist_items_usecase.dart
│       ├── is_in_wishlist_usecase.dart
│       ├── clear_wishlist_usecase.dart
│       └── get_wishlist_count_usecase.dart
├── data/
│   ├── datasources/
│   │   ├── wishlist_remote_data_source.dart
│   │   └── wishlist_local_data_source.dart
│   ├── models/
│   │   └── wishlist_item_model.dart
│   └── repositories/
│       └── wishlist_repository_impl.dart
├── presentation/
│   ├── cubit/
│   │   ├── wishlist_cubit.dart
│   │   ├── wishlist_event.dart
│   │   └── wishlist_state.dart
│   ├── views/
│   │   └── wishlist_view.dart
│   └── widgets/
│       ├── wishlist_item_widget.dart
│       └── wishlist_button.dart
└── di/
    └── wishlist_injection.dart
```

## 🚀 Features

### Core Functionality
- ✅ Add movies to wishlist
- ✅ Remove movies from wishlist
- ✅ View all wishlist items
- ✅ Check if movie is in wishlist
- ✅ Clear entire wishlist
- ✅ Get wishlist count
- ✅ Offline support with local storage
- ✅ Real-time synchronization with Supabase

### UI Components
- ✅ Modern, responsive design
- ✅ Pull-to-refresh functionality
- ✅ Loading states and error handling
- ✅ Empty state with call-to-action
- ✅ Confirmation dialogs for destructive actions
- ✅ Toast notifications for user feedback
- ✅ Reusable wishlist button component

## 🛠️ Setup Instructions

### 1. Database Setup (Supabase)

Create a `wishlist` table in your Supabase database:

```sql
CREATE TABLE wishlist (
  id TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  movie_id TEXT NOT NULL,
  movie JSONB NOT NULL,
  added_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(user_id, movie_id)
);

-- Enable Row Level Security
ALTER TABLE wishlist ENABLE ROW LEVEL SECURITY;

-- Create policy for users to manage their own wishlist
CREATE POLICY "Users can manage their own wishlist" ON wishlist
  FOR ALL USING (auth.uid()::text = user_id);
```

### 2. Dependency Injection

Add the wishlist dependencies to your main app initialization:

```dart
// In your main.dart or service locator setup
import 'package:ai_movie_app/feature/wishlist/di/wishlist_injection.dart';

void main() async {
  // ... other initialization code
  
  // Initialize wishlist dependencies
  await initWishlistDependencies();
  
  runApp(MyApp());
}
```

### 3. BLoC Provider Setup

Wrap your app or specific routes with the WishlistCubit provider:

```dart
BlocProvider(
  create: (context) => getIt<WishlistCubit>(),
  child: WishlistView(userId: currentUserId),
)
```

## 📱 Usage Examples

### Using the WishlistButton Widget

```dart
WishlistButton(
  movie: movieModel,
  userId: currentUserId,
  size: 24,
  color: Colors.red,
  showTooltip: true,
)
```

### Using the WishlistView

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => BlocProvider(
      create: (context) => getIt<WishlistCubit>(),
      child: WishlistView(userId: currentUserId),
    ),
  ),
);
```

### Programmatic Wishlist Operations

```dart
final wishlistCubit = context.read<WishlistCubit>();

// Add to wishlist
wishlistCubit.add(AddToWishlist(
  movie: movieModel,
  userId: currentUserId,
));

// Remove from wishlist
wishlistCubit.add(RemoveFromWishlist(
  movieId: movieId,
  userId: currentUserId,
));

// Check if in wishlist
wishlistCubit.add(CheckWishlistStatus(
  movieId: movieId,
  userId: currentUserId,
));
```

## 🎨 UI/UX Features

### Design Principles
- **Consistent**: Follows app's design system and color scheme
- **Accessible**: Proper contrast ratios and touch targets
- **Responsive**: Adapts to different screen sizes
- **Intuitive**: Clear visual feedback and user actions

### Visual Elements
- **Heart Icons**: Filled for wishlisted, outlined for not wishlisted
- **Loading States**: Spinner animations during operations
- **Toast Notifications**: Success/error feedback
- **Confirmation Dialogs**: For destructive actions
- **Empty States**: Encouraging users to add movies

## 🔧 Configuration

### Cache Keys
The feature uses the following cache keys (defined in `lib/core/constants/cache_keys.dart`):
- `wishlist`: Base key for wishlist data
- `wishlist_items`: Specific key for wishlist items

### API Endpoints
The feature integrates with Supabase using the following operations:
- `SELECT` from `wishlist` table
- `INSERT` into `wishlist` table
- `DELETE` from `wishlist` table
- Row Level Security (RLS) policies

## 🧪 Testing

The architecture supports easy testing:

### Unit Tests
- Use cases can be tested with mock repositories
- Repository can be tested with mock data sources
- Cubit can be tested with mock use cases

### Widget Tests
- UI components can be tested with mock BLoC states
- User interactions can be simulated

### Integration Tests
- End-to-end testing with real data sources
- Network and offline scenarios

## 🔄 State Management

The feature uses BLoC pattern with the following states:

### Loading States
- `WishlistLoading`
- `AddToWishlistLoading`
- `RemoveFromWishlistLoading`
- `ClearWishlistLoading`
- `CheckWishlistStatusLoading`

### Success States
- `WishlistLoaded`
- `AddToWishlistSuccess`
- `RemoveFromWishlistSuccess`
- `ClearWishlistSuccess`
- `CheckWishlistStatusSuccess`

### Error States
- `WishlistError`
- `AddToWishlistError`
- `RemoveFromWishlistError`
- `ClearWishlistError`
- `CheckWishlistStatusError`

### Special States
- `WishlistEmpty`: When no items in wishlist
- `WishlistInitial`: Initial state

## 🚀 Performance Optimizations

- **Lazy Loading**: Dependencies are registered as lazy singletons
- **Caching**: Local storage for offline access
- **Efficient Queries**: Optimized database queries
- **Memory Management**: Proper disposal of resources
- **Image Caching**: Cached network images for posters

## 🔒 Security

- **Row Level Security**: Supabase RLS policies
- **User Isolation**: Users can only access their own wishlist
- **Input Validation**: Proper data validation
- **Error Handling**: Secure error messages

## 📈 Future Enhancements

Potential improvements and additions:
- [ ] Wishlist sharing functionality
- [ ] Wishlist categories/tags
- [ ] Wishlist export/import
- [ ] Wishlist analytics
- [ ] Collaborative wishlists
- [ ] Wishlist recommendations
- [ ] Wishlist notifications
- [ ] Wishlist search and filtering

## 🤝 Contributing

When contributing to the wishlist feature:
1. Follow Clean Architecture principles
2. Maintain separation of concerns
3. Add proper error handling
4. Include unit tests
5. Update documentation
6. Follow the existing code style

## 📄 License

This feature is part of the AI Movie App and follows the same license terms. 