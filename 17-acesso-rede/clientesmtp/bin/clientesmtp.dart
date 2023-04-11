import 'package:clientesmtp/clientesmtp.dart' as clientesmtp;



import 'dart:io';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

main() async {
  // Configura as credenciais SMTP do Gmail
  final smtpServer = gmail('cezaraguiar5@gmail.com', 'abcd=1234');

  // Cria uma mensagem de e-mail
  final message = Message()
    ..from = Address('cezaraguiar5@gmail.com', 'Acacio')
    ..recipients.add('acacio6891@gmail.com')
    ..subject = 'teste'
    ..text = 'teste';

  try {
    // Envia o e-mail usando o servidor SMTP do Gmail
    final sendReport = await send(message, smtpServer);

    // Exibe o resultado do envio do e-mail
    print('E-mail enviado: ${sendReport.mail}');
  } on MailerException catch (e) {
    // Exibe informações sobre erros de envio de e-mail
    print('Erro ao enviar e-mail: ${e.toString()}');
  }
}