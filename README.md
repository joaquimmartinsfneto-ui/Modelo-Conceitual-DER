 # Entrega 2 — Modelo Lógico, Implementação SQL e Apresentação Final

## Sistema de gestão de informações — Xenon Multimarcas

## Integrantes
|Nome completo|RGM|Usuário do GitHub|
|-|-:|-|
|Joaquim Martins Ferreira Neto|47609630|netosec|
|Gabriel Cabrera Conceição|47657499|gabrielcabrera602-commits|
|Guilherme Reis|47513438|Coelho|
|Gabriel Franco|47451289|gfranco0|

## 1.1 Revisão do Modelo Conceitual

## Caracterização da organização

* **Nome e natureza:** Xenon Multimarcas, concessionária/loja de veículos multimarcas com fins lucrativos.
* **Contexto e porte:** Com fins lucrativos, Uma empresa com micro operações que realiza no mínimo de 8 venda ao mês, com uma quantidade de 5 funcionarios no total atual podendo aumentar futuramente.
* **Problemas e necessidades identificados:**

  * **P1 — Registros comerciais e comprovantes desorganizados:** dificuldade para manter organizadas as informações e os comprovantes das transações de venda.
  * **P2 — Manutenções sem organização centralizada:** ausência de organização adequada dos registros de manutenção dos veículos.
* **Escopo do sistema:** O modelo relacional da Xenon Multimarcas foi projetado para englobar todos os dados e processos da organização, evitando recortes que atendam a apenas um setor específico. Embora a demanda inicial estivesse focada no controle de estoque e na logística de entregas, o banco de dados integra a operação completa da concessionária.
* **Justificativa da escolha:** Um de nossos integrantes do grupo identificou a necessidade da empresa e notou que encaixaria perfeitamente no trabalho solicitado, consideramos o fato dessa área ter bastante movimentação
* **Evidências disponíveis na Entrega 1:** Instagram informado como `@multimarcasxenon`; cartão digital: https://cartao-digital.com/xenonmultimarcas/; localização compartilhada no Maps: https://share.google/2ecURySgI5GrRgYwr. Inserir no repositório fotos JPG/PNG da organização e da visita/entrevista, além do endereço completo, se obtidos.
* **Responsável pela organização:** **Nome: Willian, Numero de Telefone: 11 2585-4801**

### Relato da entrevista e observação presencial

* **Entrevistado e função:** William Soares Carvalho, gerente e socio da empresa. Gabriel Cabrera, Gabriel Franco e Joaquim Martins.
* **Integrantes presentes:** Gabriel Cabrera, Gabriel Franco e Joaquim Martins.
* **Data e local dentro da organização:** 19 de Setembro, no local Av. Marechal Tito, 1850, 2012, 2212 e 2548 – São Miguel Paulista, São Paulo - SP (CEP: 08022-000)
* **Observações diretas da rotina:**  o grupo viu uma movimentação de cliente na hora da entrevista, vimos como funciona o primeiro atendimento; ao vendedor apresentar o veículo ao cliente interessado, ambos tiveram uma breve conversa e foram para a sala realizar uma simulação, a principio, o vendedor anotu em seu caderno os dados básicos do cliente, Nome, carro interessado, CPF, data de nascimento e numero de telefone.
* **Respostas/validações do responsável:** \[DESCREVER o que foi confirmado sobre processos, regras, volumes e problemas].
* **Nova visita/atualizações em relação à Entrega 1:** \[INFORMAR se houve; caso não tenha havido, declarar].
* **Comprovação:** adicionar `levantamento/evidencia\_entrevista.jpg` ou `.png` (nome real do arquivo) ao repositório.
* **Levantamento completo:** criar `levantamento/levantamento.md` com o relato organizado e linkar aqui.

### Processos de negócio mapeados

1. **Cadastro de clientes:** registrar nome completo, CPF, telefone e, quando disponíveis, e-mail e endereço; permitir consulta e alteração cadastral.
2. **Cadastro e controle de veículos:** registrar chassi, marca, modelo, ano, preço, tipo/categoria e situação (Disponível, Vendido, Reservado ou Em Manutenção); consultar o estoque.
3. **Cadastro de funcionários:** registrar nome, CPF, telefone e cargo para identificar os responsáveis pelas vendas.
4. **Registro e gestão de vendas:** associar cliente, funcionário e veículo; guardar data, valor, forma de pagamento e status.
5. **Gestão de financiamentos:** quando aplicável, associar a venda a um banco e registrar valor financiado, quantidade/valor das parcelas e situação da análise.
6. **Emissão e acompanhamento do pedido de venda:** após confirmação da compra ou aprovação do financiamento, registrar pedido, data, nota fiscal, cartório e status documental.
7. **Agendamento e acompanhamento da entrega:** registrar data prevista, data efetiva, endereço e status logístico.
8. **Organização dos registros comerciais:** manter os registros das etapas anteriores relacionados e consultáveis.

