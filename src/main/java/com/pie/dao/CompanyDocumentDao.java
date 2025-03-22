package com.pie.dao;

import java.util.List;

import com.pie.entity.CompanyDocument;

public interface CompanyDocumentDao {

	List<CompanyDocument> getCompanyDocumentsByCompanyId(Integer companyId);

	void update(CompanyDocument document);

	void save(CompanyDocument document);

	List<CompanyDocument> getCompanyDocumentsByIdList(List<Integer> ids);

	Boolean saveAll(List<CompanyDocument> documents);

	CompanyDocument getDocumentByCompanyIdAndName(Integer companyId, String name);

	CompanyDocument getCompanyDocumentById(Integer id, Integer companyId);

	List<CompanyDocument> getDocumentByCompanyIdAndNameList(Integer companyId, List<String> names);
}
