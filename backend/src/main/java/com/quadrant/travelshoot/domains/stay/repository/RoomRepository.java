package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.EntityGraph;

import java.util.Optional;

public interface RoomRepository extends JpaRepository<Room, Long> {

    // 예약에서 id 못가지고 와서 추가함
    @EntityGraph(attributePaths = {"stay"})
    Optional<Room> findById(Long roomId);
}
