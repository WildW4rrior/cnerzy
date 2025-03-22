package com.pie.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pie.dao.RatingDao;
import com.pie.entity.Rating;
import com.pie.util.Constants;

@Transactional
@Repository
public class RatingDaoImpl implements RatingDao {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Rating rating) {
		Session session = sessionFactory.getCurrentSession();
		session.save(rating);

	}

	@Override
	public void update(Rating rating) {
		Session session = sessionFactory.getCurrentSession();
		session.update(rating);

	}

	@Override
	public Boolean saveAll(List<Rating> ratings) {
		try (Session session = sessionFactory.openSession()) {
			Transaction tx = session.beginTransaction();
			int i = 0;
			for (Rating rating : ratings) {
				session.save(rating);
				if (i % Constants.BATCH_SIZE_HIBERNATE == 0) { // 50, same as the JDBC batch size
					// flush a batch of inserts and release memory:
					session.flush();
					session.clear();
				}
				i++;
			}
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Rating> getRatingsByProjectId(Integer projectId) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Rating.class);
		criteria.add(Restrictions.eq("projectId", projectId));
		return (List<Rating>) criteria.list();
	}
	
	@Override
	public Map<String, Object> getRatingStatsForCompany(Integer companyId) {
        Session session = sessionFactory.getCurrentSession();

        Criteria uniqueProjectCountCriteria = session.createCriteria(Rating.class)
                .add(Restrictions.eq("ratedForCId", companyId))
                .setProjection(Projections.countDistinct("projectId"));
            Long uniqueProjectCount = (Long) uniqueProjectCountCriteria.uniqueResult();

            Criteria avgRatingCriteria = session.createCriteria(Rating.class)
                .add(Restrictions.eq("ratedForCId", companyId))
                .setProjection(Projections.avg("ratingValue"));
            Double avgRating = (Double) avgRatingCriteria.uniqueResult();

            Map<String, Object> stats = new HashMap<>();
            stats.put("ratingCount", uniqueProjectCount);
            stats.put("averageRating", avgRating);

            return stats;
    }
}