**Justificativa de processos não incluídos:** o README não detalha compras/aquisição de veículos, fornecedores, avaliação de usados, despesas, comissões, seguros, documentação de entrada, cancelamento operacional nem manutenção preventiva/corretiva. Não se deve afirmar que esses processos não existem. O grupo deve perguntar ao responsável quais são realizados, quais são terceirizados e quais ficam fora do escopo. Em especial, esclarecer P2 (manutenções).

### Requisitos funcionais

* **RF01 — Gerenciamento de clientes:** cadastrar, consultar e alterar clientes, armazenando `nm\_cliente`, `nr\_cpf`, `nr\_telefone` (obrigatórios), `ds\_email` e `ds\_endereco` (opcionais); impedir CPF duplicado.
* **RF02 — Gerenciamento de veículos:** cadastrar e atualizar veículos com `ds\_chassi`, `nm\_marca`, `nm\_modelo`, `nr\_ano`, `vl\_preco`, `tp\_veiculo` e `st\_veiculo`; impedir chassi duplicado e permitir consulta do estoque por situação.
* **RF03 — Gerenciamento de funcionários:** cadastrar, consultar e atualizar `nm\_funcionario`, `nr\_cpf`, `nr\_telefone` e `ds\_cargo`; impedir CPF duplicado.
* **RF04 — Registro e gestão de vendas:** registrar `dt\_venda`, `vl\_total`, `ds\_forma\_pagamento` e `st\_venda`, vinculando obrigatoriamente um cliente, um funcionário e um veículo; permitir acompanhar vendas pendentes, aprovadas, concluídas e canceladas.
* **RF05 — Gestão de financiamentos bancários:** registrar, quando a forma de pagamento for Financiamento ou Misto, o banco, `vl\_financiado`, `qt\_parcelas`, `vl\_parcela` e `st\_financiamento`; permitir acompanhar análise, aprovação, recusa ou cancelamento.
* **RF06 — Emissão de pedido de venda:** gerar pedido associado a uma venda confirmada (ou com financiamento aprovado, quando houver), registrando `dt\_pedido`, `nr\_nota\_fiscal`, `nm\_cartorio` e `st\_pedido`.
* **RF07 — Consulta de veículos disponíveis:** exibir em consulta o chassi, marca, modelo, ano, preço, tipo e situação do veículo, com atualização do estado após a venda/reserva/manutenção.
* **RF08 — Acompanhamento de pedidos e entregas:** registrar `dt\_prevista`, `dt\_entrega`, `ds\_endereco\_entrega` e `st\_entrega`; permitir consultar a situação da entrega e identificar atrasos.
* **RF09 — Consulta integrada do histórico comercial:** permitir localizar a venda e consultar, em conjunto, cliente, funcionário, veículo, pagamento/financiamento, pedido e entrega, para facilitar a recuperação dos dados e comprovantes associados.
* **RF10 — Controle de manutenção (pendente de validação):** caso a concessionária confirme que controla manutenções internamente, registrar veículo, tipo/descrição do serviço, datas, custo, responsável/prestador e situação. Esses atributos ainda não foram levantados e não devem ser implementados como fatos sem validação.

### Requisitos não funcionais

* **RNF01 — Usabilidade:** telas e consultas devem usar nomenclatura clara, formulários objetivos e validação dos campos obrigatórios, facilitando o uso pela equipe de pequeno porte.
* **RNF02 — Disponibilidade:** os dados devem estar disponíveis durante o horário de operação da concessionária, conforme infraestrutura adotada.
* **RNF03 — Integridade:** o banco deve aplicar PK, FK, NOT NULL, UNIQUE e CHECK compatíveis com as regras cadastradas.
* **RNF04 — Segurança e privacidade:** restringir acesso a dados pessoais e comerciais por função; não expor CPF, telefone ou endereço em relatórios sem necessidade; manter cópias de segurança. A política concreta de perfis e backup deve ser definida com a organização.
* **RNF05 — Desempenho:** consultas comuns de clientes, estoque e vendas devem responder em tempo adequado ao porte informado; índices devem ser aplicados às chaves e campos de busca relevantes.

### Regras de negócio codificadas

