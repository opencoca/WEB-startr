// Site-wide constants available to every template as `site.*`.
// Kept tiny and dependency-free — just the values templates need for
// canonical URLs and social-share meta.
module.exports = {
  // Canonical origin, no trailing slash. Used to build absolute og:url /
  // og:image URLs (social scrapers require absolute, not relative, URLs).
  url: "https://startr.ca",

  // Default Open Graph / Twitter share image (absolute path from site root).
  // Pages can override with `ogImage` in front matter.
  defaultOgImage: "/assets/images/og-default.jpg",

  // Twitter handle for attribution on cards (leave "" if none).
  twitter: "",
};
