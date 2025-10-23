import React, { useState, useRef, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/components/context/AuthContext';
import 'bootstrap/dist/css/bootstrap.min.css';

const SimpleHeader = () => {
    const navigate = useNavigate();
    const { isAuthenticated, openLoginModal } = useAuth();

    const [searchValue, setSearchValue] = useState('');
    const [showSuggestions, setShowSuggestions] = useState(false);
    const [suggestions, setSuggestions] = useState([]);

    const searchInputRef = useRef(null);
    const suggestionsRef = useRef(null);

    // 외부 클릭 감지
    useEffect(() => {
        const handleClickOutside = (event) => {
            if (searchInputRef.current && !searchInputRef.current.contains(event.target) &&
                suggestionsRef.current && !suggestionsRef.current.contains(event.target)) {
                setShowSuggestions(false);
            }
        };

        document.addEventListener('mousedown', handleClickOutside);
        return () => {
            document.removeEventListener('mousedown', handleClickOutside);
        };
    }, []);


    // 자동완성 API 호출
    const handleSearchChange = async (e) => {
        const value = e.target.value;
        setSearchValue(value);

        if (value.trim().length < 1) {
            setSuggestions([]);
            setShowSuggestions(false);
            return;
        }

        try {
            const response = await fetch(
                `http://localhost:8080/api/stays/autocomplete?keyword=${encodeURIComponent(value)}`
            );
            const data = await response.json();
            console.log('----------->>> 자동완성 결과:', data);
            setSuggestions(data || []);
            setShowSuggestions(true);
        } catch (error) {
            console.error('자동완성 에러:', error);
            setSuggestions([]);
        }
    };

    const handleSearchFocus = () => {
        if (suggestions.length > 0) {
            setShowSuggestions(true);
        }
    };

    const handleSearchClick = () => {
        if (suggestions.length > 0) {
            setShowSuggestions(true);
        }
    };

    // 자동완성 항목 선택 → /search로 이동
    const handleSuggestionClick = (suggestion) => {
        // 기본 날짜 설정 (내일 ~ 모레)
        const tomorrow = new Date();
        tomorrow.setDate(tomorrow.getDate() + 1);
        const checkIn = tomorrow.toISOString().split('T')[0];

        const dayAfter = new Date();
        dayAfter.setDate(dayAfter.getDate() + 3);
        const checkOut = dayAfter.toISOString().split('T')[0];

        const params = new URLSearchParams({
            checkIn: checkIn,
            checkOut: checkOut,
            adults: 2,
            children: 0
        });

        // 숙소 / 지역 선택 각각 다르게 전달해야함.
        if (suggestion.type === "STAY") {
            params.append("stayName", suggestion.keyword);
        } else {
            params.append("region", suggestion.keyword);
        }


        navigate(`/search?${params.toString()}`);
    };

    // 로그인/마이페이지 이동
    const handleUserIconClick = () => {
        if (isAuthenticated) {
            navigate('/mypage');
        } else {
            openLoginModal();
        }
    };

    return (
        <>
            {/* Font Awesome CSS */}
            <link
                href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
                rel="stylesheet"
            />

            {/* Version 2 헤더 (간단한 검색창) */}
            <header className="app-header">
                <div className="container">
                    <div className="row">
                        <div className="col-12 d-flex align-items-center justify-content-evenly">
                            <div className="col-sm-1 col-lg-1 col-2">
                                <a href="/">
                                    <div className="logo" role="img" aria-label="트래블샷 아이콘"></div>
                                </a>
                            </div>
                            <div className="col-sm-7 col-lg-8 col-6">
                                <div className="search-container position-relative">
                                    <input
                                        ref={searchInputRef}
                                        type="text"
                                        className="search-input w-100"
                                        placeholder="어디로 떠나볼까요?"
                                        value={searchValue}
                                        onChange={handleSearchChange}
                                        onFocus={handleSearchFocus}
                                        onClick={handleSearchClick}
                                    />

                                    {/* 드롭다운 suggestions */}
                                    <div
                                        ref={suggestionsRef}
                                        // className={`dropdown-suggestions ${showSuggestions && suggestions.length > 0 ? 'show' : ''}`}
                                        className={`dropdown-suggestions ${showSuggestions && suggestions.length > 0 ? '' : 'd-none'}`}
                                    >
                                        {suggestions.map((suggestion, index) => (
                                            <button
                                                key={index}
                                                className="suggestion-item"
                                                onClick={() => handleSuggestionClick(suggestion)}
                                            >
                                                <i className={suggestion.type === 'REGION' ? 'fas fa-map-marker-alt' : 'fas fa-building'}></i>
                                                <div>
                                                    <div className="fw-bold">{suggestion.keyword}</div>
                                                    {/*<small className="text-muted">{suggestion.type}</small>*/}

                                                </div>
                                            </button>
                                        ))}
                                    </div>
                                </div>
                            </div>
                            <div className="col-md-3 d-flex justify-content-between col-3 px-0">
                                <button className="icon-button">
                                    <div className="search-icon"></div>
                                </button>
                                <div className="col-auto h-100 d-flex">
                                    <button className="icon-button" onClick={handleUserIconClick}>
                                        <div className="user-white-icon"></div>
                                    </button>
                                    <button className="icon-button">
                                        <div className="heart-icon"></div>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </>
    );
};

export default SimpleHeader;