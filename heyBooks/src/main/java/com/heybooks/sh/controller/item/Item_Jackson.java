package com.heybooks.sh.controller.item;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.heybooks.sh.service.item.Item_Category_Service;
import com.heybooks.sh.vo.item.Item_Cate_Vo;

import net.coobird.thumbnailator.Thumbnails;

@Controller
public class Item_Jackson {
	private static final Logger logger = LoggerFactory.getLogger(Item_Jackson.class);
	private static final String SAVE_PATH = "C:\\Users\\User\\git\\portfolio-1\\heyBooks\\src\\main\\resources\\upload\\";
	
	@Resource 
	Item_Category_Service service;
	 
	//��ǰ ī�װ� ����Ʈ
	@RequestMapping("/jackson/item_cate")
	@ResponseBody
	public List<Item_Cate_Vo> cate_list(String cate_code){
		logger.info("json/get Item-cate-list");
		List<Item_Cate_Vo> clist = service.cate_list(cate_code);
		logger.info(String.valueOf(clist.size()));
		return clist; 
	}
	
	//��ǰ �̹��� ���ε�
	@RequestMapping("/file_upload")
	@ResponseBody
	public void file_upload(MultipartHttpServletRequest request) {
		logger.info("json/post Item-file-upload");
		MultipartFile file = request.getFile("item_file");
		List<MultipartFile> file_list = new ArrayList<MultipartFile>();
		Map<String, MultipartFile> test = request.getFileMap();
		int pv_length =Integer.parseInt(request.getParameter("pv_length"));
	
			//���� ���� ���ε�      
			String org_file_name = file.getOriginalFilename();
			long file_size = file.getSize();
			String sav_file_name = SAVE_PATH + System.currentTimeMillis() + org_file_name;
		try {
			if(file_size > 0) {
				file.transferTo(new File(sav_file_name));
				logger.info(sav_file_name + "," + file_size);
				//�����(���� �̹���) ����
				File image = new File(sav_file_name);
				if(image.exists()) {     
					String img_name = image.getName();
					int idx = img_name.lastIndexOf(".");
					String rimg_name = img_name.substring(0,idx); 
					File tumbnail = new File( SAVE_PATH  + rimg_name + "-small");
					tumbnail.getParentFile().mkdir();
					Thumbnails.of(image).size(203,305).outputFormat("jpg").toFile(tumbnail);
				}  
			}
			//���� ���� ���ε� 
			for(int i = 0; i< pv_length ;i++) { 
				file_list.add(test.get("pv_arr"+ i));
			}
			if(file_list != null) {
				for(MultipartFile mf : file_list) {
					String pv_org_file_name = mf.getOriginalFilename();
					long pv_file_size = file.getSize();
					logger.info(pv_org_file_name);
					String pv_sav_file_name =  SAVE_PATH + System.currentTimeMillis() + pv_org_file_name;
					mf.transferTo(new File(pv_sav_file_name));
				} 
			}
			
		} catch (IllegalStateException e) { 
				e.printStackTrace();		
		
		} catch (IOException e) {   
				e.printStackTrace();
		}
		
		
		
		
		
	}


}
