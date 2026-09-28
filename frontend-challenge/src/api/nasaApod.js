// TODO: Implement the NASA APOD integration here.
//
// Docs: https://schlotterer.notion.site/APOD-Feed-And-API-User-Guide-39697d8747c38015a53edfdde76d4f5e (see the "APOD" section)
// Endpoint: https://science.nasa.gov/wp-json/wp/v2/apod-basic
// Use API key `DEMO_KEY` (or your own, if you hit DEMO_KEY's rate limit).
//
// Requirements:
//   - Fetch a 7-day range (the API accepts `date_from` / `date_to` query
//     params in legacy YYMMDD format).
//   - Some days' entries are videos, not images — filter to
//     `media_type === 'image'` only.
//   - Cache the response (localStorage/sessionStorage/in-memory) so
//     re-rendering or revisiting the app doesn't always re-fetch.
//   - Handle failures (bad network, rate limiting) without leaving the UI stuck.
//

export const _NASA_APOD_DOCS =
  "https://schlotterer.notion.site/APOD-Feed-And-API-User-Guide-39697d8747c38015a53edfdde76d4f5e";
const NASA_APOD_ENDPOINT = "";
const API_KEY = "DEMO_KEY";

export async function fetchApodRange(startDate, endDate) {
  throw new Error("fetchApodRange is not implemented yet");
}
