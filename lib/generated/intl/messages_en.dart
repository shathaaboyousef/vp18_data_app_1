// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "confirm_hint": MessageLookupByLibrary.simpleMessage("Are you sure ?"),
        "confirm_massage":
            MessageLookupByLibrary.simpleMessage("You will be logged out "),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_hint": MessageLookupByLibrary.simpleMessage("Enter your email"),
        "full_name": MessageLookupByLibrary.simpleMessage("Full name"),
        "have_an_account":
            MessageLookupByLibrary.simpleMessage("Have an account ?"),
        "language_hint":
            MessageLookupByLibrary.simpleMessage("Choose your language"),
        "language_massage":
            MessageLookupByLibrary.simpleMessage("Select sutiable language "),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "login_hint": MessageLookupByLibrary.simpleMessage("Welcome back ..."),
        "login_massage":
            MessageLookupByLibrary.simpleMessage("Enter email & password"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "no_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account ?"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_again":
            MessageLookupByLibrary.simpleMessage("Enter your password again"),
        "password_hint":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "register_hint":
            MessageLookupByLibrary.simpleMessage("Welcome to join us ... "),
        "register_massage": MessageLookupByLibrary.simpleMessage(
            "Enter  your name ,email and password "),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
        "yes": MessageLookupByLibrary.simpleMessage(" Yes")
      };
}
