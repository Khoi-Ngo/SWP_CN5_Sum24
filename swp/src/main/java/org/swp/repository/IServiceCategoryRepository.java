package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.ServiceCategory;
import org.swp.entity.Shop;

public interface IServiceCategoryRepository extends JpaRepository<ServiceCategory, Long> {
}
