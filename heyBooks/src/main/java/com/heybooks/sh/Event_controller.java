package com.heybooks.sh;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class Event_controller {
	
	//진행중 이벤트 
	@RequestMapping(value = "/event_proceed", method = RequestMethod.GET)
	public String event_proceed() {
		return ".event_news.event_proceed";
	}
	
	//지난 이벤트 
		@RequestMapping(value = "/event_ended", method = RequestMethod.GET)
		public String event_ended() {
			return ".event_news.event_ended";
		}
	

	
}
