package com.wisdom.modules.product.controller;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.ws.api.ha.StickyFeature;
import com.wisdom.framework.core.data.PagerRequest;
import com.wisdom.framework.core.exception.BusinessException;
import com.wisdom.modules.common.mq.Productor;
import com.wisdom.modules.product.domain.Cart;
import com.wisdom.modules.product.domain.Product;
import com.wisdom.modules.product.domain.Receiver;
import com.wisdom.modules.product.service.OrderService;
import com.wisdom.modules.product.service.ProductService;
import com.wisdom.modules.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("index")
    public String index(Model model)  {
        try {
            List<Product> products = productService.selectRSell();
            model.addAttribute("products",products);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping("adminProductList")
    public String list(Model model,PagerRequest pagerRequest)  {
        try {
            if (pagerRequest.getStartPage() == null){
                pagerRequest.setStartPage(1);
            }
            pagerRequest.setPageLength(2);
            PageInfo<Product> pageInfo = null;
            pageInfo = productService.selectByPage(pagerRequest.getStartPage(), pagerRequest.getPageLength());
            model.addAttribute("pages",pageInfo);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/productManage/list";
    }

    @RequestMapping("adminProductEdit")
    public String edit(Model model, String id){
        Product p = null;
        try {
            p = productService.getByUniqueKey(id);
            model.addAttribute("product",p);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "admin/productManage/editProduct";
    }

    @RequestMapping("adminProductSaveEdit")
    public String productSaveEdit(Product product){
        try {
            productService.update(product);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "redirect:/product/adminProductList.do";
    }

    @RequestMapping("adminProductAddPage")
    public String add(){
        return "admin/productManage/addProduct";
    }

    @RequestMapping("adminProductAdd")
    public String productAdd(Product product){

        //String id = UUID.randomUUID().toString();
        String id = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
        product.setId(id);
        try {
            productService.insert(product);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "redirect:/product/adminProductList.do";
    }

    @RequestMapping("adminProductDelete")
    public String delete(String[] ids){

        if(ids == null || ids.length <= 0){
            return "redirect:/product/list.do";
        }else{
            try {
                productService.deleteById(ids);
            } catch (BusinessException e) {
                e.printStackTrace();
            }
            return "redirect:/product/adminProductList.do";
        }
    }
    /**
     * 前台
     */
    @RequestMapping("productList")
    public String productList(String category, String name, PagerRequest pagerRequest, HttpServletRequest request, Model model){
        //int condition= (int) request.getSession().getAttribute("condition");
       //判断是条件查询还是是类别查询
        if(name != null){ // 条件查询
           String bookName = (String) request.getSession().getAttribute("bookName");
           if(name != null ){
               if(!name.equals(bookName)){
                   bookName = name;
                   request.getSession().setAttribute("bookName",bookName);
               }
           }
           model.addAttribute("category","含有"+bookName+"的书");
           if(pagerRequest.getStartPage()==null){
               pagerRequest.setStartPage(1);
           }
           pagerRequest.setPageLength(4);
           PageInfo<Product> pageInfo = null;
           try {
               pageInfo = productService.selectByBookNamePage(pagerRequest.getStartPage(), pagerRequest.getPageLength(), bookName);
           } catch (BusinessException e) {
               e.printStackTrace();
           }
           // List<Product> productList = productService.selectBycategory(category);
           model.addAttribute("pager", pageInfo);
           request.getSession().setAttribute("condition",1);
           return "product_list";
       }else if (category != null){// 按类别查询
           String category1 = (String) request.getSession().getAttribute("category");
           if(category != null ){
               if(!category.equals(category1)){
                   category1 = category;
                   request.getSession().setAttribute("category",category1);
               }
           }
           model.addAttribute("category",category1);
            if("所有书籍".equals(category1)){
                category1 = null;
            }
           if(pagerRequest.getStartPage()==null){
               pagerRequest.setStartPage(1);
           }
           pagerRequest.setPageLength(4);
           PageInfo<Product> pageInfo = null;
           try {
               pageInfo = productService.selectByPage(pagerRequest.getStartPage(), pagerRequest.getPageLength(), category1);
           } catch (BusinessException e) {
               e.printStackTrace();
           }
           // List<Product> productList = productService.selectBycategory(category);
           model.addAttribute("pager", pageInfo);
           request.getSession().setAttribute("condition",0);
           return "product_list";

           //下一页，上一页，判断是按类别查询还是按条件搜索
       }else {
           int condition = (int) request.getSession().getAttribute("condition");

            if(condition == 1){ //按条件搜索

                String bookName = (String) request.getSession().getAttribute("bookName");
                model.addAttribute("category","含有"+bookName+"的书");
                if(pagerRequest.getStartPage()==null){
                    pagerRequest.setStartPage(1);
                }
                pagerRequest.setPageLength(4);
                PageInfo<Product> pageInfo = null;
                try {
                    pageInfo = productService.selectByBookNamePage(pagerRequest.getStartPage(), pagerRequest.getPageLength(), bookName);
                } catch (BusinessException e) {
                    e.printStackTrace();
                }
                // List<Product> productList = productService.selectBycategory(category);
                model.addAttribute("pager", pageInfo);
                request.getSession().setAttribute("condition",1);
                return "product_list";
            }else {//按条件搜索
                String category1 = (String) request.getSession().getAttribute("category");

                model.addAttribute("category",category1);
                if("所有书籍".equals(category1)){
                    category1 = null;
                }
                if(pagerRequest.getStartPage()==null){
                    pagerRequest.setStartPage(1);
                }
                pagerRequest.setPageLength(4);
                PageInfo<Product> pageInfo = null;
                try {
                    pageInfo = productService.selectByPage(pagerRequest.getStartPage(), pagerRequest.getPageLength(), category1);
                } catch (BusinessException e) {
                    e.printStackTrace();
                }
                // List<Product> productList = productService.selectBycategory(category);
                model.addAttribute("pager", pageInfo);
                request.getSession().setAttribute("condition",0);
                return "product_list";
            }
       }
    }

    @RequestMapping("productInfo")
    public String productInfo(String id, Model model){

        Product product = null;
        try {
            product = productService.getByUniqueKey(id);
            productService.updateAttackNum(id);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        if(product != null){
            model.addAttribute("product",product);
            return "product_info";
        }else {
            return "product_list";
        }
    }
    @Autowired
    private OrderService orderService;

    @RequestMapping("productInfo1")
    public String productInfo1(String id, Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            request.setAttribute("login", "2");
            return "login";
        }
        Product product = null;
        try {
            product = productService.getByUniqueKey(id);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String format = sdf.format(new Date());
            Date date1 = sdf.parse(format);
            Date date2 = sdf.parse("2018-05-1 0:00:00");
            long  time = (date2.getTime()-System.currentTimeMillis())/1000;
            model.addAttribute("time1",time);
            Receiver receiver =  orderService.selectReceiverByUserId(user.getId());
            if (receiver != null){
                model.addAttribute("receiver", receiver);
                request.getSession().setAttribute("receiver1",1);
            }else {
                request.getSession().setAttribute("receiver1",0);
            }
        } catch (BusinessException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }
        if(product != null){
            model.addAttribute("product",product);
            return "product_info1";
            //return "time";
        }else {
            return "product_list";
        }
    }
    @Autowired
    private Productor productor;
    static int a = 1;
    @RequestMapping("spikeOrder")
    public String spikeOrder(String pid, Model model, HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            request.setAttribute("login", "2");
            return "login";
        }
        try {
            a = a - 1;
            if(a >= 0 ){
                productor.sendMessage(user.getId());
                Product product = productService.getByUniqueKey(pid);
                productService.updateIfSell(pid);
                Receiver receiver = orderService.selectReceiverByUserId(user.getId());
                model.addAttribute("receiver", receiver);
                model.addAttribute("product", product);
            }else {
                model.addAttribute("spike", "1");
                return "product_info1";
            }
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return "order1";
    }

    @RequestMapping("searchByName")
    @ResponseBody
    public String searchByName(String name, HttpServletResponse response){
        try {
            List<String> names = productService.selectByName(name);
            String str = "";
            if (names.size()<5){
                for(int i = 0; i < names.size(); i++){
                    str+=","+names.get(i);
                }
            }else {
                for(int i = 0; i < 4; i++){
                    str+=","+names.get(i);
                }
            }
            response.setContentType("text/html;charset=UTF-8");
            return str;
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return null;
    }

}
