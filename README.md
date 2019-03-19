[!alt Clickbait report chart](plot_with_gnuplot)

# Vovozometer

> Vovó de 90 anos humilha dermatologistas com creme anti-rugas e quase é presa em Recife!

Measures clickbait statistics on a given URL.

## Usage

`ruby exec.rb` runs a Reporter on the predefined URL set (see `exec.rb` for the complete list).

The Reporter outputs a CSV file in `/lib/output/` containing the following:

* **url**: url scraped
* **hits**: number of reloads (important because clickbaits are random)
* **score_granny**: number of granny-related clickbaits found
* **score_regular**: number of common clickbaits found
* **ttfg**: *time to first granny*: number of reloads until a granny-related clickbait appears

## Clickbait classification

A simple match (`String#include?`) is done against a list of terms defined in `input/terms.yml`.

## Plotting

Done with gnuplot. Check `plot_with_gnuplot`.

## Why?

There are *way* too many granny-related clickbaits out there. Someone needs to take action!!!1111
