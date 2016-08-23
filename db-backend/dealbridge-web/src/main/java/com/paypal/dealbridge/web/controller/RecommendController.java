package com.paypal.dealbridge.web.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paypal.dealbridge.service.RecommendService;
import com.paypal.dealbridge.service.recommend.RecommendQueryException;
import com.paypal.dealbridge.storage.domain.BriefDiscount;
import com.paypal.dealbridge.storage.domain.Discount;

@Controller
public class RecommendController {

	@Autowired
	private RecommendService recommendService;

	private Map<String, String> typeMap = new HashMap<String, String>(){
		{
			put("food", "美食");
			put("entertainment", "休闲娱乐");
			put("shopping", "购物");
			put("car", "汽车");
			put("dailyservice", "生活服务");
			put("travelling", "旅游");
			put("fashion", "时尚丽人");
			put("cards_gifts", "办卡送礼");
			put("hotel", "酒店");
			put("outing", "出行");
		}
	};
	
	private Map<String, String> bankMap = new HashMap<String, String>() {
		{
			put("上海", "shanghai");
			put("中信", "zhongxin");
			put("中国", "zhongguo");
			put("交行", "jiaohang");
			put("光大", "guangda");
			put("兴业", "xingye");
			put("农业", "nongye");
			put("北京银行", "beijing");
			put("华夏", "huaxia");
			put("工行", "gonghang");
			put("平安", "pingan");
			put("广发", "guangfa");
			put("建设", "jianshe");
			put("招商", "zhaoshang");
			put("民生", "minsheng");
			put("浦发", "pufa");
			put("渣打银行", "zhada");
			put("花旗", "huaqi");
		}
	};

	@RequestMapping(path = "/api/recommendation/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getCustomizedDiscounts(@PathVariable("userId") int userId,
			@RequestParam(value = "startIndex", required = false) Integer start,
			@RequestParam(value = "limitNumber", required = false) Integer number,
			@RequestParam(value = "lat") Double latitude,
			@RequestParam(value = "lng") Double longitude)
			throws JSONException, RecommendQueryException, ParseException {
		return recommendService.getCustomizedDiscounts(userId, start, number, latitude, longitude);
	}

	@RequestMapping(path = "/api/recommendation/{type}/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getTypeDiscounts(@PathVariable("type") String type, @PathVariable("userId") int userId,
			@RequestParam(value = "latitude", required = false) double latitude,
			@RequestParam(value = "longitude", required = false) double longitude,
			@RequestParam(value = "area", required = false) String area,
			@RequestParam(value = "startIndex", required = false) Integer start,
			@RequestParam(value = "limitNumber", required = false) Integer number)
			throws JSONException, RecommendQueryException, ParseException, UnsupportedEncodingException {
		return recommendService.getDiscountByType(userId, latitude, longitude, start, number, type, area);
	}

	@RequestMapping(path = "/api/nearby", method = RequestMethod.GET)
	@ResponseBody
	public List<BriefDiscount> getNearbyDiscounts(@RequestParam(value = "latitude") double latitude,
			@RequestParam(value = "longitude") double longitude,
			@RequestParam(value = "startIndex", required = false) Integer start,
			@RequestParam(value = "limitNumber", required = false) Integer number)
			throws JSONException, RecommendQueryException, ParseException {
		return recommendService.getNearbyDiscounts(latitude, longitude, start, number);
	}
	
	
	@RequestMapping(path = "/api/recommend/{bankName}/{userId}", method = RequestMethod.GET)
	public List<BriefDiscount> getBankDiscounts(@PathVariable("bankName") String bankName, 
			@PathVariable("userId") int userId, 
			@RequestParam(value = "latitude") Double latitude,
			@RequestParam(value = "longitude") Double longitude,
			@RequestParam(value = "startIndex", required = false) Integer start,
			@RequestParam(value = "limitNumber", required = false) Integer number)
	throws JSONException, RecommendQueryException, ParseException {
		return recommendService.getDiscountsByBank(latitude, longitude, start, number, userId, bankMap.get(bankName));
	}
	
	@RequestMapping(path = "/bankRecommend/{bankName}", method = RequestMethod.GET)
	public String showBankDiscount(@PathVariable("bankName") String bankName, Model model, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		double latitude = (double) session.getAttribute("latitude");
		double longitude = (double) session.getAttribute("longitude");
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		model.addAttribute("userId", userId);
		model.addAttribute("bankName", bankName);
		return "bank_discount";
	}
	
	@RequestMapping(path = "/nearby", method = RequestMethod.GET)
	public String showNearby(@RequestParam(value = "lat") double latitude,
			@RequestParam(value = "lng") double longitude, Model model) {
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		return "nearby";
	}
	

	@RequestMapping(path = "/recommendation/{type}", method = RequestMethod.GET)
	public String showRecommend(@PathVariable("type") String type, Model model, HttpSession session) {
		int userId = (int) session.getAttribute("userId");
		String area = (String) session.getAttribute("area");
		double latitude = (double) session.getAttribute("latitude");
		double longitude = (double) session.getAttribute("longitude");
		model.addAttribute("area", area);
		model.addAttribute("userId", userId);
		model.addAttribute("type", type);
		model.addAttribute("type_chinese", typeMap.get(type));
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		return "recommend";
	}
	
	//Yao add
	@RequestMapping(path = "/hot", method = RequestMethod.GET)
	public String showRHot( Model model, HttpSession session) {
		String area = (String) session.getAttribute("area");
		model.addAttribute("area", area);		
		return "hot";
	}
	
	@RequestMapping(path = "/api/hot", method = RequestMethod.GET)
	@ResponseBody
	public List<Discount> getHotDiscounts(@RequestParam(value = "area", required = false)String area,
			@RequestParam(value = "startIndex", required = false) Integer start,
			@RequestParam(value = "limitNumber", required = false) Integer number)
			throws JSONException, RecommendQueryException, ParseException {
		    return recommendService.getHotDiscounts(area, start, number);
	}
	
	
	
}
