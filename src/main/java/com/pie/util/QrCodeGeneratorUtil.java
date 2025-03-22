package com.pie.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QrCodeGeneratorUtil {

	
	public static void generateQRCodeImage(String text, int width, int height, String filePath)
            throws WriterException, IOException {
		int onColorBlack = 0xFF000000;
		int offColorWhite = 0xFFFFFFFF;
		generateQRCodeImage(text, width, height, filePath, onColorBlack, offColorWhite);;
    }

	public static void generateQRCodeImage(String text, int width, int height, String filePath, int onColor, int offColor)
            throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);
        MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(onColor, offColor);
        Path path = FileSystems.getDefault().getPath(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path, matrixToImageConfig);
    }


    public static byte[] getQRCodeImage(String text, int width, int height) throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageConfig con = new MatrixToImageConfig( 0xFF000002 , 0xFFFFFFFF ) ;

        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream,con);
        byte[] pngData = pngOutputStream.toByteArray();
        return pngData;
    }
    
    public static void main(String[] args) {
    	BufferedImage bImage;
		try {
//	    	generateQRCodeImage("www.pieinfosystems.com", 500, 500,"/Users/hemantnagpal/Downloads/output1.png", 0xFF4E1C21, 0xFFFFFFFF);
	    	generateQRCodeImage("apps.yourbooks.in", 500, 500,"/Users/hemantnagpal/Downloads/output1.png", 0xFF014C90, 0xFFFFFFFF);
//			byte [] data = getQRCodeImage("yourbooks.in", 500, 500);
//			ByteArrayInputStream bis = new ByteArrayInputStream(data);
//			BufferedImage bImage2 = ImageIO.read(bis);
//			ImageIO.write(bImage2, "jpg", new File("/Users/hemantnagpal/Downloads/output.jpg"));
			System.out.println("image created");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}
	}
    
}