* **RN01 — Identificação única:** CPF de cliente e funcionário, CNPJ de banco e chassi de veículo não podem se repetir.
* **RN02 — Venda vinculada:** toda venda deve referenciar exatamente um cliente, um funcionário e um veículo existentes.
* **RN03 — Exclusividade do veículo:** um veículo não pode estar associado a mais de uma venda; ao concluir a venda, sua situação deve passar para `Vendido`. Se uma venda for cancelada, a situação do veículo deve ser revista conforme a condição real do veículo.
* **RN04 — Financiamento condicional:** só deve existir financiamento para venda cuja forma de pagamento seja `Financiamento` ou `Misto`; uma venda pode ter no máximo um financiamento e cada financiamento pertence a uma venda.
* **RN05 — Aprovação para pedido financiado:** venda com financiamento só pode gerar pedido após aprovação do banco. Para pagamento sem financiamento, o pedido pode ser gerado após confirmação da compra.
* **RN06 — Pedido único por venda:** uma venda pode originar no máximo um pedido; cada pedido pertence a uma única venda.
* **RN07 — Entrega vinculada:** cada entrega pertence a uma venda com pedido emitido; uma venda pode ter no máximo uma entrega no modelo atual.
* **RN08 — Liberação da entrega:** uma entrega só pode ser marcada como `Entregue` se houver nota fiscal registrada no pedido e, quando houver financiamento, se ele estiver aprovado.
* **RN09 — Domínios controlados:** situação de veículo, venda, financiamento, pedido e entrega deve aceitar somente os valores definidos no dicionário.
* **RN10 — Coerência cronológica:** data da venda não pode ser futura; pedido não pode anteceder a venda; entrega prevista não pode anteceder o pedido/venda; data efetiva não pode anteceder a data prevista sem justificativa operacional registrada.
* **RN11 — Valores positivos:** preço do veículo, valor da venda, valor financiado, valor de parcela e quantidade de parcelas devem ser positivos.
* **RN12 — Dados corretos do veículo:** a venda/pedido deve usar um veículo cadastrado com chassi, marca, modelo, ano e preço válidos.
* **RN13 — Histórico preservado:** cancelamentos devem permanecer registrados com status `Cancelada`, em vez de apagar a transação, para manter histórico e auditoria.

**Notação do DER conceitual (todos os grupos — Caso A e Caso B)**

*O DER deve seguir a notação do **brModelo**, como no exemplo abaixo:*

![Exemplo de DER na notação do brModelo](Exemplo_DER.png)

| Elemento | Como aparece | No exemplo |
| :---- | :---- | :---- |
| **Entidade** | retângulo | `Entity 1` a `Entity 5` |
| **Relacionamento** | losango | `Rel 33`, `Rel 34` |
| **Cardinalidade mínima e máxima** | par `(mín, máx)` dos dois lados de cada relacionamento | `(0, 1)`, `(1, n)`, `(0, n)` |
| **Autorrelacionamento** | losango ligado duas vezes à mesma entidade, cada lado com sua cardinalidade | `Rel 33`, em `Entity 3` |
| **Atributo identificador (chave)** | círculo **preenchido** | `Chave 1`, `Chave 2`, `Chave 3`, `Chave 4` |
| **Identificador composto** | mais de um círculo preenchido na mesma entidade (obrigatório) — ou mais de um atributo sublinhado, se os atributos estiverem listados no retângulo | `Chave 50` \+ `Chave 51`, em `Entity 5` |
| **Atributo comum** | círculo **vazio** | `Attribute 10`, `Attribute 30` |
| **Atributo multivalorado** | círculo vazio com a cardinalidade do atributo | `Attribute 11 (1, n)` |
| **Atributo composto** *(representação gráfica opcional)* | atributo com seus próprios subatributos ligados a ele | `Attribute 21`, com `attr 211` e `attr 212` |
| **Generalização/especialização** | triângulo ligando a entidade genérica às especializadas. **A indicação de totalidade e disjunção não é obrigatória** | `Entity 1` → `Entity 2` e `Entity 3` |
| **Entidade associativa** | retângulo envolvendo o losango do relacionamento, que passa a poder se relacionar com outras entidades e ter atributos próprios | `Rel 53`, com `Attribute 530` |

&nbsp;

- **Representação gráfica opcional:** atributos compostos podem ser desenhados como no exemplo (subatributos ligados ao atributo), mas não é obrigatório; o mesmo vale para a indicação de totalidade/disjunção da generalização/especialização.  
- **Atributos de entidades:** podem ser representados como no brModelo (círculos ligados à entidade, como no exemplo) **ou** listados dentro do retângulo da entidade — nesse caso, o **identificador deve estar sublinhado**.  
- **Atributos de relacionamentos e de entidades associativas:** **somente** como no brModelo, ligados ao losango ou à entidade associativa (como `Attribute 530`) — não podem ser listados dentro de um retângulo.  
- **Sem chaves estrangeiras** — elas só aparecem no modelo lógico (seção 2).

