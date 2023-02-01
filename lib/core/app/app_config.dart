var thisYear = DateTime.now().year.toString();

const String appName = "HMB"; //this shows in the splash screen
const String appVersion = '1.0.0'; //this shows in the splash screen
String copyrightText =
    "@ $appName " + thisYear; //this shows in the splash screen

///configure this
const bool https = true;

///configure this
const String kDomainPath = "hmbadhon.me/"; // directly inside the public folder

///do not configure these below
const String kApiEndPath = "api/";
const String publicFolder = "public";
const String protocol = https ? "https://" : "http://";
const String apiVersion = "v1";
const String rawBaseUrl = "$protocol$kDomainPath$kApiEndPath$apiVersion";
const String baseUrl = rawBaseUrl;
