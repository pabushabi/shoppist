part of 'family_code_cubit.dart';

class FamilyCodeState extends Equatable {
  final String code;

  const FamilyCodeState({required this.code});

  FamilyCodeState copyWith({String? code}) =>
      FamilyCodeState(code: code ?? this.code);

  @override
  List<Object?> get props => [code];
}
