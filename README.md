# RachaCucaProlog
Esse código contem a solução do puzzle lógico Investindo no Futuro,
envolvendo cinco amigos, cada um com características únicas em termos de cor da
camiseta, nome, tipo de investimento, valor do investimento, prazo e profissão. O objetivo
do problema é determinar a combinação correta dessas características com base em um
conjunto específico de regras fornecidas. As regras podem ser observadas a seguir:

1. O homem que investiu R$ 5 mil está em algum lugar à direita do homem de
Amarelo.
2. Caio está em algum lugar entre o amigo de camiseta Verde e o amigo que investiu
em LCA, nessa ordem.
3. O Bancário está na segunda posição.
4. O Programador está ao lado de quem fez um investimento com 6 anos de prazo.
5. O homem de camiseta Branca investiu em LCI.
6. O amigo que investiu com um prazo de 3 anos está exatamente à esquerda de
quem investiu em LCA.
7. Na quarta posição está quem fez um investimento com prazo de 2 anos.
8. Bernardo investiu R$ 10 mil.
9. O homem que investiu R$ 15 mil está em algum lugar à direita do homem de
camiseta Vermelha.
10. O investidor de camiseta Branca está em algum lugar entre o investidor de Verde e o
Wagner, nessa ordem.
11. O amigo que investiu em Ações está ao lado do amigo que fez um investimento de
R$ 20 mil.
12. O Programador está na terceira posição.
13. O Bancário está exatamente à esquerda de quem fez um investimento com prazo de
3 anos.
14. Ícaro está exatamente à direita de quem investiu em CDB.
15. Quem investiu R$ 10 mil planeja ter retorno no prazo de 4 anos.
16. O dono do maior investimento está na terceira posição.
17. O amigo que investiu em CDB está ao lado de quem fez um investimento com o
menor prazo.
18. Caio está na segunda posição.
19. Wagner está ao lado do homem de camiseta Branca.
20. O Joalheiro está em algum lugar entre quem investiu R$ 10 mil e o Ator, nessa
ordem.
21. O amigo de camiseta Vermelha está em algum lugar à esquerda de quem investiu
R$ 5 mil.
22. O Joalheiro está na quarta posição.

## Explicação do código

O código começa definindo os possíveis valores para cada atributo dos amigos: a
cor da camiseta, o nome, o tipo de investimento, o valor do investimento, o prazo e a
profissão. Estes são definidos como fatos simples em Prolog, usando a sintaxe de
predicados, como camiseta(amarelo)., nome(caio)., e assim por diante. Essas declarações
estabelecem o universo de valores que cada atributo pode assumir. A partir desses valores,
o Prolog irá permutar todas as combinações possíveis durante a busca por soluções que
atendam às regras do problema.

O código inclui várias funções auxiliares (todos_diferentes/1, aoLado/3, aDireita/3,
aEsquerda/3, entre/4) que ajudam a implementar as regras específicas do problema. A
função todos_diferentes/1 é crucial para garantir que todos os atributos de um determinado
tipo sejam únicos entre os cinco amigos. Ela percorre a lista de atributos e verifica, para
cada elemento, que ele não é membro do restante da lista, utilizando o predicado
not(member(H, T)). As funções aoLado/3, aDireita/3, e aEsquerda/3 utilizam o predicado
nextto/2 ou índices para verificar se elementos estão próximos ou em posições específicas
relativas entre si. A função entre/4 combina essas funções para verificar se um elemento
está posicionado entre dois outros elementos na lista, mantendo a ordem especificada.

As regras específicas do problema são implementadas dentro do predicado
solucao/1, que define a lista de amigos como uma sequência de predicados homem/6, cada
um representando um amigo com seus atributos. Por exemplo, a regra "O amigo que
investiu com um prazo de 3 anos está exatamente à esquerda de quem investiu em LCA" é
implementada com nextto(homem(_, _, _, _, 3, _), homem(_, _, lca, _, _, _), Homens). Isso
garante que na lista Homens, o elemento com um prazo de 3 anos aparece diretamente
antes do elemento que investiu em LCA. Cada regra é traduzida em uma condição de
Prolog que deve ser satisfeita para a solução ser considerada válida.

O Prolog utiliza um mecanismo de inferência baseado em backtracking para
encontrar soluções que satisfaçam todas as condições especificadas. Quando o predicado
solucao/1 é invocado, o Prolog tenta encontrar uma atribuição de valores aos predicados
homem/6 que satisfaça todas as regras simultaneamente. Se o Prolog encontra um conflito
em qualquer das regras, ele automaticamente volta atrás (backtracking) para tentar uma
combinação diferente de valores, explorando todas as permutações possíveis até encontrar
uma solução ou até esgotar todas as possibilidades.
A seguir pode-se observar as Figuras 1,2 e 3 que mostram o problema resolvido no
site Racha Cuca, as respostas colocadas no site e a saída do codigo respectivamente.


![image](https://github.com/user-attachments/assets/3f60f14a-6bc0-46c5-80a1-de15e2c6496d)
![image](https://github.com/user-attachments/assets/5e6e0f76-49cf-4704-918e-c6961c31f629)
![image](https://github.com/user-attachments/assets/64856e68-e1e9-4e0c-a07a-a72b0c197abe)
    



