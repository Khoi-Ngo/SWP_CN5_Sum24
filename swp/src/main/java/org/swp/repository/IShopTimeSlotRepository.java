package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.swp.entity.ShopTimeSlot;

@Repository
public interface IShopTimeSlotRepository extends JpaRepository<ShopTimeSlot, Long> {
}
