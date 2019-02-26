package com.documents.controller;

import com.documents.entity.Document;
import com.documents.entity.User;
import com.documents.services.DocumentService;
import com.documents.services.UserService;
import com.documents.services.impl.DocumentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Parameter;

@Controller
public class DocumentController {
    @Autowired
    DocumentService documentService;
    @Autowired
    UserService userService;

    @RequestMapping(value = "admin/add", method = RequestMethod.GET)
    public String getRegistrationPage(Model model) {
        model.addAttribute("document", new Document());
        return "add";
    }

    @RequestMapping(value = "admin/add", method = RequestMethod.POST)
    public String addNewDocument(@RequestParam(value = "file") MultipartFile file) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.getByLogin(authentication.getName());
        Document document = new Document();
        document.setUser(user);
        try {
            document.setFile(file.getBytes());
            document.setName(file.getOriginalFilename());
            document.setType(file.getContentType());
        } catch (IOException e) {
            e.printStackTrace();
        }
        documentService.newDocument(document);
        return "redirect:/documents";
    }

    @RequestMapping(value = "documents", method = RequestMethod.GET)
    public ModelAndView showAllDocuments(Model model) {
        ModelAndView mav = new ModelAndView("show_docs");
        mav.addObject("documents", documentService.allDocuments());
        return mav;
    }

    @RequestMapping(value = "documents", method = RequestMethod.PUT)
    public String changeDocument(@RequestParam("id") Integer id,
                                 @RequestParam("name")  String name){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.getByLogin(authentication.getName());
        Document document = documentService.getById(id);
        document.setName(name);
        documentService.updateById(document);
        return "documents";
    }

    @RequestMapping(value = "documents", method = RequestMethod.DELETE)
    public String deleteDocument(@RequestParam("id") Integer id){
        documentService.deleteById(id);
        return "documents";
    }

    @RequestMapping(value = { "/documents/download" }, method = RequestMethod.GET)
    public void downloadDocument(@RequestParam("id") Integer id,
                                   HttpServletResponse response) throws IOException {
        Document document = documentService.getById(id);
        response.setContentType(document.getType());

        System.out.println(document.getType());
        response.setContentLength(document.getFile().length);
        response.setHeader("Content-Disposition","attachment; filename=\"" + document.getName() +"\"");

        FileCopyUtils.copy(document.getFile(), response.getOutputStream());
    }

}