*Informe no README **em qual software ou aplicativo o DER foi criado**.*

**Caso A — mesma organização da Entrega 1**

*Apresente o **DER conceitual revisado**, na notação descrita acima. A revisão parte da correção da Entrega 1 recebida pelo grupo — o DER e os demais itens acima. Para cada apontamento da correção, registre o que foi feito:*

| Apontamento da correção da E1 | O que mudou no trabalho | Por quê |
| :---- | :---- | :---- |
| *ex.: N:N entre PEDIDO e PRODUTO sem quantidade* | *criada a entidade associativa ITEM\_PEDIDO com quantidade e preço praticado* | *sem ela não é possível saber quanto de cada produto foi vendido* |
| *ex.: chaves estrangeiras desenhadas no DER* | *removidas — passam a aparecer só no modelo lógico (seção 2\)* | *FK é decisão do modelo lógico, não do conceitual* |

&nbsp;

*Se o grupo discordar de algum apontamento e mantiver o modelo como estava, registre isso na tabela com a justificativa. Apontamento não citado na tabela é tratado como não corrigido.*

**Caso B — nova organização (a da Entrega 1 era fictícia ou não teve a existência comprovada)**

*Além de todos os itens acima, apresente o **DER conceitual** da nova organização, na notação descrita acima.*

*Use a correção da Entrega 1 do grupo como guia dos erros a não repetir, mesmo sendo outra organização.*

## 1.2 Conversão do Modelo Conceitual para o Modelo Lógico

Cada entidade conceitual foi convertida em uma tabela relacional com uma chave primária própria:

|Entidade conceitual|Tabela relacional|Conversão/observação|
|-|-|-|
|CLIENTE|`CLIENTE`|Atributos cadastrais convertidos em colunas.|
|FUNCIONARIO|`FUNCIONARIO`|Dados do colaborador em tabela própria.|
|VEICULO|`VEICULO`|Dados de identificação e situação do estoque.|
|VENDA|`VENDA`|Entidade transacional; recebe FKs de cliente, funcionário e veículo.|
|BANCO|`BANCO`|Cadastro separado para evitar repetir dados bancários nos financiamentos.|
|FINANCIAMENTO|`FINANCIAMENTO`|Tabela própria, com FK para BANCO e FK UNIQUE para VENDA.|
|PEDIDO\_DE\_VENDA|`PEDIDO\_DE\_VENDA`|Tabela documental com FK UNIQUE para VENDA.|
|ENTREGA|`ENTREGA`|Tabela logística com FK UNIQUE para VENDA.|

Os atributos simples foram convertidos em colunas com tipos compatíveis: identificadores em `INT AUTO\_INCREMENT`, textos em `VARCHAR`/`TEXT`, datas em `DATE`/`DATETIME`, valores monetários em `DECIMAL(12,2)` e quantidades em `INT`. Os relacionamentos 1:N foram implementados com FK no lado N. Os relacionamentos 1:1 opcionais foram implementados com FK e restrição `UNIQUE` no lado dependente. Não há relacionamento N:N nem generalização/especialização no DER descrito na E1; portanto, não foi necessária tabela associativa nem estratégia de herança.

## 1.3 Definição de Chaves Primárias e Estrangeiras

|Tabela|Chave primária|Chaves estrangeiras|Restrições adicionais|
|-|-|-|-|
|CLIENTE|`id\_cliente`|—|`nr\_cpf` UNIQUE|
|FUNCIONARIO|`id\_funcionario`|—|`nr\_cpf` UNIQUE|
|VEICULO|`id\_veiculo`|—|`ds\_chassi` UNIQUE|
|VENDA|`id\_venda`|`id\_cliente` → CLIENTE; `id\_funcionario` → FUNCIONARIO; `id\_veiculo` → VEICULO|`id\_veiculo` UNIQUE|
|BANCO|`id\_banco`|—|`nr\_cnpj` UNIQUE|
|FINANCIAMENTO|`id\_financiamento`|`id\_banco` → BANCO; `id\_venda` → VENDA|`id\_venda` UNIQUE|
|PEDIDO\_DE\_VENDA|`id\_pedido`|`id\_venda` → VENDA|`id\_venda` UNIQUE; `nr\_nota\_fiscal` UNIQUE quando informado|
|ENTREGA|`id\_entrega`|`id\_venda` → VENDA|`id\_venda` UNIQUE|

## 1.4 Processo de Normalização (1FN, 2FN e 3FN)

