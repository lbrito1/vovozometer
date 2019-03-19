require './lib/interactors/reporter'

urls = [
  'https://www.correiobraziliense.com.br/app/noticia/cidades/2019/03/18/interna_cidadesdf,743729/direcao-pede-transferencia-de-alunos-envolvidos-em-ameaca-de-ataque.shtml',
  'https://www.gazetaonline.com.br/noticias/policia/2019/03/detenta-foge-de-hospital-no-es-e-deixa-filho-recem-nascido-para-tras-1014172688.html',
  'https://www1.folha.uol.com.br/mundo/2019/03/bolsonaro-emite-sinal-de-desprestigio-ao-visitar-cia-antes-de-abin.shtml']

reporter = Reporter.new(urls: urls)
reporter.call
