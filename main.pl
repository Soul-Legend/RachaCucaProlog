% Definição dos atributos possíveis
camiseta(amarelo).
camiseta(verde).
camiseta(branco).
camiseta(vermelho).
camiseta(azul).

nome(caio).
nome(bernardo).
nome(icaro).
nome(wagner).
nome(marcelo).

investimento(lca).
investimento(lci).
investimento(acoes).
investimento(cdb).
investimento(tesouro).

valor(5000).
valor(10000).
valor(15000).
valor(20000).
valor(25000).

prazo(2).
prazo(3).
prazo(4).
prazo(6).
prazo(5).

profissao(bancario).
profissao(programador).
profissao(joalheiro).
profissao(ator).
profissao(engenheiro).

% Funções auxiliares para verificar posições e relações na lista
todos_diferentes([]).
todos_diferentes([H|T]) :- not(member(H, T)), todos_diferentes(T).

aoLado(X, Y, Lista) :- nextto(X, Y, Lista); nextto(Y, X, Lista).
aDireita(X, Y, Lista) :- nth0(IndexX, Lista, X), nth0(IndexY, Lista, Y), IndexX > IndexY.
aEsquerda(X, Y, Lista) :- aDireita(Y, X, Lista).
entre(X, Y, Z, Lista) :- aEsquerda(X, Y, Lista), aDireita(Z, Y, Lista).

