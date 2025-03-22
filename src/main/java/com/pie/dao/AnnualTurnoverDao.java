package com.pie.dao;

import java.util.List;

import com.pie.entity.AnnualTurnover;

public interface AnnualTurnoverDao {

	void save(AnnualTurnover annualTurnover);

	Boolean saveAll(List<AnnualTurnover> annualTurnovers);

	List<AnnualTurnover> getAnnualTurnoversByIdList(List<Integer> ids);

	List<AnnualTurnover> getAnnualTurnoversByCompanyId(Integer companyId);

	void update(AnnualTurnover annualTurnover);

	AnnualTurnover getAnnualTurnoversById(Integer id, Integer companyId);

}
