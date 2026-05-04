import { useSearchParams, useNavigate } from 'react-router-dom';
import { useCallback, useMemo } from 'react';
import { useDefaultStayParams } from '@/hooks/search/useDefaultStayParams';

const useSearchParamsSync = () => {
    const [searchParams, setSearchParams] = useSearchParams();
    const navigate = useNavigate();
    const { getDefaultDates, getDefaultGuests } = useDefaultStayParams();

    //URL에서 파라미터 읽기
    const params = useMemo(() => {
        const checkIn = searchParams.get('checkIn');
        const checkOut = searchParams.get('checkOut');
        const adults = parseInt(searchParams.get('adults')) || 2;
        const children = parseInt(searchParams.get('children')) || 0;
        const region = searchParams.get('region');
        const stayName = searchParams.get('stayName');

        // 예약 페이지용 파라미터
        const checkInDate = searchParams.get('checkInDate') || checkIn;
        const checkOutDate = searchParams.get('checkOutDate') || checkOut;
        const guestCount = parseInt(searchParams.get('guestCount')) || (adults + children);

        return {
            // 상세 페이지
            checkIn,
            checkOut,
            adults,
            children,
            region,
            stayName,

            // 예약 페이지
            checkInDate,
            checkOutDate,
            guestCount
        };
    }, [searchParams]);

    // URL에 파라미터 쓰기
    const updateParams = useCallback((newParams, replace = false) => {
        const current = new URLSearchParams(window.location.search);

        Object.entries(newParams).forEach(([key, value]) => {
            if (value !== null && value !== undefined && value !== '') {
                current.set(key, value);
            } else {
                current.delete(key);
            }
        });

        setSearchParams(current, { replace });
        console.log('파라미터 업데이트:', Object.fromEntries(current));
    }, [setSearchParams]);

    //기본 파라미터 설정
    const setDefaultParams = useCallback((path) => {
        const { checkIn, checkOut } = getDefaultDates({ nights: 2, startFromTomorrow: true });
        const { adults, children } = getDefaultGuests();
        const defaultParams = { checkIn, checkOut, adults, children };

        const hasCheckIn = searchParams.get('checkIn');
        const hasCheckOut = searchParams.get('checkOut');
        if (!hasCheckIn || !hasCheckOut) {
            if (path) {
                const queryString = new URLSearchParams(defaultParams).toString();
                navigate(`${path}?${queryString}`);
            } else {
                updateParams(defaultParams);
            }
        }

        console.log('기본 파라미터 설정:', defaultParams);
    }, [navigate, updateParams, getDefaultDates, getDefaultGuests, searchParams]);

    // 개별 setter 함수들
    const setCheckIn = useCallback((checkIn) => {
        updateParams({ checkIn });
    }, [updateParams]);

    const setCheckOut = useCallback((checkOut) => {
        updateParams({ checkOut });
    }, [updateParams]);

    const setAdults = useCallback((adults) => {
        updateParams({ adults });
    }, [updateParams]);

    const setChildren = useCallback((children) => {
        updateParams({ children });
    }, [updateParams]);

    const setRegion = useCallback((region) => {
        updateParams({ region });
    }, [updateParams]);

    const setStayName = useCallback((stayName) => {
        updateParams({ stayName });
    }, [updateParams]);

    //유틸리티 함수

    /**
     * 총 인원수 계산
     */
    const getTotalGuests = useCallback(() => {
        return params.adults + params.children;
    }, [params.adults, params.children]);

    /**
     * 예약 페이지용 URL 생성 (파라미터 이름 변환)
     * @param {number} roomId - 객실 ID
     * @returns {string} - 예약 페이지 URL
     */
    const getReservationUrl = useCallback((roomId) => {
        if (!params.checkIn || !params.checkOut) {
            console.warn('날짜 파라미터 없음');
            return null;
        }

        const reservationParams = new URLSearchParams({
            roomId: roomId,
            checkInDate: params.checkIn,      // checkIn → checkInDate
            checkOutDate: params.checkOut,    // checkOut → checkOutDate
            guestCount: getTotalGuests()      // adults + children → guestCount
        });

        return `/reservation/payment?${reservationParams.toString()}`;
    }, [params.checkIn, params.checkOut, getTotalGuests]);

    /**
     * 예약 페이지로 이동
     * @param {number} roomId - 객실 ID
     */
    const navigateToReservation = useCallback((roomId) => {
        const url = getReservationUrl(roomId);
        if (url) {
            navigate(url);
            console.log('예약 페이지 이동:', url);
        } else {
            alert('날짜를 선택해주세요.');
        }
    }, [getReservationUrl, navigate]);

    /**
     * 모든 검색 파라미터 초기화
     */
    const resetParams = useCallback(() => {
        setSearchParams(new URLSearchParams(), { replace: true });
        console.log('♻검색 파라미터 초기화');
    }, [setSearchParams]);

    return {
        //  현재 파라미터
        params,
        checkIn: params.checkIn,
        checkOut: params.checkOut,
        adults: params.adults,
        children: params.children,
        region: params.region,
        stayName: params.stayName,

        // 예약 페이지용 (호환)
        checkInDate: params.checkInDate,
        checkOutDate: params.checkOutDate,
        guestCount: params.guestCount,

        // 업데이트 함수
        updateParams,
        setCheckIn,
        setCheckOut,
        setAdults,
        setChildren,
        setRegion,
        setStayName,
        setDefaultParams,
        resetParams,

        //유틸리티 함수
        getTotalGuests,
        getReservationUrl,
        navigateToReservation,
        hasParams: !!(params.checkIn && params.checkOut)
    };
};

export default useSearchParamsSync;