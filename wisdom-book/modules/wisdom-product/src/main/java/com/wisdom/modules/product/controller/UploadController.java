package com.wisdom.modules.product.controller;

import com.wisdom.framework.core.util.Commons.Commons;
import com.wisdom.framework.core.util.UploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @RequestMapping("upload")
    public void upload(HttpServletRequest request,String fileName, Writer out) throws IOException {
        //将request装换为多部件(复杂)
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
        //获取文件
        /*Map<String, MultipartFile> map = mr.getFileMap();
        Set<String> set = map.keySet();
        Iterator<String> iterator = set.iterator();
        String fileInputName = iterator.next();
        MultipartFile mf = map.get(fileInputName);*/
        MultipartFile mf =  mr.getFile(fileName);
        //获得文件的字节数组
        byte[] bs = mf.getBytes();
        String newfileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        Random random = new Random();
        for (int i = 0; i < 3; i++){
            newfileName = newfileName + random.nextInt(10);
        }
        String oriFileName = mf.getOriginalFilename();
        String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
       //获得绝对路径
        //相对路径
        //Client client = Client.create();
        //WebResource wr = client.resource(Commons.PIC_HOST+"/image/"+newfileName+suffix);
        //上传
        //wr.put(bs);
        //wr.put(String.class, bs);

        String realPath = UploadUtil.getFilePath()+"/image/"+newfileName+suffix;
        mf.transferTo(new File("F:\\编程学习\\IEDA\\项目\\wisdom-book\\development\\target\\development-1.0-SNAPSHOT\\image/" + newfileName+suffix));
        String relativePath = "/image/"+newfileName+suffix;
        String result = "{\"realPath\":\""+realPath+"\",\"relativePath\":\""+relativePath+"\"}";
        /*JSONObject jo = new JSONObject();
        String result = JSON.toJSONString("{\"realPath\":\""+realPath+"\",\"relativePath\":\""+relativePath+"\"}");*/
        //System.out.println(result);
        out.write(result);
    }
}