* **Primeira Forma Normal (1FN):** cada coluna guarda um único valor por registro. CPF, telefone, e-mail, endereço, marca, modelo, datas, status e valores são armazenados em campos próprios. Não há listas de telefones, parcelas ou veículos dentro de uma mesma coluna. O financiamento é separado da venda, e o banco é separado do financiamento, evitando grupos repetitivos de dados bancários e de parcelamento.
* **Segunda Forma Normal (2FN):** todas as tabelas utilizam chave primária simples (`id\_\*`), de modo que os atributos não-chave dependem da chave primária inteira. Não há chave primária composta com dependências parciais. Os dados do cliente, funcionário, veículo e banco permanecem em suas próprias tabelas, em vez de serem repetidos em cada venda.
* **Terceira Forma Normal (3FN):** os atributos não-chave dependem diretamente da chave primária da tabela, sem depender de outro atributo não-chave. Por exemplo, nome/CPF do cliente dependem de `id\_cliente`, não de `id\_venda`; nome/CNPJ do banco dependem de `id\_banco`, não de `id\_financiamento`; dados documentais ficam em PEDIDO\_DE\_VENDA e dados logísticos em ENTREGA. Isso reduz redundância e anomalias de atualização.

**Justificativa:** a separação evita repetir dados cadastrais em transações, permite alterar dados de um cliente/banco em um único local e separa o ciclo comercial, documental, financeiro e logístico. A estrutura atual não representa parcelas individualmente (há apenas quantidade e valor da parcela), porque esse detalhamento não aparece entre os atributos levantados na E1. Caso a organização precise controlar vencimento e pagamento de cada parcela, será necessária uma entidade PARCELA após levantamento

## 1.5 Justificativas Técnicas das Decisões

* **PKs substitutas (`id\_\*`):** identificadores numéricos independentes dos dados de negócio; evitam que alterações em nome, CPF, chassi ou razão social afetem os relacionamentos.
* **FKs em VENDA:** implementam os relacionamentos obrigatórios com CLIENTE, FUNCIONARIO e VEICULO (RN02), impedindo venda com referências inexistentes.
* **UNIQUE em CPF, CNPJ e chassi:** evita cadastros duplicados (RN01). A validação de formato deve ser feita pela aplicação e, quando suportada, por CHECK; apenas contar caracteres não garante que CPF/CNPJ sejam matematicamente válidos.
* **UNIQUE em `VENDA.id\_veiculo`:** impede mais de uma venda para o mesmo veículo (RN03). A situação `st\_veiculo` registra o estado atual; a aplicação/transação deve atualizá-la quando a venda for concluída.
* **FK UNIQUE em FINANCIAMENTO.id\_venda:** implementa no máximo um financiamento por venda (RN04). A regra condicional que compara forma de pagamento e existência de financiamento exige validação transacional ou trigger; deve ser testada no MySQL.
* **FK UNIQUE em PEDIDO\_DE\_VENDA.id\_venda e ENTREGA.id\_venda:** implementam no máximo um pedido e uma entrega por venda (RN06 e RN07).
* **NOT NULL:** aplicado a campos essenciais para identificar registros e cumprir os requisitos (RN02, RN09 e RN11). Campos opcionais permanecem NULL quando não informados.
* **CHECK/domínios:** controlam status, forma de pagamento, valores positivos, quantidade de parcelas e coerência básica de datas (RN09–RN12). A versão do MySQL usada deve aplicar CHECK; validar a versão no ambiente de laboratório.
* **Separação de tabelas:** VENDA registra a negociação; FINANCIAMENTO registra crédito; PEDIDO\_DE\_VENDA registra documentação; ENTREGA registra logística. Isso reduz campos vazios e permite acompanhar cada etapa (RN04–RN08).
* **Histórico:** vendas canceladas permanecem armazenadas (RN13), permitindo auditoria e análise de cancelamentos.

**Limitação técnica importante:** regras que dependem de dados em tabelas diferentes (por exemplo, só emitir pedido se o financiamento estiver aprovado; só marcar entrega como entregue se existir nota fiscal) não são garantidas por um CHECK simples. Devem ser implementadas na camada de serviço/transação ou por triggers e cobertas por consultas de auditoria.

## 1.6 Proposta de Arquitetura Analítica para BI e IA
### Informações estratégicas

A estrutura permite analisar volume e valor de vendas por período, desempenho por vendedor, modelos/marcas comercializados, disponibilidade do estoque, formas de pagamento, volume e aprovação de financiamentos por instituição, andamento documental e tempo entre venda e entrega. Esses dados podem apoiar planejamento de estoque, acompanhamento comercial e identificação de gargalos documentais/logísticos.

### KPIs propostos

