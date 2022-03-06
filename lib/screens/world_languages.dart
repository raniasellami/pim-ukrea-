import 'package:get/get.dart';

class WorldLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome back!',
          'email': 'Email',
          'settings': 'settings',
          'password': 'password'
        },

        'es_ES': {
          'sign': 'Content de te revoir!',
          'email': 'e-mail',
          'settings': 'parametres',
          'password': 'mot de passe',
          'welcome': 'Bienvenue !',
          'Login': 'connexion',
          'ForgotPassword': 'Mot de passe oublié',
          'saveinfo': 'Votre information est en sécurité avec nous',
          'signup': 'inscrire',
          'account': 'Vous navez pas de compte ?',
          'registerwithus': 'inscrivez-vous avec nous!',
          'enterfirstname': 'Entrez votre prénom',
          'lastname': 'Entrez votre nom',
          'phone': 'Entrez votre numero de telephone',
          'enteremail': 'Entrez votre e-mail',
          'enterpassword': 'Entrez votre mot de passe',
          'enteradress': 'Entrez votre adresse',
          'enterbirthday': 'Entrez votre date de naissance',
          'signupp': 'inscrire',
          'alreadyhave': 'Avez-vous un compte? Se connecter'
        },

        'ru_RU': {
          'welcome': 'مرحبا بعودتك !',
          'email': 'البريد الإلكتروني',
          'going': 'Куда ты направляешься?',
          'settings': 'الإعدادات',
          'password': 'كلمه السر',
          'Login': 'تسجيل الدخول',
          'ForgotPassword': 'هل نسيت كلمة السر',
          'saveinfo': 'معلوماتك فى امان معنا',
          'signup': 'اشتراك',
          'account': 'ليس لديك حساب؟',
          'registerwithus': 'سجل معنا!',
          'enterfirstname': 'أدخل اسمك الأول',
          'lastname': 'أدخل اسمك الأخير',
          'phone': 'أدخل رقم هاتفك',
          'enteremail': 'أدخل بريدك الإلكتروني',
          'enterpassword': 'ادخل رقمك السري',
          'enteradress': 'أدخل العنوان الخاص بك',
          'enterbirthday': 'أدخل تاريخ ميلادك',
          'signupp': 'اشتراك',
          'alreadyhave': 'هل لديك حساب؟ تسجيل الدخول'
        }

        //add more language here
      };
}
