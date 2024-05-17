package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.Service;

public interface IServiceRepository extends JpaRepository<Service, Long> {
}
