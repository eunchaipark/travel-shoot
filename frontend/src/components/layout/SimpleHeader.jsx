import React, { useState, useRef, useEffect } from 'react';
import 'bootstrap/dist/css/bootstrap.min.css';

const SimpleHeader = () => {
    const [searchValue, setSearchValue] = useState('');
    const [showSuggestions, setShowSuggestions] = useState(false);

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

    const handleSearchFocus = () => {
        setShowSuggestions(true);
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
                                        onChange={(e) => setSearchValue(e.target.value)}
                                        onFocus={handleSearchFocus}
                                    />
                                </div>
                                {/* 드롭다운 suggestions */}
                                <div
                                    ref={suggestionsRef}
                                    className={`dropdown-suggestions ${showSuggestions ? '' : 'd-none'}`}
                                >
                                    <button className="suggestion-item">
                                        <i className="fas fa-building"></i>
                                        <div>
                                            <div className="fw-bold">SL 호텔 강릉</div>
                                            <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                        </div>
                                    </button>
                                    <button className="suggestion-item">
                                        <i className="fas fa-home"></i>
                                        <div>
                                            <div className="fw-bold">유담리솜펜션</div>
                                            <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                        </div>
                                    </button>
                                    <button className="suggestion-item">
                                        <i className="fas fa-building"></i>
                                        <div>
                                            <div className="fw-bold">강릉씨고호텔</div>
                                            <small className="text-muted">강릉특별자치도 강릉시 OO----</small>
                                        </div>
                                    </button>
                                </div>
                            </div>
                            <div className="col-md-3 d-flex justify-content-between col-3 px-0">
                                <button className="icon-button">
                                    <div className="search-icon"></div>
                                </button>
                                <div className="col-auto h-100 d-flex">
                                    <button className="icon-button">
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