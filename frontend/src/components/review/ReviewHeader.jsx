/** 
 * 경로: frontend/src/components/review/ReviewHeader.jsx
 */

const ReviewHeader = () => {

    const handleBack = () => {
        window.history.back();
    };

    const handleHome = () => {
        window.location.href = '/';
    };

    return(
        <header className="navigation-header">
            <div className="header-content-wrapper">
                <button className="navigation-back-button" type="button" onClick={handleBack}>
                    <i className="fas fa-chevron-left"></i>
                </button>
                <div className="page-title-text">이용 후기</div>
                <button className="navigation-home-button" type="button" onClick={handleHome}>
                    <i className="fas fa-home"></i>
                </button>
            </div>
        </header>
    )
};

export default ReviewHeader;