package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadFileService {

    private final ServletContext servletContext;

    UploadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveFile(MultipartFile file, String targetFolder) {
        String nameFile = "";
        try {
            byte[] bytes = file.getBytes();
            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server(this is file empty in avatar)
            nameFile = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + nameFile);
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            // write bytes into file empty has generated to images file
            stream.write(bytes);
            stream.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            return nameFile;
        }
    }

}
