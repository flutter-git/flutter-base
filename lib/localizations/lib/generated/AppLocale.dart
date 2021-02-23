// File AppLocale
// * @project back_office
// @author minhhoang on 05-12-2019
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n.dart';

const KEY_LANGUAGE = "language";
var language;

extension AppLocale on AppLocalizationDelegate {
  static const ENGLISH = Locale("en", "");
  static const VIETNAM = Locale("vi", "");

  static SharedPreferences _shared;
  Future<SharedPreferences> get shared async{
    if(AppLocale._shared == null) AppLocale._shared = await SharedPreferences.getInstance();
    return AppLocale._shared;
  }

  loadAndSave(Locale locale) {
    this.load(locale);
    language = locale.languageCode;
    shared.then((shared) {
      shared.setString(KEY_LANGUAGE, locale.languageCode);
    });
  }

  Future<Locale> getLocaleCurrent(BuildContext context) async {
    if (language != null) return Locale(language, "");
    language = (await shared).getString(KEY_LANGUAGE);
    if (language != null)
      return Locale(language, "");
    else
      return Localizations.localeOf(context, nullOk: true);
  }
  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }
  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }
  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

final localizationsDelegates = [
  S.delegate,
  // You need to add them if you are using the material library.
  // The material components usses this delegates to provide default
  // localization
  GlobalCupertinoLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];
