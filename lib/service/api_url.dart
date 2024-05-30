class ApiConstant {

   //static const baseUrl = "http://192.168.10.64:8000"; //This is local url
  static const baseUrl="http://192.168.10.16:5001/api/v1";
   //static const baseUrl ="https://app.findwork.careers"; //This is live url

///<=================================== For Auth part ====================>
  static const signIn = "/auth/login";
  static const changePassWord = "/auth/change-password";
  static const resetPassword = "/auth/reset-password";
  static const forgotPassword = "/auth/forget-password";
  static const verifyOTP = "/auth/verify-otp";
  static const userProfile = "/user/profile";

 }
