package com.younes.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.Part;

public class Utils {
	
	public static String getNomFichier( Part part ) {
		String output = null;
	    for ( String contentDisposition : part.getHeader( "content-disposition" ).split( ";" ) ) {
	        if ( contentDisposition.trim().startsWith("filename") ) {
	            /* Si "filename" est présent, alors renvoi du nom de fichier. */
	        	output = contentDisposition.substring( contentDisposition.indexOf( '=' ) + 1 );
	            return output;
	        }
	    }
	    return output;
	}
	
	public static byte [] ImageToByte(Part imageInput) {
		
		int TAILLE_TAMPON = 10240; //taille du tampon pour extraire la photo id : 10 ko
		
		//Ce ternaire est pour le cas où on n'ajoute pas de photo pour retourner null
		String nomidPhotoInput = getNomFichier(imageInput).equals("\"\"") ? null : getNomFichier(imageInput);

		if ( nomidPhotoInput != null && !nomidPhotoInput.isEmpty() ) {
	        BufferedInputStream entree = null;
	        ByteArrayOutputStream bos = new ByteArrayOutputStream();
	        byte[] tampon = new byte[TAILLE_TAMPON];
	        
	        try {
	            /* Ouvre les flux. */
	            entree = new BufferedInputStream( imageInput.getInputStream(), TAILLE_TAMPON );
                for (int readNum; (readNum = entree.read(tampon)) != -1;) {
                    bos.write(tampon, 0, readNum);
                }
                return bos.toByteArray();
	        } catch (IOException ex) {
	        	ex.printStackTrace(System.err);
	        	return null;
	        } finally {
	            try {
	                bos.close();
	            } catch ( IOException ignore ) { }
	            try {
	                entree.close();
	            } catch ( IOException ignore ) { }
	        }
	        
	    }
		return null;
     
    }
	
	public static byte [] ImageToByte(File file) throws FileNotFoundException{
        FileInputStream fis = new FileInputStream(file);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];
        try {
            for (int readNum; (readNum = fis.read(buf)) != -1;) {
                bos.write(buf, 0, readNum);      
                System.out.println("read " + readNum + " bytes,");
            }
        } catch (IOException ex) {
        }
        byte[] bytes = bos.toByteArray();
     
     return bytes; 
    }
}
