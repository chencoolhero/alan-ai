import 'package:gsheets/gsheets.dart';
String itemN = "banana";


const _credentials = r'''
{
  "type": "service_account",
  "project_id": "piloty-city-project",
  "private_key_id": "95f178a39d895d804ce6c7623b4963f7834f4a03",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDadOZ9zrcjkSGD\nFPajBj07ihCmZSnxp7LgnixjF8UgBiIIXKL74W8xVmGqukMHzBNUL8dTSJtHgVXM\nwpeW2cj0MyygBRQfUHUg1BDF4gxWUt4cJ1HTGIgbXyjVFkrUnw29hIsXKA2HQ68X\n1j/n8bYZew+Votnh50bwgUlN8DQfkvMNqh2doxoyhN5B8ACUBe8tVXQrkYx7BNif\naiGmDom7r14kKakjHPufFZk5AmJlzSioYtvJK+1FAsh1DkjJ7RoZMP4m5l4hlP01\nr+40HaEdGawwhGXE6q3b+RVv2V5NuxW7Bsla3F8HZaff4DUXXcMNWdEuKfyCwrF9\n5yfxOSFzAgMBAAECggEAQ9F9yrm1Zi/EiRaleLfTo5u5joaibliC8jN4kSzMcCQn\nRZRIrsxuAhGQkXlwnMeQipaomSTVu+2dbstMVzL2LUWDyYu6Evyd2BqtuFj0PopM\nVM4qG1Am1OSGXxykD3zvPZIbwg0XohHzlgFX5pBF2YQ4MtqTLIvpnHlugekbrV8V\nAQvYVbrJ/ig184Swx4L2Cyuq46DlDm+hUpxt2O3v+DTkkBVsCZPNo/160qjZQn6S\ns3Kyb5qxucddzkRlZljAxBjgi+6pqsfsORuFgy6VTIBHJJkOXnzYzXuoKDbUyhqy\nMqQfzxUNbyIyU0x6eyOofP9UE4K4Gzs+4eFgR7XACQKBgQDyHqFAPbDw0rjvSTe4\nP9CSnIskm1HNwrkhrNymGELRknxaTrmAdZQtOnvQqJtFOfY4LnM54Hy3avpO8mWZ\ncIapJUkgiFURQSrc3k4H/UWWUZE2hV2wWRe4uW8j8mNUBfJO+gp/dMTQ7RUVXxjl\nPJzPNK5kWAXQ2qW+lLYfKEncywKBgQDm+v1yj1MFGv4BNQumvX2ZCTwh72OXMZVu\n28f+DnS30CdY9J/W2l5LBTD9x9O/RN5at6/G7FnB7Z+D+jqqpYRS1PHA+9VvG78w\n8ZkxMQxkeG4Y4sH1vjmaYOYdmz6M+h/bZDQRcBs8POJF/pA3IM5IP6xjBIxymSRA\nbLVR4Fgg+QKBgFgslXbqwJSDeTwTgwpDmza5cebr9ZekkX1VEaofbb4axdSxlNbW\nexcZlFvB+4HzgNqm9+mc+m5ltDCqEBwYIcJZxM7nN2uoOu7iurIoJ359yA999Eez\nunLYfUQvEsNXww3F+6q9IKwhmysETfG16DmBqvz6HWwZJIFKcSTZrESPAoGACF0M\nMkq4QdYRXm/SRS5VTuZDtCLb40ybUZFJs4xIc6No2VK6OuhbQ7IjbP0AUMuolXZT\nOguy0E/PV9MGrskhenJVcpxrxQMnMBl/Z4WUIksuCV6kkUZbBZj+nBHT+PzRjHsb\nW4pIoiy+MLSf+i8I6RrNHiS7BSdAZcjJ4/YQmtkCgYEA4/g19Lk/VaXdz2Ruvb58\nftLW2Jb8c+vUhAU9NuuWwAzo8K/jIQOjrZCdruDxmTH0EVcPUAxV2ETJO/EGdIFc\nQsL+ns7lmh0SJGfAe93WCrDi4x5myyTnipDhPCBrCQ4xgHEVA3JE/lff3mi+ojY7\n5PaGCBqpvCvG6VMrHNVjinQ=\n-----END PRIVATE KEY-----\n",
  "client_email": "piloty-city@piloty-city-project.iam.gserviceaccount.com",
  "client_id": "110673181534265501648",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/piloty-city%40piloty-city-project.iam.gserviceaccount.com"
}
''';

// your spreadsheet id
const _spreadsheetId = '1oa2jCoJ7IPqR6wMHW51iVo6pkQ_Sk-Oj82lm4jOSJUs';

final gsheets = GSheets(_credentials);
var ss;
var sheet;
var aisleNum;