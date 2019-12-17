package com.heybooks.sh.controller.item;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.service.item.Item_Main_Service;
import com.heybooks.sh.vo.item.Item_Cate_Vo;
import com.heybooks.sh.vo.item.Item_Vo;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class Item_Jackson {
	private static final Logger logger = LoggerFactory.getLogger(Item_Jackson.class);

	
	@Resource 
	Item_Category_Service cate_service;
	
	@Resource  
	Item_Main_Service service; 
	 
	//상품 카테고리 리스트
	@RequestMapping("/jackson/item_cate")
	@ResponseBody
	public List<Item_Cate_Vo> cate_list(String cate_code){
		logger.info("json/get Item-cate-list");
		List<Item_Cate_Vo> clist = cate_service.cate_list(cate_code);
		logger.info(String.valueOf(clist.size()));
		return clist; 
	}
	
	//상품 이미지 업로드
	@RequestMapping("/file_upload")
	@ResponseBody
	public String file_upload(MultipartHttpServletRequest request) {
		logger.info("json/post Item-file-upload");
		
		 String ROOT_PATH = request.getSession().getServletContext().getRealPath("/");
		 String SAVE_PATH = "resource/upload/";
		  
		MultipartFile file = request.getFile("item_file"); 
		List<MultipartFile> file_list = new ArrayList<MultipartFile>();
		Map<String, MultipartFile> test = request.getFileMap();
		int pv_length =Integer.parseInt(request.getParameter("pv_length")); 
	  
		Item_Vo vo = new Item_Vo();
		
		//단일 파일 업로드      
		String org_file_name = file.getOriginalFilename();
		long file_size = file.getSize();
		String sav_file_name =  System.currentTimeMillis() + org_file_name;
		String sav_file = ROOT_PATH+ SAVE_PATH + sav_file_name;
		logger.info(sav_file);
		try { 
			if(file_size > 0) {
				file.transferTo(new File(sav_file));
				//썸네일(작은 이미지) 생성
				File image = new File(sav_file);
				if(image.exists()) {     
					String img_name = image.getName();
					int idx = img_name.lastIndexOf(".");
					String rimg_name = img_name.substring(0,idx); 
					String thumbnail_file_name = rimg_name + "-small";
					File tumbnail = new File( ROOT_PATH + SAVE_PATH  + thumbnail_file_name);
					tumbnail.getParentFile().mkdir();
					Thumbnails.of(image).size(203,305).outputFormat("jpg").toFile(tumbnail);
					String item_pic = sav_file_name + "," + thumbnail_file_name + ".jpg";
					logger.info(item_pic);
					vo.setProduct_picture(item_pic);
				}  
			} 
			
			//다중 파일 업로드  
			for(int i = 0; i< pv_length ;i++) { 
				file_list.add(test.get("pv_arr"+ i));
			}
			if(file_list != null) { 
				String item_preview = "";
				for(MultipartFile mf : file_list) {
					String pv_org_file_name = mf.getOriginalFilename();
					long pv_file_size = mf.getSize();
					String pv_sav_file_name =  System.currentTimeMillis() + pv_org_file_name;
					String pv_sav_file = ROOT_PATH + SAVE_PATH + pv_sav_file_name;
					mf.transferTo(new File(pv_sav_file));
					item_preview  +=  pv_sav_file_name + ",";
				}  
				item_preview = item_preview.substring(0,item_preview.length()-1); //마지막 쉼표 제거
				logger.info(item_preview);
				vo.setProduct_preview(item_preview);
			}  
			service.item_img_insert(vo); 
			return "success";
		} catch (IllegalStateException e) { 
				e.printStackTrace();	 
				return "error";
		} catch (IOException e) {    
				e.printStackTrace();
				return "error";
		}   
		
	}


}
