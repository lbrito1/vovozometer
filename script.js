var city  = "Recife";

var granny_index = 0;

var page_text = document.documentElement.innerHTML;
var granny_clickbaits = ["vovó que foi presa", "avó que foi presa", "vovó choca médicos", "avó choca médicos"];
var regular_clickbaits = ["choca " + city, "vira febre em " + city]
var clickbaits = []

for (var vovo in granny_clickbaits) {
  if (page_text.includes()) granny_index += 100;
}

console.log("This page's Granny Index is "+granny_index);
