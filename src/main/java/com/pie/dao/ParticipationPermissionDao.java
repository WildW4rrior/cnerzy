package com.pie.dao;

import com.pie.entity.ParticipationPermission;

public interface ParticipationPermissionDao {

	void save(ParticipationPermission permission);

	void update(ParticipationPermission permission);

	ParticipationPermission getParticipationPermissionByCompanyId(Integer companyId);

	ParticipationPermission getParticipationPermissionById(Integer id);

}
