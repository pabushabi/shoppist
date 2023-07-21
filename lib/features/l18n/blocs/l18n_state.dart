part of 'l18n_cubit.dart';

class L18nState extends Equatable {
  final String languageCode;

  const L18nState({this.languageCode = Locales.en});

  L18nState copyWith({String? languageCode}) =>
      L18nState(languageCode: languageCode ?? this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}
