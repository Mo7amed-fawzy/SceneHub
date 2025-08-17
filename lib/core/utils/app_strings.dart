abstract class AppStrings {
  //ToDo:All Strings
  // Comma-separated declaration - inline consts
  static const String appName = "SceneHub",
  //!On Boarding Strings
  skip = "Skip", next = "Next", createAccount = "Create Account", loginNow = "Login Now",
  //!Auth Strings
  welcome = "Welcome!", welcomeBack = "Welcome Back!", fristName = "First Name", lastName = "Last Name", emailAddress = "Email Address", password = "Password", iHaveAgreeToOur = "I have agree to our ", termsAndCondition = "Terms and Condition", signUp = "Sign Up", signIn = "Sign In", alreadyHaveAnAccount = "Already have an account ? ", dontHaveAnAccount = "Don’t have an account ? ", forgotPassword = "Forgot Password ?",
  //!Home Strings
  home = "Home", watchlist = "Watch list", recommendations = "Recommendations", about = "About", whatdoyouwanttowatch = "What do you want to watch?",
  //!Search Strings
  search = "Search", nowplaying = "Now playing", upcoming = "Upcoming", toprated = "Top rated", popular = "Popular",
  //!Profile Strings
  profile = "Profile", account = "Account", editProfile = "Edit Profile", notification = "Notification", general = "General", settings = "Settings", security = "Security", privacyPolicy = "Privacy Policy", logOut = "Log Out",
  //!Bazar
  detail = "Detail", aboutmovie = "About Movie", reviews = "Reviews", cast = "Cast", spidermannowayhome = "Spiderman No Way Home", historicalCharacters = "Historical Characters", historyBooks = "History Books", historicalSouvenirs = "Historical Souvenirs",
  //!Cart
  myCart = "My Cart", totalPayment = "Total Payment", checkoutNow = "Checkout Now",
  //!Payment Strings
  checkoutScreen = "Checkout Screen", deliveryAddress = "Delivery Address", change = "Change", items = "1 items", selectedProduct = "Selected Product", paymentMethod = "Payment Method", confirmPayment = "Confirm Payment", orderSuccess = "Order Success", thankYou = "Thank you for your order here and your package will be sent to your address very quickly and fast good product", backToHome = "Back To Home",
  //!Forgot password
  forgotPasswordPage = "Forgot Password", sendResetPasswordLink = "Send Reset Passwrod Link", verificationNow = "Verification Now", resendCode = "Resend Code", verifyAccount = "Verify Account", enter4DigitCodeWeHaveSentTo = "Enter 4 digit code we have sent to ", haventReceivedVerificationCode = "Haven’t received verification code?",
  //!Tv Series Details
  minutes = "Minutes", notAvailable = 'N/A', noDescriptionAvailable = "No description available.", episode = 'Episode', trailer = 'Trailer', season = 'Season', castAndCrew = 'Cast and Crew', unknownActor = 'Unknown Actor', unknownCharacter = 'Unknown Character', storyLine = 'Story Line', more = 'More';
}

abstract class SupabaseKeys {
  static const String title = "title";
  static const String description = "description";
  static const String image = "image";
  static const String date = "date";
  static const String runtime = "runtime";
  static const String genres = "genres";
  static const String desc = "desc";
  static const String releaseDate = "date";
  static const String voteAverage = "rate";
  static const String adult = "adult";
}

// from api
// {
//   "title": "Oppenheimer",
//   "runtime": 180,
//   "genres": [{"id": 18, "name": "Drama"}, {"id": 36, "name": "History"}],
//   "vote_average": 8.5,
//   "release_date": "2023-07-21",
//   "adult": false
// }
