package com.quadrant.travelshoot.domains.stay.mapper;

import com.quadrant.travelshoot.domains.common.dto.response.FileUploadResponse;
import com.quadrant.travelshoot.domains.common.entity.FileUpload;
import com.quadrant.travelshoot.domains.stay.dto.response.*;
import com.quadrant.travelshoot.domains.stay.entity.Amenity;
import com.quadrant.travelshoot.domains.stay.entity.Room;
import com.quadrant.travelshoot.domains.stay.entity.Stay;
import com.quadrant.travelshoot.domains.stay.entity.StayAmenity;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class StayMapper {

    public AmenityDto toAmenityDto(Amenity amenity) {
        return AmenityDto.builder()
                .amenityId(amenity.getAmenityId())
                .amenityName(amenity.getAmenityName())
                .build();
    }

    public RoomDto toRoomDto(Room room) {
        return RoomDto.builder()
                .roomId(room.getId())
                .roomCode(room.getRoomCode())
                .roomName(room.getRoomName())
                .roomCount(room.getRoomCount())
                .standardCapacity(room.getStandardCapacity())
                .maximumCapacity(room.getMaximumCapacity())
                .checkInTime(room.getCheckInTime())
                .checkOutTime(room.getCheckOutTime())
                .bedroomCount(room.getBedroomCount())
                .bathroomCount(room.getBathroomCount())
                .singleBedCount(room.getSingleBedCount())
                .doubleBedCount(room.getDoubleBedCount())
                .queenBedCount(room.getQueenBedCount())
                .kingBedCount(room.getKingBedCount())
                .weekdayPrice(room.getWeekdayPrice())
                .weekendPrice(room.getWeekendPrice())
                .minimumNights(room.getMinimumNights())
                .maximumNights(room.getMaximumNights())
                .roomDescription(room.getRoomDescription())
                .reservationNotice(room.getReservationNotice())
                .isAvailable(room.getIsAvailable())
                .isActive(room.getIsActive())
                .viewCount(room.getViewCount())
                .reservationCount(room.getReservationCount())
                .build();
    }

    public StayDetailResponse toStayDetailResponse(Stay stay, List<StayImageDto> images, List<StayAmenity> stayAmenities){

        if(stay==null){
            return null;
        }
        // DTO 변환 및 반환
        return StayDetailResponse.builder()
                .stayId(stay.getId())
                .stayName(stay.getName())
                .stayCode(stay.getStayCode())
                .stayType(stay.getStayType())
                .address(stay.getAddress())
                .addressDetail(stay.getAddressDetail())
                .latitude(stay.getLatitude())
                .longitude(stay.getLongitude())
                .description(stay.getDescription())
                .checkInTime(stay.getCheckInTime())
                .checkOutTime(stay.getCheckOutTime())
                .reservationNotice(stay.getReservationNotice())
                .averageRating(stay.getAverageRating())
                .reviewCount(stay.getReviewCount())
                .viewCount(stay.getViewCount() + 1)
                .isActive(stay.getIsActive())
                .regionId(stay.getRegionId())
                .minPrice(stay.getMinPrice())
                .stayImages(images)
                .amenities(stayAmenities.stream()
                           .map(a -> toAmenityDto(a.getAmenity())).toList())
                .rooms(stay.getRooms().stream()
                        .map(this::toRoomDto)
                        .toList())
                .build();
    }

}
