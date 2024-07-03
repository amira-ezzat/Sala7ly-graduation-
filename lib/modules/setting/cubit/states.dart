import 'package:flutter/cupertino.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeLanguageToEnglishState extends SettingsState {}

class ChangeLanguageToArabicState extends SettingsState {}