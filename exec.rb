require 'byebug'
require './lib/interactors/reporter'

urls = [
  'http://www.diariodepernambuco.com.br/app/noticia/vida-urbana/2019/03/19/interna_vidaurbana,780973/diplomacia-americana-pede-para-que-turistas-nao-visitem-a-praia-do-pin.shtml?fbclid=IwAR1nwGJLlVACZ_7ieFlN6B7wzPzfSvQl4SzyVirih4QGC_3L-25uuwFDl-E',
  'https://www.folhape.com.br/economia/economia/economia/2019/03/15/NWS,98999,10,550,ECONOMIA,2373-ESPANHOLA-AENA-VENCE-LEILAO-BLOCO-POR-LEVA-AEROPORTO-RECIFE.aspx',
  'https://www.correiobraziliense.com.br/app/noticia/cidades/2019/03/18/interna_cidadesdf,743729/direcao-pede-transferencia-de-alunos-envolvidos-em-ameaca-de-ataque.shtml',
  'https://www.gazetaonline.com.br/noticias/policia/2019/03/detenta-foge-de-hospital-no-es-e-deixa-filho-recem-nascido-para-tras-1014172688.html',
  'https://www1.folha.uol.com.br/mundo/2019/03/bolsonaro-emite-sinal-de-desprestigio-ao-visitar-cia-antes-de-abin.shtml',
  'https://gauchazh.clicrbs.com.br/politica/noticia/2019/03/bolsonaro-diz-que-maioria-de-imigrantes-nao-tem-boas-intencoes-e-que-apoia-muro-de-trump-cjtfczodn008z01nwgkqt6uop.html',
  'https://www.em.com.br/app/noticia/gerais/2019/03/19/interna_gerais,1039042/especulacao-imobiliaria-pressiona-limites-entre-bh-e-nova-lima.shtml',
  'https://www.opovo.com.br/jornal/reportagem/2019/03/18/a-chuva-floresce--um-gosto-de-sertao.html',
  'https://www.correio24horas.com.br/noticia/nid/moradores-montam-central-de-vigilancia-com-30-cameras-para-evitar-crimes/',
  'http://m.diarioonline.com.br/noticias/para/noticia-583297-Onibus-invade-calcada-e-colide-com-muro-do-santuario-de-fatima-em-belem.html?v=643',
  'https://odia.ig.com.br/rio-de-janeiro/2019/03/5627751-fraude-ou-incompetencia-no-sistema-de-saude-do-rio-de-janeiro.html'
]

reporter = Reporter.new(urls: urls)
reporter.call
