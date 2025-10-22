package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface RoomRepository extends JpaRepository<Room, Long> {

    // stay 엔티티에서... 못가지고 와서 추가함
    @Query("SELECT r FROM Room r LEFT JOIN FETCH r.stay WHERE r.id = :roomId")
    Optional<Room> findById(@Param("roomId") Long roomId);

    // 컬럼 2개만 가져오기 위함
    @Query("SELECT new com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto(r.id, r.roomName) FROM Room r WHERE r.stay.id = :stayId")
    List<RoomFilterDto> findByStayId(Long stayId);
}
