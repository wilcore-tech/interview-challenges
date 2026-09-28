// Note the heart icon SVGs are in the /public folder
// They can be imported as follows:
// import HeartIcon from "../public/heart-outlined.svg?react";
// import HeartIconFilled from "../public/heart-filled.svg?react";

export default function DayCard(props) {
  return (
    <li className="day-card">
      <img className="day-card__image" src={props.day.url2} alt="" />
      <div className="day-card__body">
        <h4 className="day-card__title">{props.day.title}</h4>
        <p className="day-card__date">{props.day.date}</p>
      </div>
    </li>
  );
}
