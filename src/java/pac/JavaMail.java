/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;

/**
 *
 * @author servidor
 */

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.swing.*;
public class JavaMail
{
public MimeMultipart multiParte;
public void email(String para, String asunto,String mensaje,String email,String cemail,String dadjunto,String dadjunto_nom) {

       try
        {
        // String email="emmanuelariasriascos@gmail.com";
        // String cemail="cometa123";
        // String dadjunto="/home/servidor/Documentos/copiasBD/copiaDB_25-08-2013-7-33-30-10.zip";
        // String dadjunto_nom="based";
         
         Properties props = new Properties();
         props.setProperty("mail.smtp.host", "smtp.gmail.com");
         props.setProperty("mail.smtp.starttls.enable", "true");
         props.setProperty("mail.smtp.port", "587");
         props.setProperty("mail.smtp.user", email);//emmail del que se manda
         props.setProperty("mail.smtp.auth", "true");
         String [] correos;
         correos = para.split(";");
         for(int i=0;i<correos.length;i++){
            Session session = Session.getDefaultInstance(props, null);
            if (!dadjunto.equals("")){
               BodyPart texto = new MimeBodyPart();
                texto.setText(mensaje);
                BodyPart adjunto = new MimeBodyPart();
                adjunto.setDataHandler(
                new DataHandler(new FileDataSource(dadjunto)));
                adjunto.setFileName(dadjunto_nom);                
                /*MimeMultipart*/multiParte = new MimeMultipart();
               multiParte.addBodyPart(texto);
             multiParte.addBodyPart(adjunto);
            }
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));            
                    //emails
                    message.addRecipient(
                    Message.RecipientType.TO,
                      new InternetAddress(correos[i]));
                        message.setSubject(asunto);
                        if (!dadjunto.equals("")){
                            message.setContent(multiParte);                                                        
                       }
                        else if (dadjunto.equals("")){
                            message.setText(mensaje);
                       }

                    Transport t = session.getTransport("smtp");
                    t.connect(email, cemail);//correo y clave
                    t.sendMessage(message, message.getAllRecipients());
                t.close();
              }
          if (correos.length==1){
                System.out.println( " El email ha sido enviado ");
            }
          else if (correos.length>1){
                 System.out.println( " Los emails han sido enviados ");
          }
         }
        catch (Exception enc)
        {

           System.out.println( " ERROR: No se pudo enviar el email ");
        }
    }
}
