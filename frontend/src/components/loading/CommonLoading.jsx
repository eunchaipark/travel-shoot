const CommonLoading = ({ title = "처리 중...", description = "잠시만 기다려주세요." }) => {
    return (
        <div className="updating-overlay">
            <div className="updating-content">
                <div className="spinner-border mb-3" role="status" style={{ width: '3rem', height: '3rem' }}>
                    <span className="visually-hidden">Loading...</span>
                </div>
                <h4 className="updating-title mb-2">{title}</h4>
                <p className="updating-description text-muted">
                    {description}
                </p>
            </div>
        </div>
    );
};

export default CommonLoading;