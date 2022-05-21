
abstract class RealEstateLoginStates {}

class RealEstateLoginInitialState extends RealEstateLoginStates{}

class RealEstateLoginLoadingState extends RealEstateLoginStates{}

class RealEstateLoginSuccessState extends RealEstateLoginStates{
   final String uId;

  RealEstateLoginSuccessState(this.uId);
}

class RealEstateLoginErrorState extends RealEstateLoginStates
{
  final String error;
  RealEstateLoginErrorState(this.error);
}
class RealEstateChangePassWordVisibilityState extends RealEstateLoginStates{}
