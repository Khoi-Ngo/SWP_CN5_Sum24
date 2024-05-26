package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.CacheShopTimeSlot;
import org.swp.entity.Shop;

public interface ICacheShopTimeSlotRepository extends JpaRepository<CacheShopTimeSlot, Long> {
}
