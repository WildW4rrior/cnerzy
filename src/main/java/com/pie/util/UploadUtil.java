package com.pie.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.attribute.PosixFilePermission;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
/**
 * UploadUtil class is use to upload file
 * @author PieInfosystems
 *
 */
@Component
public class UploadUtil {
	
	@Autowired
	private Environment env;

	private static final Logger logger = LoggerFactory.getLogger(UploadUtil.class);
		
	public  String uploadToDirectory(MultipartFile multipartFile,String path)
			throws IllegalStateException, IOException {
		logger.info("Starting uploading file {} ...");
		String httpUrl = null;
		try {
			if (null != multipartFile.getOriginalFilename() && multipartFile.getOriginalFilename() != "") {
				logger.info("Starting uploading file {} ...", multipartFile.getOriginalFilename());
				String fileName = multipartFile.getOriginalFilename().replace(" ", "_");
				Long systemTime = System.currentTimeMillis();
				String destination = path+ "/" + systemTime
						+ fileName;
				File file = new File(destination);
				multipartFile.transferTo(file);
				logger.info("saved to file {}..  ", file);

				HashSet<PosixFilePermission> set = new HashSet<PosixFilePermission>();
				// Adding owner's file permissions
				set.add(PosixFilePermission.OWNER_EXECUTE);
				set.add(PosixFilePermission.OWNER_READ);
				set.add(PosixFilePermission.OWNER_WRITE);
				// Adding group's file permissions
				set.add(PosixFilePermission.GROUP_EXECUTE);
				set.add(PosixFilePermission.GROUP_READ);
				set.add(PosixFilePermission.GROUP_WRITE);
				// Adding other's file permissions
				set.add(PosixFilePermission.OTHERS_EXECUTE);
				set.add(PosixFilePermission.OTHERS_READ);
				set.add(PosixFilePermission.OTHERS_WRITE);
				logger.info("Added Permissions to File ... ");
				Files.setPosixFilePermissions(file.toPath(), set);
				httpUrl = env.getProperty("image.http.path")+systemTime
						+ fileName;
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error uploading file : {} ", e.getLocalizedMessage());
			logger.error("Error uploading file : {} ", e.getStackTrace().toString());
		}
		logger.info("Upload complete file {} , returning url as {}", multipartFile.getOriginalFilename(), httpUrl);
		return httpUrl;
	}
	
	public Map<String, Object> uploadFileFromUrl(String fileUrl, String path) throws IOException {
        logger.info("Starting downloading file from URL: {}", fileUrl);
        Map<String, Object> fileDetails = new HashMap<>();
        String httpUrl = null;
        Long systemTime = System.currentTimeMillis();
        HttpURLConnection httpConn = null;
        InputStream inputStream = null;
        FileOutputStream outputStream = null;
        try {
            URL url = new URL(fileUrl);
            httpConn = (HttpURLConnection) url.openConnection();
            int responseCode = httpConn.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                String fileName = "";
                String disposition = httpConn.getHeaderField("Content-Disposition");

                if (disposition != null) {
                    int index = disposition.indexOf("filename=");
                    if (index > 0) {
                        fileName = disposition.substring(index + 10, disposition.length() - 1);
                        logger.info("disposition file Name", fileName);
 if(StringUtil.isNullOrEmpty(fileName)) {
                        	fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
                        	 logger.info("getting name from url", fileName);
                        }
                    }
                } else {
                    fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
               	 logger.info("getting name from url", fileName);

                }


                inputStream = httpConn.getInputStream();
                String destination = path + "/" + systemTime + fileName;
                File file = new File(destination);
                outputStream = new FileOutputStream(file);

                IOUtils.copy(inputStream, outputStream);
            	HashSet<PosixFilePermission> set = new HashSet<PosixFilePermission>();
				// Adding owner's file permissions
				set.add(PosixFilePermission.OWNER_EXECUTE);
				set.add(PosixFilePermission.OWNER_READ);
				set.add(PosixFilePermission.OWNER_WRITE);
				// Adding group's file permissions
				set.add(PosixFilePermission.GROUP_EXECUTE);
				set.add(PosixFilePermission.GROUP_READ);
				set.add(PosixFilePermission.GROUP_WRITE);
				// Adding other's file permissions
				set.add(PosixFilePermission.OTHERS_EXECUTE);
				set.add(PosixFilePermission.OTHERS_READ);
				set.add(PosixFilePermission.OTHERS_WRITE);
				logger.info("Added Permissions to File ... ");
				Files.setPosixFilePermissions(file.toPath(), set);
				httpUrl = env.getProperty("image.http.path")+systemTime
						+ fileName;
		        fileDetails.put("url", httpUrl);
		        fileDetails.put("name", fileName);
		        fileDetails.put("size", file.length());
		        fileDetails.put("type", getFileMimeType(file));
		        logger.info("fileDetailsMap", fileDetails);
            } else {
                throw new IOException("No file to download. Server replied HTTP code: " + responseCode);
            }
        } finally {
            if (inputStream != null) {
                inputStream.close();
            }
            if (outputStream != null) {
                outputStream.close();
            }
            if (httpConn != null) {
                httpConn.disconnect();
            }
        }
        logger.info("Download and upload complete, returning URL as {}", httpUrl);

        return fileDetails;
    }
	
	private String getFileMimeType(File file) throws IOException {
        return Files.probeContentType(file.toPath());
    }
	
	public void readImage(HttpServletResponse response, String url)
			throws IOException, MalformedURLException {
		
		try {
			byte[] b = IOUtils.toByteArray((new URL(url)).openStream());
			OutputStream ot = response.getOutputStream();
			ot.write(b);
			ot.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public byte[] readImage(String url) throws MalformedURLException, IOException {
		return IOUtils.toByteArray((new URL(url)).openStream());
	}
}