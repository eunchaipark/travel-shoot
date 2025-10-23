import React from "react";


const ReviewFilter = ({ selected, onSelect }) => {
  const options = ["전체", "사진 후기만", "높은 평점순", "낮은 평점순"];

  return (
    <div className="review-filter">
      {options.map(opt => (
        <button
          key={opt}
          className={selected === opt ? "active" : ""}
          onClick={() => onSelect(opt)}
        >
          {opt}
        </button>
      ))}
    </div>
  );
}

export default ReviewFilter;
