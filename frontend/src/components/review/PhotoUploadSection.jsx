import { useState } from "react";

/**
 * 사진 업로드 섹션 컴포넌트
 * @param {object} props
 * @param {File | null} props.uploadedFile - 업로드된 파일 상태
 * @param {File | null} props.existedImageUrl - 이미 등록된 파일 url
 * @param {function} props.onFileChange - 파일 변경 핸들러
 * @param {function} props.onFileRemove - 파일 제거 핸들러
 */
const PhotoUploadSection = ({ uploadedFile, existedImageUrl, onFileChange, onFileRemove, photoInputRef, errorMsg }) => {

    const [isDragOver, setIsDragOver] = useState(false);

    // 업로드 이미지 미리보기 URL
    const fileUrl = uploadedFile ? URL.createObjectURL(uploadedFile) : existedImageUrl;
    const hasImage = uploadedFile || existedImageUrl;
    const isNewUpload = !!uploadedFile;

    const handleBrowseClick = () => {
        photoInputRef.current?.click();
    };

    const handleFileSelect = (e) => {
        const file = e.target.files[0];
        if (file) {
            handleFile(file);
        }
    };

    const handleFile = (file) => {
        
        onFileChange(file);
    };

    const handleDrop = (e) => {
        e.preventDefault();
        setIsDragOver(false);
        
        const files = e.dataTransfer.files;
        if (files.length > 0) {
            const file = files[0];
            if (file.type.startsWith('image/')) {
                handleFile(file);
            } else {
                alert('이미지 파일만 업로드 가능합니다.');
            }
        }
    };

    return (
        <section className="photo-upload-section">
            <h3 className="section-title">사진 업로드 *</h3>

            {/* 성공 메시지 */}
            {hasImage && isNewUpload && 
                <div className="upload-success-message">
                    <i className="fas fa-check-circle"></i>
                    {uploadedFile ? '사진이 업로드되었습니다.' : ''}
                </div>
            }

            {errorMsg && (
                <div className="error-message">
                    {errorMsg}
                </div>
            )}

            <input 
                type="file" 
                id="photo-input" 
                className="photo-input" 
                accept="image/*"
                ref={photoInputRef}
                onChange={handleFileSelect}
            />
            
            <div 
                className={`upload-area ${isDragOver ? 'drag-over' : ''}`} 
                id="upload-area"
                onClick={!hasImage  ? handleBrowseClick : undefined}
                onDragOver={(e) => { e.preventDefault(); setIsDragOver(true); }}
                onDragLeave={() => setIsDragOver(false)}
                onDrop={handleDrop}
                style={{ display: hasImage  ? 'none' : 'flex' }}
            >
                <div className="upload-content">
                    <i className="fas fa-cloud-upload-alt upload-icon"></i>
                    <div className="upload-text">사진을 여기에 드래그하거나</div>
                    <div className="upload-subtext">JPG, PNG 파일</div>
                    <button type="button" className="upload-browse-button" id="browse-button">
                        <i className="fas fa-folder-open"></i>파일 선택
                    </button>
                    <div className="upload-hint">또는 클릭하여 파일을 선택하세요</div>
                </div>
            </div>

            <div 
                className="photo-preview" 
                id="photo-preview" 
                style={{ display: hasImage  ? 'flex' : 'none' }}
            >
                {hasImage && (
                    <>
                        <div className="preview-image-wrapper">
                            <img className="preview-image" id="preview-image" alt="미리보기" src={fileUrl} />
                            <button type="button" className="remove-photo-button" id="remove-photo"
                            onClick={onFileRemove}>
                                <i className="fas fa-times"></i>
                            </button>
                        </div>

                         {/* 사진 변경 버튼 */}
                        <button 
                            type="button" 
                            className="change-photo-button"
                            onClick={handleBrowseClick}
                        >
                            <i className="fas fa-sync-alt"></i>
                             {` 다른 사진으로 변경`}
                        </button>
                    </>
                )}
            </div>
        </section>
    );
};

export default PhotoUploadSection;