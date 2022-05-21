
abstract class RealEstateRegisterStates {}

class RealEstateRegisterInitialState extends RealEstateRegisterStates{}

class RealEstateRegisterLoadingState extends RealEstateRegisterStates{}

class RealEstateRegisterSuccessState extends RealEstateRegisterStates{}

class RealEstateRegisterErrorState extends RealEstateRegisterStates
{
  final String error;
  RealEstateRegisterErrorState(this.error);
}

class RealEstateCreateUserSuccessState extends RealEstateRegisterStates{}

class RealEstateCreateUserErrorState extends RealEstateRegisterStates
{
  final String error;
  RealEstateCreateUserErrorState(this.error);
}

class RealEstateRegisterChangePassWordVisibilityState extends RealEstateRegisterStates{}
