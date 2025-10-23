import { useState } from "react";

const Header = () => {
    const changeGuest = () => {
      return null;
    }
    const [searchParam,setSearchParam] = useState('SL 호텔 강릉');
    return(
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
                  <div className="row g-0 align-items-center">
                    <div className="col-12 col-xxl-5 d-flex align-items-center">
                      <div
                        className="col-2 position-relative search-input-icon location-icon"
                        role="img"
                      ></div>
                      <input
                        type="text"
                        className="search-input position-relative flex-grow-1 ms-1"
                        placeholder="SL 호텔 강릉"
                        value={searchParam}
                        onChange={e=>setSearchParam(e.target.value)}
                      />
                      <div className="dropdown-suggestions d-none">
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
                            <small className="text-muted"
                            >강릉특별자치도 강릉시 OO----</small
                            >
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
                    <div className="col-auto search-divider-con">
                      <div className="search-divider mx-3"></div>
                    </div>
                    <div className="col-lg-auto col-md-12 d-flex align-items-center">
                      <div
                        className="col-2 position-relative search-input-icon calendar-icon"
                        role="img"
                      ></div>

                      <span
                        className="ms-2 text-muted position-relative text-nowrap fw-medium"
                        id="dateDisplay"
                        style={{ cursor: 'pointer' }}>09.08(월) ~ 09.10(수)</span>
                    </div>
                    <div className="col-auto search-divider-con">
                      <div className="search-divider mx-3"></div>
                    </div>
                    <div className="col-lg-auto col-md-12 d-flex align-items-center">
                      <div
                        className="col-2 position-relative search-input-icon user-icon"
                        role="img"
                      ></div>
                      <span
                        className="ms-2 text-muted position-relative text-nowrap fw-medium"
                        id="guestDisplay"
                        style={{ cursor: 'pointer' }}>성인 2명</span>
                      <div className="guest-dropdown" id="guestDropdown">
                        <div className="guest-type">
                          <div className="guest-info">
                            <h6>성인</h6>
                            <small>18세 이상</small>
                          </div>
                          <div className="counter-controls">
                            <button
                              className="counter-btn"
                              onClick={changeGuest('adult', -1)}
                            >
                              -
                            </button>
                            <span id="adultCount">2</span>
                            <button
                              className="counter-btn"
                              onClick={changeGuest('adult', 1)}
                            >
                              +
                            </button>
                          </div>
                        </div>
                        <div className="guest-type">
                          <div className="guest-info">
                            <h6>어린이</h6>
                            <small>0 - 17세</small>
                          </div>
                          <div className="counter-controls">
                            <button
                              className="counter-btn"
                              onClick={changeGuest('child', -1)}
                            >
                              -
                            </button>
                            <span id="childCount">0</span>
                            <button
                              className="counter-btn"
                              onClick={changeGuest('child', 1)}
                            >
                              +
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="col-md-3 col-3 px-0">
                <button className="icon-button">
                  <div className="search-icon"></div>
                </button>
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
      </header>
    )
}

export default Header;