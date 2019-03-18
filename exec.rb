require 'byebug'
require './lib/page_scraper'

url = 'https://www1.folha.uol.com.br/ilustrissima/2019/03/agnes-varda-ou-uma-clarice-lispector-virada-pelo-avesso.shtml'
url = 'https://www.gazetaonline.com.br/noticias/policia/2019/03/detenta-foge-de-hospital-no-es-e-deixa-filho-recem-nascido-para-tras-1014172688.html'
url = 'https://www.correiobraziliense.com.br/app/noticia/cidades/2019/03/18/interna_cidadesdf,743729/direcao-pede-transferencia-de-alunos-envolvidos-em-ameaca-de-ataque.shtml'

scraper = PageScraper.new(url: url)
scraper.call

puts "Report for #{url}:"
puts "Regular clickbaits: #{scraper.score_regular}"
puts "Granny clickbaits: #{scraper.score_granny}"
puts "Time to first granny (TTFG): #{scraper.time_to_first_granny}"
