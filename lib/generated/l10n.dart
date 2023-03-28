// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome back ...`
  String get login_hint {
    return Intl.message(
      'Welcome back ...',
      name: 'login_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter email & password`
  String get login_massage {
    return Intl.message(
      'Enter email & password',
      name: 'login_massage',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get email_hint {
    return Intl.message(
      'Enter your email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint {
    return Intl.message(
      'Enter your password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password again`
  String get password_again {
    return Intl.message(
      'Enter your password again',
      name: 'password_again',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Choose your language`
  String get language_hint {
    return Intl.message(
      'Choose your language',
      name: 'language_hint',
      desc: '',
      args: [],
    );
  }

  /// `Select sutiable language `
  String get language_massage {
    return Intl.message(
      'Select sutiable language ',
      name: 'language_massage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure ?`
  String get confirm_hint {
    return Intl.message(
      'Are you sure ?',
      name: 'confirm_hint',
      desc: '',
      args: [],
    );
  }

  /// `You will be logged out `
  String get confirm_massage {
    return Intl.message(
      'You will be logged out ',
      name: 'confirm_massage',
      desc: '',
      args: [],
    );
  }

  /// ` Yes`
  String get yes {
    return Intl.message(
      ' Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Have an account ?`
  String get have_an_account {
    return Intl.message(
      'Have an account ?',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get no_account {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to join us ... `
  String get register_hint {
    return Intl.message(
      'Welcome to join us ... ',
      name: 'register_hint',
      desc: '',
      args: [],
    );
  }

  /// `Enter  your name ,email and password `
  String get register_massage {
    return Intl.message(
      'Enter  your name ,email and password ',
      name: 'register_massage',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
