package com.paypal.dealbridge.storage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.paypal.dealbridge.storage.domain.City;

@Mapper
public interface CityMapper {
    @Select("SELECT * FROM CITY WHERE id = #{id}")
    City getById(Integer id);
}
