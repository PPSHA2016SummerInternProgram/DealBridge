package com.paypal.dealbridge.web.util;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 * Created by chaorshi on 2016/8/17.
 */
public class GPSUtil {
    private static String KEY = "X5LMOwZinR2H4vwvUUkE95fei0yfAN3r";
    private static String URL = "http://api.map.baidu.com/geocoder/v2/?ak=%s&location=%f,%f&output=json&pois=0";
    public static String geoDecoder(double latitude, double longitude) {
        RestTemplate restTemplate = new RestTemplate();
        String url = String.format(URL, KEY, latitude, longitude);
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        if(response.getStatusCode() == HttpStatus.OK) {
            JSONObject json = new JSONObject(response.getBody());
            JSONObject result = json.getJSONObject("result");
            JSONObject formattedAddress = result.getJSONObject("addressComponent");
            return formattedAddress.getString("city");
        }
        return "上海";
    }
}