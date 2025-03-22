package com.pie.dao;

import java.util.List;

import com.pie.entity.ExportsTo;

public interface ExportToDao {

	Boolean saveAll(List<ExportsTo> exportsToList);

	List<ExportsTo> getAllExportsToByCompanyId(Integer companyId);

	void update(ExportsTo exportsTo);

	void save(ExportsTo exportsTo);

	List<ExportsTo> getExportsToByIdList(List<Integer> exporterIds);

}
