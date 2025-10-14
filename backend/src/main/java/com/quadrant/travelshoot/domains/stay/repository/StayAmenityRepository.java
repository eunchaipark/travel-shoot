package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StayAmenityRepository extends JpaRepository<StayAmenity, Integer> {

    @Query("SELECT sa FROM StayAmenity sa JOIN FETCH sa.amenity WHERE sa.stay.id = :stayId")
    List<StayAmenity> findByStayId(Long stayId);
}
