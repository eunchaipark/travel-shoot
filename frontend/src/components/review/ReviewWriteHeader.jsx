
const ReviewWriteHeader = () => {

    const handleBack = () => {
        window.history.back();
    };

    const handleHome = () => {
        window.location.href = '/';
    };

    return (
        <header className="page-header">
            <div className="header-container">
                <button className="back-button" type="button" onClick={handleBack}>
                    <i className="fas fa-chevron-left"></i>
                </button>
                <div className="page-title">후기 작성</div>
                <button className="home-button" type="button" onClick={handleHome}>
                    <i className="fas fa-home"></i>
                </button>
            </div>
        </header>
    )
}

export default ReviewWriteHeader;