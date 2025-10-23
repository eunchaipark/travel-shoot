import React from 'react';

const Footer = () => {
    return (
        <footer className="app-footer position-relative">
            <div className="container">
                {/* 저작권 섹션 */}
                <div className="copyright-section">
                    © 2025 사분면. All rights reserved.
                </div>

                {/* 상세 정보 섹션 */}
                <div className="footer-content" id="footerContent">
                    <div className="row align-items-center">
                        {/* 회사 정보 */}
                        <div className="col-lg-5 col-md-6">
                            <div className="company-info">
                                <div className="d-flex">
                                    <div className="logo"></div>
                                    <div className="subtitle">팀 사분면</div>
                                </div>
                                <div className="address">
                                    서울특별시 종로구 창경궁로 254번길 동원빌딩<br />
                                    대표: 서정희 | 팀원: 김이슬, 박은채, 이은비, 차윤하
                                </div>
                            </div>
                        </div>

                        {/* 구분선 */}
                        <div className="col-lg-2 d-none d-lg-block">
                            <div className="vertical-divider"></div>
                        </div>

                        {/* 연락처 정보 */}
                        <div className="col-lg-5 col-md-6">
                            <div className="contact-info">
                                <div className="d-flex">
                                    <div className="call"></div>
                                    <div className="subtitle">연락처</div>
                                </div>
                                <a href="mailto:contact@travel-shoot.com" className="email">
                                    contact@travel-shoot.com
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    );
};

export default Footer;