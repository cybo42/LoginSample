LoginSample
==================
------

Description
-----------
When application launches, present a login form to the user, prompting for username / password. After authenticating successfully, the Authentication screen will close, showing the Main view of the application. This main view will display the user's username along with a logout button. If a user did not enter correct credentials then an error message is displayed on the Authentication screen.

Classes
--------

- **LSUser** - Basic object which holds username and password strings
- **LSAuthenticator** - SharedInstance (singleton) which holds a Dictonary of all users. Provides method to authenticate a user.
- **LSViewController** - "Main screen" of application. When loaded checks to see if it has a LSUser object stored. If not presents the "Authentication screen". If it does have a LSUsre object stored, it will display the main view, with the user's username displayed.
- **LSAuthenticateViewController** - Displayed if there is no LSUser stored in LSViewController. When the _login_ button is pressed, the controller will use the LSAuthenticator to verify the username and password provided. If there is no LSUser with that username, or the password is not correct, an error message id displayed to the user. If the user is found and password matches, it sets the LSUser onto the LSViewController, and informs the LSViewController to close the authentication view. 