|Código|KPI e fórmula|Período sugerido|Interpretação|
|-|-|-|-|
|KPI01|**Quantidade de vendas concluídas** = contagem de vendas com `st\_venda='Concluída'`|Mensal|Volume comercial efetivado.|
|KPI02|**Faturamento concluído** = soma de `vl\_total` para vendas concluídas|Mensal|Valor total vendido no período.|
|KPI03|**Ticket médio** = faturamento concluído ÷ quantidade de vendas concluídas|Mensal|Valor médio por venda concluída.|
|KPI04|**Taxa de cancelamento** = vendas canceladas ÷ total de vendas × 100|Mensal|Participação de cancelamentos no total registrado.|
|KPI05|**Estoque por situação** = contagem de veículos agrupada por `st\_veiculo`|Diário|Visão da disponibilidade.|
|KPI06|**Taxa de aprovação de financiamento** = financiamentos aprovados ÷ financiamentos analisados (aprovados + recusados) × 100|Mensal|Resultado das análises de crédito registradas.|
|KPI07|**Tempo médio venda–entrega** = média de dias entre `dt\_venda` e `dt\_entrega` para entregas concluídas|Mensal|Eficiência do fluxo de entrega.|
|KPI08|**Vendas por funcionário** = contagem e soma de vendas concluídas agrupadas por funcionário|Mensal|Apoio à gestão comercial.|
Metas numéricas não foram fornecidas pela organização; devem ser definidas com o responsável, e não inventadas no relatório.

## 2\. Modelo Lógico Relacional

*(diagrama separado — vale 10% na Dimensão Procedimental)*

O modelo lógico deve seguir a **notação visual do brModelo** para o modelo lógico, como no exemplo abaixo. Informe no README **em qual software ou aplicativo ele foi criado**.

![Exemplo de modelo lógico na notação do brModelo](Exemplo_Logico.png)

| Elemento | Como aparece | No exemplo |
| :---- | :---- | :---- |
| **Tabela** | retângulo com o nome da tabela no topo e uma linha por coluna | `Entity 1`, `Entity 5` |
| **Coluna** | nome da coluna, à esquerda, com o tipo de dado à direita | `Attribute 30` — `INT` |
| **Chave primária** | marca `PK` ao lado do tipo | `Chave 1`, em `Entity 1`; `Chave 50` \+ `Chave 51`, em `Entity 5` (chave primária composta) |
| **Chave estrangeira** | marca `FK` ao lado do tipo | `Chave 3`, em `Entity 4` |
| **Coluna que é chave primária e estrangeira** | marcas `PK, FK` | `Chave 1`, em `Entity 2` |
| **Ligação entre tabelas** | linha entre a tabela da FK e a tabela referenciada, com a cardinalidade `(mín, máx)` em cada ponta | `Entity 3` — `Entity 4`: `(1, 1)` e `(0, n)` |

&nbsp;

Deve apresentar claramente:

- Tabelas  
- Atributos (colunas), com seus tipos de dados  
- Chaves primárias  
- Chaves estrangeiras  
- Cardinalidades já convertidas

As **demais restrições de integridade** — obrigatoriedade (`NOT NULL`), unicidade (`UNIQUE`), valores permitidos (`CHECK`), valores padrão (`DEFAULT`) — não aparecem no diagrama do brModelo e devem ser documentadas no **dicionário de dados** (seção 5\) e implementadas no **script SQL** (seção 3).

---

## 3\. Script SQL Completo

*(arquivo `.sql` — vale 12% na Dimensão Procedimental)*

O script completo é **um arquivo no formato `.sql` disponível no repositório**, de preferência numa pasta chamada **`docs`** (ex.: `docs/script.sql`), com link no README. Script colado só no README, em PDF, em imagem ou em outro formato não é aceito.

**SGBD:** MySQL — o disponível no laboratório ou outra instalação equivalente a que o grupo tenha acesso. O script deve executar no MySQL.

O script deve conter, nesta ordem lógica:

1. `CREATE DATABASE`  
2. `CREATE TABLE` (todas as tabelas, com tipos de dados adequados)  
3. **Constraints** (PK, FK, `NOT NULL`, `UNIQUE`, `CHECK` etc.)  
4. `INSERT INTO` (carga da massa de dados — ver seção 4\)  
5. `SELECT` com `JOIN` (consultas que cruzam múltiplas tabelas)  
6. `UPDATE`  
7. `DELETE`  
8. **Consultas gerenciais** (que respondem perguntas de gestão, ex.: faturamento/arrecadação por período, número de atendimentos/beneficiários)  
9. **Consultas de auditoria** (que verificam consistência/integridade dos dados)

Cada **consulta gerencial** e cada **consulta de auditoria** deve ter um cabeçalho em comentário com um código (`G01`, `G02`… para gerenciais; `A01`, `A02`… para auditoria), a pergunta que ela responde em português e o que ela atende:

