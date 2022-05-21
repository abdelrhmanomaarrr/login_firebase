
abstract class RealEstateStates{}

class RealEstateInitialState extends RealEstateStates {}

class RealEstateChangeBottomNavState extends RealEstateStates {}


class CreateNewPostSuccessState extends RealEstateStates {}

class CreateNewPostLoadingState extends RealEstateStates {}

class CreateNewPostErrorState extends RealEstateStates {}

//=========
class NewPostPickImageSuccessState extends  RealEstateStates {}

class NewPostPickImageErrorState extends  RealEstateStates {}
//==============

class AppCreateDataBaseState extends RealEstateStates{}

class AppInsertDataBaseState extends RealEstateStates{}

class AppGetDataBaseLoadingState extends RealEstateStates{}

class AppGetDataBaseState extends RealEstateStates{}