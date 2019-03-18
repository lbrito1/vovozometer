var city  = "Recife";
var page_url = location.href;

function calculateGrannyStats(pageContents) {
  var granny_index = 0;

  var page_text = document.documentElement.innerHTML;
  var granny_clickbaits = ["vovó que foi presa", "avó que foi presa", "vovó choca médicos", "avó choca médicos"];
  var regular_clickbaits = ["choca " + city, "vira febre em " + city];
  var clickbaits = [];

  for (var vovo in granny_clickbaits) {
    if (page_text.includes(vovo)) {
      granny_index += 100;
      found_granny = true;
    }
  }
  for (var regular in regular_clickbaits) {
    if (page_text.includes(regular)) granny_index += 10;
  }

  return { "granny_index": granny_index, "found_granny": found_granny };
};

function fetchAndCalculateGrannyIndex(url, grannyStats, iterations, buildGrannyReportCallback) {
  fetch(url)
    .then(response => response.text())
      .then((body) => {
        grannyStats.push(calculateGrannyStats(body));
        debugger;
        if (iterations > 0) {
          fetchAndCalculateGrannyIndex(url, grannyStats, iterations - 1, buildGrannyReportCallback)
        }
        else {
          buildGrannyReportCallback(grannyStats);
        }
      });
}

function buildGrannyReportCallback(grannyStats) {
  debugger;
}

iterations = 3;
fetchAndCalculateGrannyIndex(page_url, [], iterations, buildGrannyReportCallback);

