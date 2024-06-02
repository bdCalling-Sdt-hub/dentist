import 'package:dentist/service/api_check.dart';
import 'package:dentist/service/api_client.dart';
import 'package:dentist/service/api_url.dart';
import 'package:dentist/utils/AppConst/app_const.dart';
import 'package:dentist/view/screens/conditionDetails/Model/article_details_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsController extends GetxController{

  var currentImage=1.obs;

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<=========== This is for article details ===================>

  Rx<ArticleDetailsModel> artiCleDetailsModel = ArticleDetailsModel().obs;

  Future<bool> getArticleDetails(String id) async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData("${ApiConstant.singleArticle}${id}");
    if (response.statusCode == 200) {
      artiCleDetailsModel.value = ArticleDetailsModel.fromJson(response.body);
      update();
      setRxRequestStatus(Status.completed);
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage){
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
      return false;
    }
  }

  ///<============== This is for make phone call ====================>

  makingPhoneCall(String number) async {
    var url = Uri.parse("tel:${number}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

///<============= This is for send email ========================>

  // sendingMails(String email) async {
  //   var url = Uri.parse('mailto:$email');
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }


// Function to send an email
  Future<void> sendingMails(String recipient, String subject, String body) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: recipient,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );

    final String urlString = uri.toString();

    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      throw 'Could not launch $urlString';
    }
  }


}