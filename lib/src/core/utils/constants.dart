const mapZoom = 16.0;
final twoDecimalRegExp = RegExp(r'^\d+\.?\d{0,2}');
const passRegex =
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%^&*])[a-zA-Z0-9!@#\$%^&*]{8,}$';
const alphabetsRegex = r'^[a-zA-Z\s]+$';
const emailRegex = r'^[a-zA-Z0-9._%+-]+@(hypernymbiz\.com|hypernym\.io)$';
final selectedDateRegex = RegExp(
    r'\b\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])\s+to\s+\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])\b');
const chatBot = "chat-bot";
final description = RegExp(r'[a-zA-Z0-9 .,?!#@\s-]');
const orgEmailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
const domainRegex = r'^([a-zA-Z0-9.-]+\.[a-zA-Z]{2,})';
const numbersOnlyRegex = r'^\d+';
final regularHoursRegex = RegExp(
    r'^(?:[1-9](\.\d{1,2})?|1[0-9](\.\d{1,2})?|2[0-3](\.\d{1,2})?|24(\.0{1,2})?)$');
final hourlyRateRegex = RegExp(r'^(?:[1-9]\d{0,3}|10000)(?:\.\d+)?$');
