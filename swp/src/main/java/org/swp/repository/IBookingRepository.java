package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.swp.entity.Booking;

public interface IBookingRepository extends JpaRepository<Booking, Long> {
}
