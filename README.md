# Exercícios de Tratamentos de Dissonância

Aplicação web para estudar e praticar os **tratamentos de dissonância no
contraponto por espécies** (2ª a 5ª espécies): nota de passagem, bordadura,
cambiata, bordadura dupla, suspensão, retardo e outros. As questões são
geradas automaticamente, em tonalidades sorteadas, e combinam percepção
auditiva, análise e escrita.

### ▶ [Abrir os exercícios no navegador](https://rogerioconstante.github.io/tratamentos-de-dissonancia/) · 📖 [Manual do usuário](https://rogerioconstante.github.io/tratamentos-de-dissonancia/manual.html)

Funciona em qualquer navegador moderno, sem instalação.

## Modos

- **📖 Estudo:** escolha a espécie, o tratamento e o tipo de questão. Uma
  questão por vez, sem limite de tempo.
- **🏋️ Treino:** sessão configurável com várias questões; ao final, gera um
  **relatório em PDF** com o desempenho por tipo de questão.
- **🏆 Desafio:** 12 fases progressivas, da 2ª à 5ª espécie e da análise à
  escrita, com tempo, vidas e pontuação; o progresso pode ser salvo e
  retomado.

## Tipos de questão

- **🔊 Auditiva:** ouça o contraponto e identifique o tratamento.
- **👁️ Análise:** observe a partitura e identifique o tratamento.
- **✏️ Escrita:** componha um contraponto sobre o cantus firmus usando o
  tratamento pedido; o programa valida consonâncias, preparação e resolução
  das dissonâncias, direção melódica, cruzamentos etc.

## Tratamentos por espécie

| Espécie | Tratamentos |
|---|---|
| 2ª | nota de passagem, bordadura inferior e superior, sem dissonâncias |
| 3ª | nota de passagem, bordadura, cambiata, bordadura dupla, grupo de notas de passagem, nota de passagem acentuada, bordadura acentuada |
| 4ª | suspensão, retardo, nota de passagem, bordadura superior e inferior |
| 5ª | combinações dos anteriores, com modelos rítmicos variados |

Detalhes, atalhos de teclado e o funcionamento de cada modo estão no
[manual](manual.html).

## Usar no próprio computador (sem internet)

1. Baixe o repositório: **Code ▸ Download ZIP** e descompacte.
2. Abra o `index.html` no navegador. Os exercícios funcionam, mas o **piano
   real e as cordas** só tocam se a página for servida por HTTP (sem isso, o
   programa usa um sintetizador).
3. Para ter os instrumentos, rode um servidor local na pasta:
   - **Linux/macOS:** `./iniciar-servidor.sh` (abre o navegador sozinho;
     `./parar-servidor.sh` encerra);
   - **qualquer sistema com Python 3:** `python3 -m http.server 8000` e abra
     <http://localhost:8000/>.

## Créditos e licenças

Código: © Rogério Tavares Constante, licença [GPL-3.0](LICENSE).
Bibliotecas e amostras de áudio de terceiros: ver [CREDITOS.md](CREDITOS.md).

## Veja também

- [Stretto Fuga — Calculadora de Intervalos](https://rogerioconstante.github.io/stretto-fuga/)
- Plugins de contraponto para MuseScore:
  [Analisador de Contrapontos](https://github.com/rogerioConstante/analisador-de-contrapontos),
  [Intervalos](https://github.com/rogerioConstante/intervalos-contraponto),
  [Classe de Intervalos](https://github.com/rogerioConstante/classe-de-intervalos-contraponto)
  e [Bathe's Table](https://github.com/rogerioConstante/bathe-table-plugin).

## Autor

Prof. Rogério Tavares Constante (UFRJ). Desenvolvido no âmbito do projeto
*Harmonia e Contraponto*.

Sugestões e relatos de problemas são bem-vindos na aba **Issues**.
