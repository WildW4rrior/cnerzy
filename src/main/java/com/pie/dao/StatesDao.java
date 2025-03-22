package com.pie.dao;

public interface StatesDao {

	String getStatesCodeByStateName(String stateName);

	String getStatesNameByStatesCode(String stateCode);
}
