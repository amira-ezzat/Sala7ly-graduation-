// https://newsapi.org/v2/everything?q=tesla&apiKey=5e7aeee60166446182f634efbd43fe3d

// void singOut(context)
// {
//   CacheHelper.removeData(
//       key: 'token'
//   ).then((value) {
//     if(value)
//     {
//       navigateAndFinish(context, SLoginScreen());
//     }
//   });
// }

void printFullText(String text)
{
  final pattern =RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}
String token='';
String uId='';