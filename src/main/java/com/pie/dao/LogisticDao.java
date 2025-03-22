package com.pie.dao;

import java.util.List;

import com.pie.entity.LogisticServiceProvider;

public interface LogisticDao {

	void save(LogisticServiceProvider logistic);

	void update(LogisticServiceProvider logistic);

	Boolean saveAll(List<LogisticServiceProvider> logistics);

	List<LogisticServiceProvider> getAllLogisticProviderByCompanyId(Integer companyId);

	List<LogisticServiceProvider> getLogisticServiceProvidersByIdList(List<Integer> ids);

}