% Solução do puzzle
solucao(Homens) :-
    Homens = [
        homem(Cor1, Nome1, Invest1, Valor1, Prazo1, Prof1),
        homem(Cor2, Nome2, Invest2, Valor2, Prazo2, Prof2),
        homem(Cor3, Nome3, Invest3, Valor3, Prazo3, Prof3),
        homem(Cor4, Nome4, Invest4, Valor4, Prazo4, Prof4),
        homem(Cor5, Nome5, Invest5, Valor5, Prazo5, Prof5)
    ],

    % O homem que investiu R$ 5 mil está em algum lugar à direita do homem de Amarelo.
    % Verifica se o homem com investimento de R$ 5 mil está em uma posição à direita do homem com camiseta amarela.
    aDireita(homem(_, _, _, 5000, _, _), homem(amarelo, _, _, _, _, _), Homens),

    % Caio está em algum lugar entre o amigo de camiseta Verde e o amigo que investiu em LCA, nessa ordem.
    % Verifica se Caio está entre o homem de camiseta verde e o que investiu em LCA.
    entre(homem(verde, _, _, _, _, _), homem(_, caio, _, _, _, _), homem(_, _, lca, _, _, _), Homens),

    % O Bancário está na segunda posição.
    % Verifica se o bancário está na segunda posição.
    nth1(2, Homens, homem(_, _, _, _, _, bancario)),

    % O Programador está na terceira posição.
    % Verifica se o programador está na terceira posição.
    nth1(3, Homens, homem(_, _, _, _, _, programador)),

    % O Programador está ao lado de quem fez um investimento com 6 anos de prazo.
    % Verifica se o programador está ao lado de alguém que fez um investimento de 6 anos.
    aoLado(homem(_, _, _, _, _, programador), homem(_, _, _, _, 6, _), Homens),

    % O homem de camiseta Branca investiu em LCI.
    % Verifica se o homem de camiseta branca investiu em LCI.
    member(homem(branco, _, lci, _, _, _), Homens),

    % O amigo que investiu com um prazo de 3 anos está exatamente à esquerda de quem investiu em LCA.
    % Verifica se o homem com prazo de 3 anos está exatamente à esquerda do homem que investiu em LCA.
    nextto(homem(_, _, _, _, 3, _), homem(_, _, lca, _, _, _), Homens),

    % Na quarta posição está quem fez um investimento com prazo de 2 anos.
    % Verifica se o homem na quarta posição fez um investimento com prazo de 2 anos.
    nth1(4, Homens, homem(_, _, _, _, 2, _)),

    % Bernardo investiu R$ 10 mil.
    % Verifica se Bernardo investiu R$ 10 mil.
    member(homem(_, bernardo, _, 10000, _, _), Homens),

    % O homem que investiu R$ 15 mil está em algum lugar à direita do homem de camiseta Vermelha.
    % Verifica se o homem que investiu R$ 15 mil está em uma posição à direita do homem com camiseta vermelha.
    aDireita(homem(_, _, _, 15000, _, _), homem(vermelho, _, _, _, _, _), Homens),

    % O investidor de camiseta Branca está em algum lugar entre o investidor de Verde e o Wagner, nessa ordem.
    % Verifica se o homem com camiseta branca está entre o homem de camiseta verde e o Wagner.
    entre(homem(verde, _, _, _, _, _), homem(branco, _, _, _, _, _), homem(_, wagner, _, _, _, _), Homens),

    % O amigo que investiu em Ações está ao lado do amigo que fez um investimento de R$ 20 mil.
    % Verifica se o homem que investiu em ações está ao lado de quem fez um investimento de R$ 20 mil.
    aoLado(homem(_, _, acoes, _, _, _), homem(_, _, _, 20000, _, _), Homens),

    % O Bancário está exatamente à esquerda de quem fez um investimento com prazo de 3 anos.
    % Verifica se o bancário está exatamente à esquerda do homem com investimento de prazo de 3 anos.
    aEsquerda(homem(_, _, _, _, _, bancario), homem(_, _, _, _, 3, _), Homens),

    % Ícaro está exatamente à direita de quem investiu em CDB.
    % Verifica se Ícaro está exatamente à direita do homem que investiu em CDB.
    aDireita(homem(_, icaro, _, _, _, _), homem(_, _, cdb, _, _, _), Homens),

    % Quem investiu R$ 10 mil planeja ter retorno no prazo de 4 anos.
    % Verifica se o homem que investiu R$ 10 mil tem um plano de retorno de 4 anos.
    member(homem(_, _, _, 10000, 4, _), Homens),

    % O dono do maior investimento está na terceira posição.
    % Verifica se o homem na terceira posição é o que fez o maior investimento de R$ 25 mil.
    nth1(3, Homens, homem(_, _, _, 25000, _, _)),

    % O Joalheiro está em algum lugar entre quem investiu R$ 10 mil e o Ator, nessa ordem.
    % Verifica se o Joalheiro está entre o homem que investiu R$ 10 mil e o Ator.
    entre(homem(_, _, _, 10000, _, _), homem(_, _, _, _, _, joalheiro), homem(_, _, _, _, _, ator), Homens),

    % O amigo de camiseta Vermelha está em algum lugar à esquerda de quem investiu R$ 5 mil.
    % Verifica se o homem com camiseta vermelha está à esquerda do homem que investiu R$ 5 mil.
    aEsquerda(homem(vermelho, _, _, _, _, _), homem(_, _, _, 5000, _, _), Homens),

    % O Joalheiro está na quarta posição.
    % Verifica se o Joalheiro está na quarta posição.
    nth1(4, Homens, homem(_, _, _, _, _, joalheiro)),

    % Caio está na segunda posição.
    % Verifica se Caio está na segunda posição.
    nth1(2, Homens, homem(_, caio, _, _, _, _)),

    % Wagner está ao lado do homem de camiseta Branca.
    % Verifica se Wagner está ao lado do homem com camiseta branca.
    aoLado(homem(_, wagner, _, _, _, _), homem(branco, _, _, _, _, _), Homens),

    % O amigo que investiu em CDB está ao lado de quem fez um investimento com o menor prazo.
    % Verifica se o homem que investiu em CDB está ao lado do homem com o menor prazo de 2 anos.
    aoLado(homem(_, _, cdb, _, _, _), homem(_, _, _, _, 2, _), Homens),

    % Restrições de valores únicos para cada atributo
    % Verifica se todas as cores de camiseta são diferentes.
    camiseta(Cor1), camiseta(Cor2), camiseta(Cor3), camiseta(Cor4), camiseta(Cor5),
    todos_diferentes([Cor1, Cor2, Cor3, Cor4, Cor5]),

    % Verifica se todos os nomes são diferentes.
    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todos_diferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),
    
    % Ícaro está exatamente à direita de quem investiu em CDB.
	% Modifique esta linha usando `nextto/3` para garantir que Ícaro está imediatamente à direita.
	nextto(homem(_, _, cdb, _, _, _), homem(_, icaro, _, _, _, _), Homens),

    % Verifica se todos os tipos de investimento são diferentes.
    investimento(Invest1), investimento(Invest2), investimento(Invest3), investimento(Invest4), investimento(Invest5),
    todos_diferentes([Invest1, Invest2, Invest3, Invest4, Invest5]),

    % Verifica se todos os valores de investimento são diferentes.
    valor(Valor1), valor(Valor2), valor(Valor3), valor(Valor4), valor(Valor5),
    todos_diferentes([Valor1, Valor2, Valor3, Valor4, Valor5]),

    % Verifica se todos os prazos de investimento são diferentes.
    prazo(Prazo1), prazo(Prazo2), prazo(Prazo3), prazo(Prazo4), prazo(Prazo5),
    todos_diferentes([Prazo1, Prazo2, Prazo3, Prazo4, Prazo5]),

    % Verifica se todas as profissões são diferentes.
    profissao(Prof1), profissao(Prof2), profissao(Prof3), profissao(Prof4), profissao(Prof5),
    todos_diferentes([Prof1, Prof2, Prof3, Prof4, Prof5]).

% Função principal que inicializa o puzzle
:- initialization(main).
main :-
    solucao(Homens),
    nl,
    write(Homens),
    nl, nl.
    

