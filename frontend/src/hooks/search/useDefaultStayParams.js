export const useDefaultStayParams = () => {
    const getDefaultDates = (options = { nights: 2, startFromTomorrow: true }) => {
        const { nights, startFromTomorrow } = options;

        const today = new Date();
        if (startFromTomorrow) today.setDate(today.getDate() + 1);
        const checkIn = today.toISOString().split('T')[0];

        const checkOutDate = new Date(today);
        checkOutDate.setDate(checkOutDate.getDate() + nights);
        const checkOut = checkOutDate.toISOString().split('T')[0];

        return { checkIn, checkOut };
    };

    const getDefaultGuests = () => ({ adults: 2, children: 0 });

    return { getDefaultDates, getDefaultGuests };
};
