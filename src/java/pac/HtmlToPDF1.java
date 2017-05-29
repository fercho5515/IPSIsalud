/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;



import java.io.*;
import com.sun.pdfview.PDFFile;
import com.sun.pdfview.PDFPage;
import com.sun.pdfview.PDFRenderer;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.print.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.ByteBuffer;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.print.PrintService;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.JRLoader;
import org.xhtmlrenderer.pdf.ITextRenderer;

import java.sql.SQLException;
import java.sql.ResultSet;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.*;
import net.sf.jasperreports.components.barcode4j.*;
import java.util.*;
import java.io.*;
import java.sql.*;
import net.sf.jasperreports.engine.export.JRPdfExporter;

/**
 *
 * @author servidor
 */
public class HtmlToPDF1 {
     // itextpdf-5.4.1.jar  http://sourceforge.net/projects/itext/files/iText/
  public void htmlapdf() {      
       ruta r = new ruta();
       String nombre="archivillo";
       String url="http://localhost:8084/ISALUD/reportes/reporte_consulta_trabs_ant/consulta_trabs_ant_imp.jsp?cod_con=3";
       String dirHtml=r.dir2()+"/Impresiones/"+nombre+".html";
       String dirPdf=r.dir2()+"/Impresiones/"+nombre+".pdf";
       
      boolean html=guardaHtml(url,dirHtml);
      if(!html){return;}
      
      boolean pdf=creaPdf(dirHtml,dirPdf); 
      if(!pdf){return;}
      
      impr(dirPdf);
   //   try{ imprime(dirPdf, "\\\\PrintServer\\MyPrinter","PDF Print Job",0);}
   //   catch(Exception tr){} 
  }
 public void htmlapdfFormula(String con_Con) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, InterruptedException{
       
         
     ruta r = new ruta();
      try { 
          cla cl = new cla();
          Connection conexion;
          Class.forName("com.mysql.jdbc.Driver").newInstance();
         conexion=DriverManager.getConnection("jdbc:mysql://localhost:"+cl.puer()+"/"+cl.bas()+"",""+cl.us()+"",""+cl.clav()+""); 


            File reportFile = new File(r.dir()+"/ISALUD/reportes/reporte_formula_med/report_formulita.jasper"); 
            Map parameters = new HashMap(); 
            //parameters.put("Parametro1", "valor"); 
            parameters.put("id_consulta","1");
            parameters.put("id_barcod","123456789012");
            parameters.put("edad","25 añitos");
            parameters.put("diag_p","b24");
            parameters.put("diag_1","I10x");
            parameters.put("diag_2","E119");
            parameters.put("diag_3","");
           
            JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath (),parameters, conexion);

            JRExporter exporter = new JRPdfExporter();

            exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            //exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new java.io.File(r.dir2()+"/Impresiones/formula_123.pdf"));
            exporter.setParameter(JRExporterParameter.OUTPUT_FILE, new java.io.File(r.dir()+"/ISALUD/reportes/reporte_formula_med/report_formulita_1234.pdf"));
            exporter.exportReport();
            } catch(Exception ex ) {
            // out.print("falla <br>"+ex);
            } 
      
        Thread.sleep(30000);
        try{ imprime(r.dir()+"/ISALUD/reportes/reporte_formula_med/report_formulita_1234.pdf", "\\\\PrintServer\\MyPrinter","PDF Print Job2",0);}
        catch(Exception tr){} 
        
    //  impr(r.dir()+"/ISALUD/reportes/reporte_formula_med/report_formulita_1234.pdf"); 
 } 
  

private boolean guardaHtml(String url,String dirPdf){
          try{    
           URL urlPage = new URL(url);
            HttpURLConnection conn = (HttpURLConnection)urlPage.openConnection();
            conn.connect();
            ruta r = new ruta();
            String ruta=r.dir();
               
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            BufferedWriter xr= new BufferedWriter(new FileWriter (dirPdf));
                String line;
                while ((line = rd.readLine()) != null) {
                    xr.write(line); 
                } 
                rd.close();
                xr.close();
                conn.disconnect(); }
  catch(Exception exe){return false;}
  return true;
}
private boolean creaPdf(String dirHtml,String dirPdf){
     Process runtimeProcess;
        try {
           String executeCmd="wkhtmltopdf "+dirHtml+" "+dirPdf+"";
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
 
            if (processComplete == 0) {
                  return true;
            } else {
                  return false;
            }
        } catch (Exception ex) {return false;} 
}
public boolean impr(String dirPdf){
     Process runtimeProcess;
        try {
           String executeCmd="lp "+dirPdf+"";
      //     System.out.println(executeCmd);
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
 
            if (processComplete == 0) {
                  return true;
            } else {
                  return false;
            }
        } catch (Exception ex) {return false;} 
}

