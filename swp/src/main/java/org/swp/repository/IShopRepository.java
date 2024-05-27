package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.swp.entity.Service;
import org.swp.entity.Shop;
import org.swp.enums.TypePet;

import java.util.List;

@Repository
public interface IShopRepository extends JpaRepository<Shop, Integer> {
    @Query(value = "SELECT s FROM tbl_shop s ORDER BY nomination DESC LIMIT :numberOfRecords", nativeQuery = true)
    List<Service> findMostRcmdShops(@Param("numberOfRecords") int numberOfRecords);

    //TODO: rewrite query for appropriate business logic
//    @Query(value = "SELECT s FROM tbl_service s ORDER BY nomination DESC LIMIT :numberOfRecords", nativeQuery = true)
    List<Service> findMostRcmdShops(@Param("typePet") TypePet typePet, @Param("numberOfRecords") int numberOfRecords);


}
