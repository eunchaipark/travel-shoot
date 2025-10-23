package com.quadrant.travelshoot.domains.stay.service;

import com.quadrant.travelshoot.domains.stay.entity.Region;

public interface RegionService {
    Region findByAddress(String address);
}