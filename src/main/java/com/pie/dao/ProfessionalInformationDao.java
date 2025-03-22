package com.pie.dao;

import com.pie.entity.ProfessionalInformation;

public interface ProfessionalInformationDao {

	void save(ProfessionalInformation professionalInformation);

	void update(ProfessionalInformation professionalInformation);

	ProfessionalInformation getProfessionalInfoByCompanyId(Integer companyId);

}
