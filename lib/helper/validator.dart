import 'package:form_field_validator/form_field_validator.dart';

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'E-Mail Adresi Zorunludur'),
  EmailValidator(errorText: 'Geçerli Bir Email Adresi Giriniz')
]);

final requiredValidator = RequiredValidator(errorText: 'Bu Alan Zorunludur');
