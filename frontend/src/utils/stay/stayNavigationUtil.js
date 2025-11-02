export const navigateToStayDetail = ({
                                         stayId,
                                         stayName = "",
                                         navigate,
                                         setDefaultParams,
                                         getDefaultDates,
                                         getDefaultGuests,
                                         options = {}
                                     }) => {
    if (!stayId) {
        alert('숙소 정보를 찾을 수 없습니다.');
        return;
    }

    const { nights = 2, startFromTomorrow = true } = options;

    setDefaultParams();

    const { checkIn, checkOut } = getDefaultDates({ nights, startFromTomorrow });
    const { adults, children } = getDefaultGuests();

    navigate(`/stays/${stayId}?checkIn=${checkIn}&checkOut=${checkOut}&adults=${adults}&children=${children}&stayName=${encodeURIComponent(stayName)}`);
};