```sql
-- G03 — Quais bebidas estão abaixo do estoque mínimo hoje?
-- Atende: P1 (ruptura de estoque de bebidas)
SELECT ...

-- A02 — Existe pedido registrado sem nenhum item?
-- Verifica: RN04 (todo pedido tem ao menos um item)
SELECT ...
```

&nbsp;

- **Consultas gerenciais** respondem aos problemas declarados e aos KPIs da seção 1.6 — pelo menos uma por problema declarado e por KPI.  
- **Consultas de auditoria** verificam regras de negócio, citando o código da regra (`RNxx`) que cada uma confere.  
- Essas mesmas consultas são as usadas na demonstração da apresentação final (seção 7).

*Teste o script do zero (banco vazio) antes de entregar, para garantir que ele executa sem erros.*

---

## 4\. Massa de Dados

*(incluída no script ou em arquivo separado — parte da nota de Implementação SQL, 12%)*

Se a massa de dados ficar em arquivo separado, ele deve seguir a mesma regra do script: **um arquivo no formato `.sql` no repositório**, de preferência na pasta **`docs`** (ex.: `docs/massa_de_dados.sql`), com link no README.

- **Dados reais da organização (nomes de clientes, fiéis, beneficiários, doadores, valores reais etc.) não devem ser utilizados, em respeito à privacidade dessas informações.** A massa de dados deve ser **fictícia**, mas **coerente com as operações modeladas** (mesmos tipos de processo, volumes e regras observados na organização real).  
- Volume de registros **coerente com a realidade da organização** (nada de 3 linhas de exemplo — mas também nada artificialmente inflado sem sentido).  
- **Explique como o volume real da organização** — os números informados em *Contexto e porte* (seção 1.1), como clientes ativos, pedidos por mês, atendimentos por semana, itens no estoque — **justifica a quantidade de registros de cada tabela** da massa de dados.  
- Dados consistentes o suficiente para validar os processos organizacionais modelados (ex.: pedidos que referenciam clientes e produtos existentes, ou doações que referenciam doadores e campanhas existentes).  
- **Variedade e quantidade coerentes com a organização, para que os testes sejam possíveis:** os dados devem cobrir as situações reais — não só o caso comum, mas também pedidos cancelados, clientes sem compras, produtos abaixo do estoque mínimo, pagamentos em formas diferentes, registros em períodos diferentes. Sem essa variedade, as consultas gerenciais e de auditoria (seção 3\) não têm o que mostrar: uma consulta de produtos abaixo do estoque mínimo que retorna vazio não demonstra nada.  
- **Documente o uso de LLMs** para gerar essa massa de dados na seção 6 (**Uso de Inteligência Artificial**), incluindo ferramentas, prompts e ajustes feitos manualmente.

---

## 5\. Repositório GitHub

*(vale 13% — Documentação e Repositório)*

O repositório deve conter:

- Relatório Técnico (no `README.md`)  
- **Dicionário de Dados** atualizado, no modelo do arquivo `02-03g_Exemplo_Dicionario_Dados.pdf` e com as restrições de integridade de cada coluna (obrigatoriedade, unicidade, valores permitidos, valor padrão), em **um único arquivo HTML** no repositório. **Exceção — turma de GTI:** o dicionário é apresentado em **um único arquivo Markdown (`.md`) separado do README**, seguindo o mesmo modelo do `02-03g_Exemplo_Dicionario_Dados.pdf`.  
- Diagramas (DER revisado e modelo lógico)  
- Levantamento (pasta `levantamento`, recomendada) e evidências da organização e da entrevista (fotos JPG ou PNG)  
- Script SQL completo em arquivo `.sql` (de preferência na pasta `docs`)  
- **Histórico de commits** que evidencie o desenvolvimento ao longo do tempo (evite um único commit final)  
- **Evidências de colaboração entre os membros do grupo:** é a listagem de commits do repositório, que deve estar **equilibrada entre os integrantes** — a quantidade de commits deve se distribuir de forma proporcional entre todos os membros do grupo, cada um fazendo commits com a própria conta do GitHub. O integrante precisa ser **identificável na conta do GitHub**: o nome configurado na conta deve ser compatível com o nome do aluno na tabela de Integrantes, onde também deve constar o usuário do GitHub de cada um

---

## 6\. Uso de Inteligência Artificial

*(documentação obrigatória — não é opcional se o grupo usou IA em qualquer etapa: pesquisa, levantamento de processos, requisitos e regras típicos, escrita, organização de ideias, revisão de texto, geração de massa de dados ou apoio a scripts SQL)*

