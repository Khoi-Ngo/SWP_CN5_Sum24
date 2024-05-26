package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.swp.entity.Shop;
@Repository
public interface IShopRepository extends JpaRepository<Shop, Integer> {
}
