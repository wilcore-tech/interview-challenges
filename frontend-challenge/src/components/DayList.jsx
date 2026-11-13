import DayCard from "./DayCard.jsx";

export default function DayList({ days }) {
  if (days.length == 0) return null;

  return (
    <ul className="day-list">
      {days.map((day) => (
        <DayCard day={day} />
      ))}
    </ul>
  );
}