public void imprime(String filePath, String printerName, String jobName,int band)  throws IOException, PrinterException {
            
            FileInputStream fileInputStream = new FileInputStream(filePath);
            byte[] pdfContent = new byte[fileInputStream.available()];
            fileInputStream.read(pdfContent, 0, fileInputStream.available());
            ByteBuffer buffer = ByteBuffer.wrap(pdfContent);
            final PDFFile pdfFile = new PDFFile(buffer);

            Printable printable = new Printable() {
                  public int print(Graphics graphics, PageFormat pageFormat,int pageIndex) throws PrinterException {
                       int pagenum = pageIndex + 1;
                       
                     if ((pagenum >= 1) && (pagenum <= pdfFile.getNumPages())) {
                                                       Graphics2D graphics2D = (Graphics2D) graphics;
                                                       PDFPage page = pdfFile.getPage(pagenum);
                                                       Rectangle imageArea = new Rectangle((int) pageFormat
                                                       .getImageableX(), (int) pageFormat.getImageableY(),
                                                      (int) pageFormat.getImageableWidth(),
                                                      (int) pageFormat.getImageableHeight());
                                                      graphics2D.translate(0, 0);
                                                      PDFRenderer pdfRenderer = new PDFRenderer(page, graphics2D,
                                                      imageArea, null, null);
                                                      try {
                              	                           page.waitForFinish();
                                                           pdfRenderer.run();
                                                          }
                                                      catch (InterruptedException exception) {
                                                                                              exception.printStackTrace();
                                                                                             }
                                                      return PAGE_EXISTS;
                                                                               }
                         else {
                               return NO_SUCH_PAGE;
                               }
                      }

             };
             
            PrinterJob printJob = PrinterJob.getPrinterJob();
            PageFormat pageFormat = PrinterJob.getPrinterJob().defaultPage();
              ///para cambiar orientacion de hoja si band 1 horizontal sino vertical
              if(band==1){pageFormat.setOrientation(0); }
                                                
                        
            printJob.setJobName(jobName);
            Book book = new Book();
            book.append(printable, pageFormat, pdfFile.getNumPages());
            printJob.setPageable(book);
            //////////numero de copias
            printJob.setCopies(1);
            Paper paper = new Paper();
            paper.setImageableArea(0, 0, paper.getWidth(), paper.getHeight());
            pageFormat.setPaper(paper);
            PrintService[] printServices = PrinterJob.lookupPrintServices();
            for (int count = 0; count < printServices.length; ++count) {
                  if (printerName.equalsIgnoreCase(printServices[count].getName())) {
                        printJob.setPrintService(printServices[count]);
                        break;
                  }
            }
            
//            if (printJob.printDialog() == false) // choose printer
  //          return; 

            printJob.print();

      }												

}
/*
 
 
public void htmlapdf3() throws MalformedURLException, IOException, DocumentException, com.itextpdf.text.DocumentException{
     ////////////primero guardo la pagina html 
            URL urlPage = new URL("http://localhost:8084/ISALUD/reportes/reporte_consulta_trabs_ant/consulta_trabs_ant_imp.jsp?cod_con=3");
            HttpURLConnection conn = (HttpURLConnection)urlPage.openConnection();
            conn.connect();
            ruta r = new ruta();
            String ruta=r.dir();
               
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            BufferedWriter xr= new BufferedWriter(new FileWriter (r.dir2()+"/Impresiones/archivo_trabj.html"));
                String line;
                while ((line = rd.readLine()) != null) {
                    xr.write(line); 
                } 
                rd.close();
                xr.close();
                conn.disconnect();   
    
    
    
     Document pdfDocument = new Document();
        Reader htmlreader = new BufferedReader(new InputStreamReader(
                                 new FileInputStream(r.dir2()+"/Impresiones/archivo_trabj.html")
                                ));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfWriter.getInstance(pdfDocument, baos);
        pdfDocument.open();
        StyleSheet styles = new StyleSheet();
        styles.loadTagStyle("body", "font", "Bitstream Vera Sans");
        ArrayList arrayElementList = (ArrayList) HTMLWorker.parseToList(htmlreader, styles);
        for (int i = 0; i < arrayElementList.size(); ++i) {
            Element e = (Element) arrayElementList.get(i);
            pdfDocument.add(e);
        }
        pdfDocument.close();
        byte[] bs = baos.toByteArray();
        String pdfBase64 = Base64.encodeBytes(bs); //output
        File pdfFile = new File(r.dir2()+"/Impresiones/archivo_trabj.pdf");
        FileOutputStream out = new FileOutputStream(pdfFile);
        out.write(bs);
        out.close();
        
        
        ///////////////////////////////
        ///////////////////////////////
        
        try{ imprime(r.dir2()+"/Impresiones/archivo_trabj.pdf", "\\\\PrintServer\\MyPrinter","PDF Print Job",0);}
                                                      catch(Exception tr){} 
        
    }
 */