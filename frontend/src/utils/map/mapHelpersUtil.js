/**
 * 카카오맵으로 위치 열기
 * @param {string} title - 장소 이름
 * @param {number} latitude - 위도
 * @param {number} longitude - 경도
 */
export const openKakaoMap = (title, latitude, longitude) => {
    if (!latitude || !longitude) {
        console.warn('위치 정보가 없습니다:', { title, latitude, longitude });
        return;
    }

    const url = `https://map.kakao.com/link/map/${encodeURIComponent(title)},${latitude},${longitude}`;
    window.open(url, '_blank');
};