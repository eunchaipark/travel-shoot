import React from "react";
import 'bootstrap/dist/css/bootstrap.min.css';

const CompleteHeader = () => {
    return (
        <>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>

            {/*  Version 2 헤더 (간단한 검색창) */}
            <header className="app-header">
                <div className="container">
                    <div className="row">
                        <div className="col-12 d-flex align-items-center justify-content-evenly">
                            <div className="col-sm-1 col-lg-1 col-2">
                                <div className="logo" role="img" aria-label="트래블샷 아이콘"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </>
    );
};
export default CompleteHeader;