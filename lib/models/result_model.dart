// To parse this JSON data, do
//
//     final apiResult = apiResultFromJson(jsonString);

import 'dart:convert';

ApiResult apiResultFromJson(String str) => ApiResult.fromJson(json.decode(str));

String apiResultToJson(ApiResult data) => json.encode(data.toJson());

class ApiResult {
  ApiResult({
    required this.searchedTerm,
    required this.isFound,
    required this.aResults,
    required this.bResults,
    required this.aFullTextResults,
    required this.bFullTextResults,
    required this.accentInsensitive,
    required this.availabilityOnOtherDictionaries,
    required this.voiceLanguage,
    required this.voiceId,
    required this.voices,
    required this.hasSlangTerms,
    required this.isSearchTermSlang,
    required this.primeATerm,
    required this.suggestions,
  });

  final String searchedTerm;
  final bool isFound;
  final List<Result> aResults;
  final List<Result> bResults;
  final List<Result> aFullTextResults;
  final List<Result> bFullTextResults;
  final bool accentInsensitive;
  final AvailabilityOnOtherDictionaries availabilityOnOtherDictionaries;
  final String voiceLanguage;
  final String voiceId;
  final List<Voice> voices;
  final bool hasSlangTerms;
  final bool isSearchTermSlang;
  final String primeATerm;
  final dynamic suggestions;

  factory ApiResult.fromJson(Map<String, dynamic> json) => ApiResult(
        searchedTerm: json["SearchedTerm"],
        isFound: json["IsFound"],
        aResults:
            List<Result>.from(json["AResults"].map((x) => Result.fromJson(x))),
        bResults:
            List<Result>.from(json["BResults"].map((x) => Result.fromJson(x))),
        aFullTextResults: List<Result>.from(
            json["AFullTextResults"].map((x) => Result.fromJson(x))),
        bFullTextResults: List<Result>.from(
            json["BFullTextResults"].map((x) => Result.fromJson(x))),
        accentInsensitive: json["AccentInsensitive"],
        availabilityOnOtherDictionaries:
            AvailabilityOnOtherDictionaries.fromJson(
                json["AvailabilityOnOtherDictionaries"]),
        voiceLanguage: json["VoiceLanguage"],
        voiceId: json["VoiceId"],
        voices: List<Voice>.from(json["Voices"].map((x) => Voice.fromJson(x))),
        hasSlangTerms: json["HasSlangTerms"],
        isSearchTermSlang: json["IsSearchTermSlang"],
        primeATerm: json["PrimeATerm"],
        suggestions: json["Suggestions"],
      );

  Map<String, dynamic> toJson() => {
        "SearchedTerm": searchedTerm,
        "IsFound": isFound,
        "AResults": List<dynamic>.from(aResults.map((x) => x.toJson())),
        "BResults": List<dynamic>.from(bResults.map((x) => x.toJson())),
        "AFullTextResults":
            List<dynamic>.from(aFullTextResults.map((x) => x.toJson())),
        "BFullTextResults":
            List<dynamic>.from(bFullTextResults.map((x) => x.toJson())),
        "AccentInsensitive": accentInsensitive,
        "AvailabilityOnOtherDictionaries":
            availabilityOnOtherDictionaries.toJson(),
        "VoiceLanguage": voiceLanguage,
        "VoiceId": voiceId,
        "Voices": List<dynamic>.from(voices.map((x) => x.toJson())),
        "HasSlangTerms": hasSlangTerms,
        "IsSearchTermSlang": isSearchTermSlang,
        "PrimeATerm": primeATerm,
        "Suggestions": suggestions,
      };
}

class Result {
  Result({
    required this.termB,
    required this.termA,
    required this.categoryTextB,
    required this.categoryTextA,
    required this.termTypeTextB,
    required this.termTypeTextA,
    required this.termTypeId,
    required this.categoryId,
    required this.translationId,
    required this.isSlang,
  });

  final String termB;
  final String termA;
  final String categoryTextB;
  final String categoryTextA;
  final String termTypeTextB;
  final String termTypeTextA;
  final String termTypeId;
  final String categoryId;
  final String translationId;
  final bool isSlang;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        termB: json["TermB"],
        termA: json["TermA"],
        categoryTextB: json["CategoryTextB"],
        categoryTextA: json["CategoryTextA"],
        termTypeTextB: json["TermTypeTextB"],
        termTypeTextA: json["TermTypeTextA"],
        termTypeId: json["TermTypeId"],
        categoryId: json["CategoryId"],
        translationId: json["TranslationId"],
        isSlang: json["IsSlang"],
      );

  Map<String, dynamic> toJson() => {
        "TermB": termB,
        "TermA": termA,
        "CategoryTextB": categoryTextB,
        "CategoryTextA": categoryTextA,
        "TermTypeTextB": termTypeTextB,
        "TermTypeTextA": termTypeTextA,
        "TermTypeId": termTypeId,
        "CategoryId": categoryId,
        "TranslationId": translationId,
        "IsSlang": isSlang,
      };
}

class AvailabilityOnOtherDictionaries {
  AvailabilityOnOtherDictionaries({
    required this.entr,
    required this.ende,
    required this.enes,
    required this.enfr,
  });

  final bool entr;
  final bool ende;
  final bool enes;
  final bool enfr;

  factory AvailabilityOnOtherDictionaries.fromJson(Map<String, dynamic> json) =>
      AvailabilityOnOtherDictionaries(
        entr: json["entr"],
        ende: json["ende"],
        enes: json["enes"],
        enfr: json["enfr"],
      );

  Map<String, dynamic> toJson() => {
        "entr": entr,
        "ende": ende,
        "enes": enes,
        "enfr": enfr,
      };
}

class Voice {
  Voice({
    required this.voiceAccent,
    required this.voiceUrl,
  });

  final String voiceAccent;
  final String voiceUrl;

  factory Voice.fromJson(Map<String, dynamic> json) => Voice(
        voiceAccent: json["VoiceAccent"],
        voiceUrl: json["VoiceUrl"],
      );

  Map<String, dynamic> toJson() => {
        "VoiceAccent": voiceAccent,
        "VoiceUrl": voiceUrl,
      };
}
