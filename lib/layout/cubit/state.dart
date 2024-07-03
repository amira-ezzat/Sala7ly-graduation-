abstract class sal7lyState {}

class InitialState extends sal7lyState {}

class BottomNavState extends sal7lyState {}

class OfferLoadingState extends sal7lyState {}

class GetOfferSuccessState extends sal7lyState {}

class GetOfferErorrState extends sal7lyState
{
  late final String erorr;
  GetOfferErorrState(this.erorr);
}


class GetUserLoadingStates extends sal7lyState{}
class GetUserSuccessStates extends sal7lyState{}
class GetUserErrorStates extends sal7lyState{
  final String error;
  GetUserErrorStates(this.error);
}

class ProfileImagePickedSuccess extends sal7lyState{}

class ProfileImagePickedError extends sal7lyState{}
class CoverImagePickedSuccess extends sal7lyState{}
class CoverImagePickedError extends sal7lyState{}
class UploadProfileImageSuccess extends sal7lyState{}

class UploadProfileImageError extends sal7lyState{}

class UploadCoverImageSuccess extends sal7lyState{}

class UploadCoverImageError extends sal7lyState{}

class UserUpdateLoading extends sal7lyState{}

class UserUpdateError extends sal7lyState{}
class UserUpdateSuccess extends sal7lyState{}
