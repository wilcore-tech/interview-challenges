// Placeholder data so the UI has something to render before the real NASA
// APOD integration is wired up. Shaped like the actual API response
// (https://api.nasa.gov/planetary/apod) so swapping this out for a live
// fetch should mean no changes to the components that consume it.

function isoDateDaysAgo(daysAgo) {
  const d = new Date();
  d.setDate(d.getDate() - daysAgo);
  return d.toISOString().slice(0, 10);
}

const TITLES = [
  "A Sombrero Galaxy Close Up",
  "The Pillars of Creation",
  "Aurora Over a Norwegian Fjord",
  "Jupiter in Infrared",
  "A Total Solar Eclipse",
  "Star Trails Above a Desert Observatory",
  "The Rings of Saturn in Natural Color",
  "MS 39: The Orion Belt Galaxy",
];

export const mockApodEntries = TITLES.map((title, index) => ({
  date: isoDateDaysAgo(TITLES.length - 1 - index),
  title,
  explanation:
    "Placeholder explanation text. Replace this data source with a real call to the NASA APOD API.",
  media_type: "image",
  url: `https://picsum.photos/seed/apod-${index}/800/800`,
  hdurl: `https://picsum.photos/seed/apod-${index}/1600/1600`,
}));
