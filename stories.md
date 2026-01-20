# User Story

# User Story: Account Registration

**Title:**
As a new user, I want to create an account by entering my details, so that I can have my own profile and access shared shopping lists.

**Acceptance Criteria:**

1. The user must enter a username, an email address, and their password twice.
2. All input fields are mandatory and submitted via a "Sign Up" button.
3. If information is valid, the user is redirected to the FamilyDailyMessage home screen.
4. If there is an error, a message is displayed below the relevant field.

**Priority:** High
**Story Points:** 5
**Notes:**

- Email format must be validated (e.g., user@example.com).

# User Story: Login

**Title**
As a user, I want to log in, so that I can securely access my shared shopping lists and appointments.

**Acceptance Criteria:**

1. The user can enter their username and password into dedicated text fields.
2. A validation button allows the user to submit the login attempt.
3. If credentials are correct, the user is redirected to the familyDailyMessage home screen.
4. If there is an error, a message is displayed.

**Priority:** High
**Story Points:** 5
**Notes:**

- Login state must be persisted locally to avoid re-logging every time the app opens.

- Provide a link to the signup page for new users.

# User Story : Home Screen

**Title**
As a user, I want to quickly access the main features of the app, so that I can navigate efficiently between my shopping lists and daily messages.

**Acceptance Criteria:**

1. The main navigation buttons must be large, clear, and occupy a significant part of the screen for easy tapping.

2. The name of the active sharing group must be clearly displayed on the dashboard.

3. A settings icon button must be present in the AppBar (header) to allow quick access to app configurations.

4. Each button must correctly redirect the user to the corresponding section (Shopping List or Daily Message).

**Priority:** High
**Story Points:** 2
**Notes:**

- Personalizing the header with the user's nickname will make the experience more engaging.

- The layout should be responsive to fit different screen sizes.

# User Story : Detail Screen (Group details)

**Title**
As a user, I want to view the details of my sharing group, so that I can see who has access to the lists and manage the members.

**Acceptance Criteria:**

1. The screen displays the group name and a complete list of members' usernames.

2. A "Leave Group" button allows the user to withdraw themselves from the shared group.

**Priority:** Medium
**Story Points:** 3
**Notes:**

- The list of members should update in real-time when someone joins or leaves.

- User permissions (Admin vs Member) could be displayed next to each name.

# User Story : Persistance Data

**Title**
As a user, I want to save my chosen city for weather updates locally, so that the application remembers my preference even after I close or restart the app.

**Acceptance Criteria:**

1. A text field to input the city name must be accessible within the settings menu.
2. The chosen city must be stored in local persistent storage (e.g., Shared Preferences).
3. The application must load the saved city automatically upon startup to fetch the weather.
4. The user must be able to update the city name at any time in the settings.

**Priority:** Medium
**Story Points:** 3
**Notes:**

- The application should verify if the city exists via the weather API before saving it to prevent errors
- A default city can be set if no local data is found.

# User Story : External Api

**Title:**
As a user, I want to access the current weather for my chosen city within the daily message, so that I can have up-to-date information instantly.

**Acceptance Criteria:**

1. The application must fetch real-time weather data from an external API (e.g., OpenWeatherMap).
2. The weather displayed must correspond to the city saved in the user's preferences.
3. The weather data must be updated every time the "Daily Message" screen is opened to ensure accuracy.
4. If no city has been selected by the user, the app must display the weather for a default city.

**Priority:** Low
**Story Points:** 5
**Notes:**

- For users in France, the default city will be set to Paris.
- Error handling should be implemented in case the external API is unreachable or the city name is invalid.

# User Story : Setting Menu

**Title:**
As a user, I want to access a centralized settings menu to manage my weather city and group information, so that I can easily customize my app experience.

**Acceptance Criteria:**

1. The settings menu must be accessible via a dedicated icon in the main app navigation or header.
2. The current configurations (e.g., current city, group name) must be displayed clearly as summary items in the menu.
3. Each menu item must be clickable to navigate the user to a detailed screen for editing specific settings.
4. The menu should be organized into logical categories (e.g., Profile, Preferences, Account) to reduce user effort.

**Priority:** Medium
**Story Points:** 2
**Notes:**

- Using consistent icons for each category will improve visual navigation and user satisfaction.

# User Story : Setting Screen

**Title**
As a user, I want to access a centralized settings screen, so that I can easily customize my app experience and appearance.

**Acceptance Criteria:**

1. A toggle switch must allow the user to manually switch between Light Mode and Dark Mode.
2. A checkbox must allow the user to force the app to follow the system's theme settings.
3. If the "Follow System Settings" checkbox is checked, the manual theme toggle must be disabled.
4. The theme preference must be applied immediately across all screens of the application.

**Priority:** Medium
**Story Points:** 2
**Notes:**

- By default, the application will follow the phone's system theme.
- This preference must be persisted locally so it remains active upon restarting the app.

# User Story : Notifications

**Title:**
As a user, I want to be notified when the shared shopping list is modified, so that I am instantly informed of updates made by other group members.

**Acceptance Criteria:**

1. The app must request notification permissions from the user upon the first launch.
2. Notification permissions must be toggleable at any time within the settings menu.
3. Each notification must include the name of the member who made the change, the type of modification (added/deleted/edited), and the product name.
4. The system must correctly handle cross-platform compatibility for both iOS and Android.

**Priority:** Medium
**Story Points:** 3
**Notes:**

- Ensure APNS (iOS) and FCM (Android) tokens are correctly synchronized in Firestore.
- A reminder can be displayed once a day if permissions are disabled and the user opens the shopping list.
