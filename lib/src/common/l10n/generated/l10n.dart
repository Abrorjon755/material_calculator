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

  /// `Material Shapes`
  String get materialShapes {
    return Intl.message(
      'Material Shapes',
      name: 'materialShapes',
      desc: '',
      args: [],
    );
  }

  /// `Rectangle`
  String get rectangle {
    return Intl.message(
      'Rectangle',
      name: 'rectangle',
      desc: '',
      args: [],
    );
  }

  /// `A side (mm)`
  String get sideA {
    return Intl.message(
      'A side (mm)',
      name: 'sideA',
      desc: '',
      args: [],
    );
  }

  /// `B side (mm)`
  String get sideB {
    return Intl.message(
      'B side (mm)',
      name: 'sideB',
      desc: '',
      args: [],
    );
  }

  /// `D side (mm)`
  String get sideD {
    return Intl.message(
      'D side (mm)',
      name: 'sideD',
      desc: '',
      args: [],
    );
  }

  /// `S side (mm)`
  String get sideS {
    return Intl.message(
      'S side (mm)',
      name: 'sideS',
      desc: '',
      args: [],
    );
  }

  /// `Length (m)`
  String get length {
    return Intl.message(
      'Length (m)',
      name: 'length',
      desc: '',
      args: [],
    );
  }

  /// `Please enter size`
  String get pleaseFill {
    return Intl.message(
      'Please enter size',
      name: 'pleaseFill',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Result is: `
  String get resultIs {
    return Intl.message(
      'Result is: ',
      name: 'resultIs',
      desc: '',
      args: [],
    );
  }

  /// `Rectangular`
  String get rectangular {
    return Intl.message(
      'Rectangular',
      name: 'rectangular',
      desc: '',
      args: [],
    );
  }

  /// `Circle`
  String get circle {
    return Intl.message(
      'Circle',
      name: 'circle',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// ` KG`
  String get kg {
    return Intl.message(
      ' KG',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure that you are going delete all history?`
  String get areYouSure {
    return Intl.message(
      'Are you sure that you are going delete all history?',
      name: 'areYouSure',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
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
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
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