Para cada uso relevante de ferramenta de IA (ChatGPT, Claude, Gemini, Perplexity etc.), registre:

| Item | O que registrar |
| :---- | :---- |
| **Ferramenta e etapa** | Qual IA foi usada e em qual parte do trabalho (ex.: normalização, geração da massa de dados, escrita de queries SQL, redação do relatório, preparação dos slides). |
| **Motivação** | Por que o grupo recorreu à IA nesse ponto específico. |
| **Prompt(s) utilizados** | Texto exato (ou muito próximo) do que foi perguntado/pedido à IA. |
| **Resposta recebida** | Resumo ou trecho relevante da resposta da IA. |
| **Fontes consultadas e verificadas** | Se a IA citou fontes/dados, quais foram checadas pelo grupo e como. |
| **Trechos rejeitados ou corrigidos** | O que da resposta da IA foi descartado, editado ou corrigido manualmente (ex.: query SQL ajustada, dado fictício alterado), e por quê. |
| **Justificativa da escolha final** | Por que o grupo manteve, adaptou ou rejeitou o que a IA sugeriu. |
| **Reflexão crítica** | Limites, vieses ou erros identificados no uso da IA nessa etapa (ex.: normalização incorreta sugerida pela IA, script SQL com erro de sintaxe, dado fictício incoerente com o volume real da organização). |

&nbsp;

*Se o grupo não usou nenhuma ferramenta de IA em alguma dessas etapas, declare isso explicitamente.*

**Uso de IA observado e não declarado será penalizado.**

---

## 7\. Apresentação Corporativa Final

*(pitch cronometrado de **8 minutos** — vale 15%, maior peso individual da Dimensão Procedimental)*

Formato: slides com estética limpa e minimalista — **proibida a leitura de blocos longos de texto**.

O pitch deve conter, nesta ordem:

1. **Contextualização do problema institucional/organizacional** solucionado  
2. **Apresentação da solução** proposta  
3. **Apresentação do modelo lógico**  
4. **Demonstração da implementação** (SQL rodando)  
5. **Demonstração de consultas** (gerenciais/auditoria)  
6. **Potencial para BI e IA**  
7. **Benefícios diretos** para a tomada de decisão da organização

**Defesa do modelo lógico:** logo após o pitch, fora do tempo cronometrado, o grupo responde às perguntas do professor e da turma. **Cada pergunta deve ser respondida exclusivamente pelo aluno a quem foi dirigida** — os colegas não podem responder por ele.

**Regras da apresentação:**

- **Participação:** não é necessário e nem recomendável que todos os integrantes falem durante o pitch, mas é **obrigatório que todos participem** da apresentação e estejam presentes para a defesa.  
- **Ausência:** o integrante ausente na apresentação terá **nota reduzida**, exceto em casos com justificativa legal (ex.: doença que impeça o comparecimento, com atestado).  
- **Apresentação pessoal:** será avaliada. Postura e vestimenta adequadas a uma apresentação corporativa. Não são adequados bonés, bermudas, chinelos, camisas de time, roupas esportivas ou semelhantes.

---

## Critérios Atitudinais (20%)

**Estes critérios NÃO constam explicitamente como item de entrega nos artefatos do grupo.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub (Seção 5\) e pela conduta do grupo na **Apresentação Corporativa Final** (seção 7\) — não pela leitura do relatório:

- **Participação e colaboração (5%):** participação técnica ativa \+ colaboração com o grupo, incluindo colaboração equilibrada no histórico de commits do repositório GitHub.  
- **Responsabilidade (5%):** cumprimento de prazos \+ entrega dos itens sob sua responsabilidade.  
- **Postura profissional (5%):** comunicação profissional \+ conduta ética.  
- **Autonomia e resolução de problemas (5%):** buscar soluções independentes \+ propor melhorias.

---

## Resumo dos Pesos

| Dimensão | Peso total | Itens principais |
| :---- | :---- | :---- |
| Conceitual | 30% | Conversão conceitual→lógico (7,5%), Normalização (7,5%), Justificativas técnicas (7,5%), Análise BI/IA (7,5%) |
| Procedimental | 50% | Modelo lógico (10%), Implementação SQL (12%), Documentação/repositório (13%), Apresentação final (15%) |
| Atitudinal | 20% | Participação/colaboração, responsabilidade, postura profissional, autonomia |

&nbsp;

**Entrega final:** Relatório Técnico \+ Dicionário de Dados \+ Modelo Conceitual \+ Modelo Lógico \+ Script SQL \+ Massa de Dados \+ Repositório GitHub, seguidos da Apresentação Corporativa Final perante o professor e a turma.

&nbsp;
