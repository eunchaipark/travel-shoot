
/**
* 가격 포맷 함수
* 3자리마다 콤마 찍어줌
*/

export const formatNumber = (v) => new Intl.NumberFormat('en-US').format(Number(v));