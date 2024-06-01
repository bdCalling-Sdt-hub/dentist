class ApiConstant {

   //static const baseUrl = "http://192.168.10.64:8000"; //This is local url
  static const baseUrl="http://192.168.10.16:5001";
   //static const baseUrl ="https://app.findwork.careers"; //This is live url

///<=================================== For Auth part ====================>
  static const signIn = "/api/v1/auth/login";
  static const changePassWord = "/api/v1/auth/change-password";
  static const resetPassword = "/api/v1/auth/reset-password";
  static const forgotPassword = "/api/v1/auth/forget-password";
  static const verifyOTP = "/api/v1/auth/verify-otp";
  static const userProfile = "/api/v1/user/profile";

  ///<============================ For home ==============================>

  static const banner = "/api/v1/banner";
  static const offer = "/api/v1/offer";
  static const smartCheck = "/api/v1/smart-check";
  static const faq = "/api/v1/faq";
  static const package = "/api/v1/package";
  static const articleCategory = "/api/v1/article-category";
  static const article = "/api/v1/article";
  static const patientCare = "/api/v1/article/category/Patient Care";
  static const singleArticle = "/api/v1/article/665563755cddb6417bf8c6a1";

  ///<===================== For settings ==========================>

  static const termsCondition = "/api/v1/rule/terms-and-conditions";
  static const aboutUs = "/api/v1/rule/about";
  static const privacyPolicy = "/api/v1/rule/privacy-policy";


 }
