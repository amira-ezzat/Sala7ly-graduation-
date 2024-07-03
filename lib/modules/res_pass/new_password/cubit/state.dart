abstract class  ResetState{}

class  ResetInitiat extends  ResetState{}

class RegisterError extends  ResetState{
  late final String error;
  RegisterError(this.error);
}
class ResetPassVisibility extends  ResetState{}
class ResetcPassVisibility extends ResetState{}