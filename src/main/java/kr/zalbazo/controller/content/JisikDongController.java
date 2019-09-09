package kr.zalbazo.controller.content;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.zalbazo.model.content.Content;
import kr.zalbazo.model.content.Criteria;
import kr.zalbazo.model.content.PageDTO;
import kr.zalbazo.service.ContentService;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping({"/jisikdong/*"})
public class JisikDongController {

    private static final Long JISIKDONG_CATEGORY_NUM = 2L;

    @Autowired
    private ContentService service;

    @GetMapping("/register")
    public String register(){
        return "/jisikdong/register"; //WEB-INF/views/register.jsp
    }

    @PostMapping("/register")
    public String register(Content content, RedirectAttributes rttr){
        content.setCategoryId(JISIKDONG_CATEGORY_NUM);

        service.register(content);
        
        rttr.addFlashAttribute("result", content);
        
        return "redirect:/jisikdong/list";
    }

    @GetMapping("/list")
    public void list(Criteria cri, Model model, Content content){

//      model.addAttribute("contentList", service.getList(JISIKDONG_CATEGORY_NUM));
//      service.getList(JISIKDONG_CATEGORY_NUM ).stream().forEach(System.out::println);
    	cri.setCategory(JISIKDONG_CATEGORY_NUM);
    	model.addAttribute("contentList", service.getList(cri));
    	int total = service.getTotal(cri);
    	log.info("list : " + cri);
    	model.addAttribute("pageMaker", new PageDTO(cri, total));
    }



    @GetMapping({"/get", "/modify"})
    public void detail(@RequestParam("id") Long id, Model model, @ModelAttribute("cri") Criteria cri){
        model.addAttribute("content", service.get(id));
    }

    @PostMapping("/modify")
    public String modify(Content content, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri){

        if(service.modify(content)){
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/jisikdong/list";
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("id") Long id, RedirectAttributes rttr){
    	
        if(service.remove(id)){
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/jisikdong/list";
    }
    
    @GetMapping("/uploadAjax")
    public void uploadAjax() {
    	
    	log.info("upload ajax");
    	
    }
    
    @PostMapping("/uploadAjaxAction")
    public void uploadAjaxPost(MultipartFile[] uploadFile) {
    	
    	log.info("update ajax post...");
    	
    	String uploadFolder = "C:\\upload";
    	
    	// make folder =============
    	File uploadPath = new File(uploadFolder, getFolder());
    	log.info("upload path: " + uploadPath);
    	
    	if(uploadPath.exists() == false) {
    		uploadPath.mkdirs();
    	}
    	// make yyyy/MM/dd folder
    	
    	for (MultipartFile multipartFile : uploadFile) {
    		
    		log.info("-----------------------------");
    		log.info("Upload File Name: " + multipartFile.getOriginalFilename());
    		log.info("Upload File Size: " + multipartFile.getSize());
    		
    		String uploadFileName = multipartFile.getOriginalFilename();
    		
    		// IE has file path
    		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
    		log.info("only file name: " + uploadFileName);
    		
    		//File saveFile = new File(uploadFolder, uploadFileName);
    		File saveFile = new File(uploadPath, uploadFileName);
    		
    		try{
    			multipartFile.transferTo(saveFile);
    		}catch (Exception e) {
    			log.error(e.getMessage());
    		}
    	}
    }
    
    private String getFolder() {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Date date = new Date();
    	String str = sdf.format(date);
    	return str.replace("-", File.separator);
    }
    
    }
