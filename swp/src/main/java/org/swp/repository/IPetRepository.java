package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.Pet;
import org.swp.entity.Shop;

public interface IPetRepository extends JpaRepository<Pet, Long> {
}
