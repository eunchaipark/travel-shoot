package com.quadrant.travelshoot.domains.stay.repository;

import com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface RoomRepository extends JpaRepository<Room, Long> {

    // 예약에서 id 못가지고 와서 추가함
    @EntityGraph(attributePaths = {"stay"})
    Optional<Room> findById(Long roomId);

    // 컬럼 2개만 가져오기 위함
    @Query("SELECT new com.quadrant.travelshoot.domains.stay.dto.response.RoomFilterDto(r.id, r.roomName) FROM Room r WHERE r.stay.id = :stayId")
    List<RoomFilterDto> findByStayId(Long stayId);
}
