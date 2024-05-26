package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.swp.entity.Booking;
@Repository
public interface IBookingRepository extends JpaRepository<Booking, Integer> {
}
