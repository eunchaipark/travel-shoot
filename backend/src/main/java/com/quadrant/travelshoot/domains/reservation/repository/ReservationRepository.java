package com.quadrant.travelshoot.domains.reservation.repository;

import com.quadrant.travelshoot.domains.reservation.entity.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
}
