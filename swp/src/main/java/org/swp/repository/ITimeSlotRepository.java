package org.swp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.swp.entity.TimeSlot;
import org.swp.entity.User;

import java.util.Optional;

@Repository
public interface ITimeSlotRepository extends JpaRepository<TimeSlot, Long> {

}