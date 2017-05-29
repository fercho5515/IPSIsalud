/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package pac;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 *
 * @author servidor
 */
public class Archivos {
 
	private static final int BUFFER_SIZE = 1024;
 
        public void Zippear(String pFile, String pZipFile) throws Exception {
		// objetos en memoria
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zipos = null;
 
		// buffer
		byte[] buffer = new byte[BUFFER_SIZE];
		try {
			// fichero a comprimir
			fis = new FileInputStream(pFile);
			// fichero contenedor del zip
			fos = new FileOutputStream(pZipFile);
			// fichero comprimido
			zipos = new ZipOutputStream(fos);
                     // ZipEntry zipEntry = new ZipEntry(pFile); // con la estructura de carpetas, toda la ruta
                        ZipEntry zipEntry = new ZipEntry(pFile.substring(pFile.lastIndexOf("/")+1)); // sin toda la ruta
			zipos.putNextEntry(zipEntry);
			int len = 0;
			// zippear
			while ((len = fis.read(buffer, 0, BUFFER_SIZE)) != -1)
				zipos.write(buffer, 0, len);
			// volcar la memoria al disco
			zipos.flush();
		} catch (Exception e) {
			throw e;
		} finally {
			// cerramos los files
			zipos.close();
			fis.close();
			fos.close();
		} // end try
	} // end Zippear
 
	public void UnZip(String pZipFile, String pFile) throws Exception {
		BufferedOutputStream bos = null;
		FileInputStream fis = null;
		ZipInputStream zipis = null;
		FileOutputStream fos = null;
 
		try {
			fis = new FileInputStream(pZipFile);
			zipis = new ZipInputStream(new BufferedInputStream(fis));
			if (zipis.getNextEntry() != null) {
				int len = 0;
				byte[] buffer = new byte[BUFFER_SIZE];
				fos = new FileOutputStream(pFile);
				bos = new BufferedOutputStream(fos, BUFFER_SIZE);
 
				while  ((len = zipis.read(buffer, 0, BUFFER_SIZE)) != -1)
					bos.write(buffer, 0, len);
				bos.flush();
			} else {
				throw new Exception("El zip no contenia fichero alguno");
			} // end if
		} catch (Exception e) {
			throw e;
		} finally {
			bos.close();
			zipis.close();
			fos.close();
			fis.close();
		} // end try
	} // end UnZip
 
        
 public void zipDirectory(String dir, String zipfile)
      throws IOException, IllegalArgumentException {
    // Check that the directory is a directory, and get its contents
    File d = new File(dir);
    if (!d.isDirectory()) throw new IllegalArgumentException("Not a directory:  "      + dir);
    String[] entries = d.list();
    byte[] buffer = new byte[4096]; // Create a buffer for copying
    int bytesRead;

    ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipfile));

    for (int i = 0; i < entries.length; i++) {
      File f = new File(d, entries[i]);
      if (f.isDirectory())
        continue;//Ignore directory
      FileInputStream in = new FileInputStream(f); // Stream to read file
   // ZipEntry entry = new ZipEntry(f.getPath()); // con la estructura de carpetas, toda la ruta
      ZipEntry entry = new ZipEntry(f.getPath().substring(f.getPath().lastIndexOf("/")+1)); // sin toda la ruta
      out.putNextEntry(entry); // Store entry
      while ((bytesRead = in.read(buffer)) != -1)
        out.write(buffer, 0, bytesRead);
      in.close(); 
    }
    out.close();
  }

}