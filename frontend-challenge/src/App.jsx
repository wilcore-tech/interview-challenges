import { useState } from "react";
import { _NASA_APOD_DOCS } from "./api/nasaApod.js";
import SearchButton from "./components/SearchButton.jsx";
import { mockApodEntries } from "./data/mockApod.js";
import DayList from "./components/DayList.jsx";
import "./App.css";

function App() {
  const [selectedDate, setSelectedDate] = useState(() =>
    new Date().toISOString().slice(0, 10),
  );

  const [days] = useState(mockApodEntries);

  function handleLoad() {
    // TODO: wire this up to `fetchApodRange` in src/api/nasaApod.js once
    // it's implemented
    console.log("TODO: fetch the 7-day APOD range ending", selectedDate);
  }

  return (
    <div className="app">
      <h2 className="app__title">NASA Astronomy Picture of the Day</h2>
      <h1 className="app__subtitle">Explore a week of celestial wonders.</h1>

      <form className="date-form" onSubmit={(e) => e.preventDefault()}>
        <label htmlFor="startdate">Start date</label>
        <input
          id="start-date"
          type="date"
          value={selectedDate}
          onChange={(e) => setSelectedDate(e.target.value)}
        />
        <SearchButton onClick={handleLoad}>Load week</SearchButton>
      </form>

      <DayList days={days} />

      <footer className="app_footer">
        <a href={_NASA_APOD_DOCS}>NASA APOD API Documentation</a>
      </footer>
    </div>
  );
}

export default App;
