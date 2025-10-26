
export const fetchCalendarCourses = async (userId) => {
  try {
    const response = await fetch(
      `${window.API_BASE_URL}/api/reservations/calendar-courses/${userId}`,
      {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      }
    );

    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }

    const data = await response.json();
    //console.log("백엔드 원본 데이터:", data);

    const transformed = transformCalendarData(data);
    //console.log("변환된 데이터:", transformed);

    return transformed;
  } catch (error) {
    //console.error("캘린더 코스 조회 실패:", error);
    throw error;
  }
};

const transformCalendarData = (backendData) => {
  return backendData.map((course) => ({
    id: course.id,
    title: course.title,
    startDate: course.startDate,
    endDate: course.endDate,
    accommodationName: course.accommodationName,
    status: mapReservationStatus(course.status),
    schedules: course.schedules.map((schedule) => ({
      time: schedule.time,
      title: schedule.title,
      type: schedule.type, // activity, restaurant 그대로 사용
      date: schedule.date,
    })),
  }));
};

const mapReservationStatus = (status) => {
  const statusMap = {
    예약확정: "confirmed",
    이용완료: "completed",
    예약취소: "cancelled",
  };
  return statusMap[status] || "confirmed";
};
