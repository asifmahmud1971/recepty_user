const String kIConDir = 'assets/icons/';
const String kImageDir = 'assets/images/';
const String kFlagDir = 'assets/flags/';
const String kImageUrl = 'https://hmbadhon.me/';
const String kBaseUrl = 'https://hmbadhon.me/api/';
const String kBase64Extend = 'data:image/jpeg;base64,';
const String kBase64ExtendVideo = 'data:video/mp4;base64,';
const String kBase64ExtendAudio = 'data:audio/mp3;base64,';
const String kDemoImage =
    'https://media.istockphoto.com/photos/young-beautiful-woman-picture-id1294339577?b=1&k=20&m=1294339577&s=170667a&w=0&h=_5-SM0Dmhb1fhRdz64lOUJMy8oic51GB_2_IPlhCCnU=';

const String kUSD = 'USD';
const String kBDT = 'BDT';
const String kCurrency = 'CHF';

// Form Error
final RegExp emailValidatorRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
final RegExp strongPasswordRegExp =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~?.,/]).{8,}$');
final RegExp numberFindRegExp = RegExp(r'^([0-9])');
final RegExp specialChrFindRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

final RegExp htmlValidatorRegExp = RegExp(r"(<[^>]*>|&\w+;)");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Your email address is not valid";
const String kPassNullError = "Please enter your password";
const String kPassNewNullError = "Please enter your New password";
const String kPassConfirmNullError = "Please enter your Confirm password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your full name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";
const String kInvalidNumberError = "Ungültige Rufnummer.";
const String kInvalidError = "Etwas ist falsch! Bitte versuchen Sie es erneut.";
const String kMinWithdrawLimit = "Minimum withdraw limit 1 USD";
