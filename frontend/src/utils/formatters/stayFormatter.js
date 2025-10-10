const STAY_TYPE_MAP = {
    '호텔': 'hotel',
    '모텔': 'motel',
    '펜션': 'pension',
};

export const getStayType = (koreanType) => {
    return STAY_TYPE_MAP[koreanType] || 'default';
};
