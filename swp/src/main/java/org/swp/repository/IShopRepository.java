package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.Shop;

public interface IShopRepository extends JpaRepository<Shop, Integer> {
}
