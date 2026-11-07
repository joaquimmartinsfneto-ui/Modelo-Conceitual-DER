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
* **Evidências:** 
Instagram: `@multimarcasxenon`; 
cartão digital: https://cartao-digital.com/xenonmultimarcas/;
localização compartilhada no Maps: https://share.google/2ecURySgI5GrRgYwr.
* **Responsável pela organização:** **Nome: Willian Soares Carvalho, Numero de Telefone: 11 2585-4801**

### Relato da entrevista e observação presencial

* **Entrevistado e função:** William Soares Carvalho
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

**Justificativa de processos não incluídos:** o README não detalha compras/aquisição de veículos, fornecedores, avaliação de usados, despesas, comissões, seguros, documentação de entrada, cancelamento operacional nem manutenção preventiva/corretiva.

### Requisitos funcionais

RF01 — Gerenciamento de clientes

O sistema deve permitir cadastrar, consultar e atualizar clientes, armazenando nome (nm_cliente), CPF (nr_cpf), telefone (nr_telefone), e-mail (ds_email) e endereço (ds_endereco). Nome, CPF e telefone são obrigatórios, enquanto e-mail e endereço são opcionais. O CPF deve ser único.

RF02 — Gerenciamento de funcionários

O sistema deve permitir cadastrar, consultar e atualizar funcionários, armazenando nome (nm_funcionario), CPF (nr_cpf), telefone (nr_telefone) e cargo (ds_cargo). Todos os campos são obrigatórios, e o CPF não pode ser duplicado.

RF03 — Gerenciamento de veículos

O sistema deve permitir cadastrar, consultar e atualizar veículos, armazenando chassi (ds_chassi), marca (nm_marca), modelo (nm_modelo), ano (nr_ano), preço (vl_preco), tipo (tp_veiculo) e situação (st_veiculo). O chassi deve ser único e o preço deve ser positivo. A situação deve aceitar apenas os valores: Disponível, Vendido, Reservado e Em Manutenção.

RF04 — Gerenciamento de bancos

O sistema deve permitir cadastrar e consultar instituições bancárias, armazenando nome (nm_banco), CNPJ (nr_cnpj) e telefone (nr_telefone). O nome e o CNPJ são obrigatórios, e o CNPJ deve ser único.

RF05 — Registro e gerenciamento de vendas

O sistema deve permitir registrar e consultar vendas, armazenando data (dt_venda), valor total (vl_total), forma de pagamento (ds_forma_pagamento) e situação (st_venda). Cada venda deve estar obrigatoriamente vinculada a um cliente, um funcionário e um veículo cadastrados. O sistema deve permitir acompanhar as vendas nos estados Pendente, Aprovada, Concluída e Cancelada.

RF06 — Gerenciamento de financiamentos

O sistema deve permitir registrar e consultar financiamentos vinculados às vendas, armazenando banco responsável (id_banco), venda associada (id_venda), valor financiado (vl_financiado), quantidade de parcelas (qt_parcelas), valor da parcela (vl_parcela) e situação (st_financiamento). O financiamento deve estar associado a uma instituição bancária e a uma única venda, permitindo acompanhar os estados Em Análise, Aprovado, Recusado e Cancelado.

RF07 — Emissão e gerenciamento de pedidos de venda

O sistema deve permitir registrar e consultar pedidos de venda vinculados às vendas, armazenando data do pedido (dt_pedido), número da nota fiscal (nr_nota_fiscal), cartório (nm_cartorio) e situação (st_pedido). Cada venda poderá possuir, no máximo, um pedido, e cada pedido deverá pertencer a uma única venda.

RF08 — Gerenciamento de entregas

O sistema deve permitir registrar e consultar entregas vinculadas às vendas, armazenando data prevista (dt_prevista), data efetiva da entrega (dt_entrega), endereço de entrega (ds_endereco_entrega) e situação (st_entrega). O sistema deve permitir acompanhar as entregas nos estados Agendada, Em Preparação, Pronto para Retirada, Entregue e Cancelada.

RF09 — Consulta de veículos disponíveis e estoque

O sistema deve permitir consultar os veículos cadastrados, exibindo chassi, marca, modelo, ano, preço, tipo e situação. Deve possibilitar a visualização do estoque agrupado por situação, identificando veículos disponíveis, vendidos, reservados e em manutenção.

RF10 — Consulta do histórico comercial

O sistema deve disponibilizar uma consulta integrada das informações comerciais, permitindo localizar uma venda e visualizar os dados do cliente, funcionário, veículo, forma de pagamento, financiamento, banco, pedido de venda e entrega, quando existentes.

RF11 — Consultas gerenciais e indicadores

O sistema deve disponibilizar consultas gerenciais para acompanhar:
- Quantidade de vendas concluídas e faturamento.
- Ticket médio das vendas concluídas.
- Taxa de cancelamento de vendas.
- Quantidade de veículos por situação.
- Taxa de aprovação de financiamentos por banco.
- Tempo médio entre venda e entrega.
- Quantidade e valor total de vendas concluídas por funcionário.
- 
RF12 — Consultas de auditoria

O sistema deve permitir executar consultas para identificar inconsistências nos registros, incluindo vendas sem funcionário válido, vendas concluídas sem pedido associado e financiamentos vinculados a formas de pagamento incompatíveis.

### Requisitos não funcionais

RNF01 — Usabilidade

O sistema deve apresentar telas e consultas com nomenclatura clara, formulários objetivos e validação dos campos obrigatórios, facilitando a utilização pela equipe da concessionária.

RNF02 — Disponibilidade

Os dados e funcionalidades do sistema devem estar disponíveis durante o horário de funcionamento da concessionária, conforme a infraestrutura adotada.

RNF03 — Integridade dos dados

O banco de dados deve garantir a integridade das informações por meio de chaves primárias (PK), chaves estrangeiras (FK), restrições de obrigatoriedade (NOT NULL), unicidade (UNIQUE) e validações de domínio e valores (CHECK).

RNF04 — Segurança e privacidade

O sistema deve restringir o acesso às informações pessoais e comerciais conforme as permissões dos usuários, evitando a exposição desnecessária de CPF, telefone e endereço. Devem ser realizadas cópias de segurança periódicas, com política de acesso e recuperação definida pela organização.

RNF05 — Desempenho

As consultas de clientes, funcionários, veículos, vendas, financiamentos e entregas devem apresentar tempo de resposta adequado ao volume de dados e à infraestrutura da concessionária. Devem ser utilizados índices nas chaves primárias, estrangeiras e nos campos relevantes para pesquisa.

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

### Diagrama Entidade-Relacionamento (DER)
![Modelo DER Imagem](ModeloDER.png)
Link: https://app.brmodeloweb.com/publicview/6ab03281226d3f36496c6ecb
---
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

Aplicativo utilizado para fazer o DER: app.brmodeloweb.com

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

### Potencial de BI e IA

* **BI descritivo:** dashboards de vendas por mês, ticket médio, formas de pagamento, estoque por situação, financiamentos por banco e entregas por status.
* **BI diagnóstico:** comparar cancelamentos por forma de pagamento, identificar em qual etapa os pedidos ficam parados e observar diferenças de aprovação entre instituições financeiras.
* **Análise preditiva (futura):** após acumular histórico suficiente e validar qualidade dos dados, estimar demanda por categoria/modelo, sazonalidade de vendas e probabilidade de atraso de entrega. Os dados atuais não permitem prometer precisão nem treinar modelos robustos sem histórico real adequado.
* **Apoio à decisão:** recomendações de reposição/compra de veículos poderiam considerar giro por marca/modelo e tempo em estoque, mas a E1 não possui data de entrada no estoque; esse indicador depende de incluir esse atributo.
* **Manutenção:** análise de custo/frequência de manutenção depende da criação e alimentação da entidade MANUTENCAO, ainda pendente de levantamento.

### Rastreabilidade entre problemas/KPIs e consultas SQL

|Problema/KPI|Tabelas envolvidas|Consulta do script|
|-|-|-|
|P1 — organização e recuperação dos registros comerciais/comprovantes|CLIENTE, FUNCIONARIO, VEICULO, VENDA, FINANCIAMENTO, BANCO, PEDIDO\_DE\_VENDA, ENTREGA|G01 (histórico comercial integrado), G02 (vendas por período)|
|P2 — manutenção desorganizada|VEICULO e futura MANUTENCAO|**Não atendido pela versão atual.** Requer levantamento, tabela e consulta gerencial próprios.|
|KPI01 — quantidade de vendas concluídas|VENDA|G02|
|KPI02 — faturamento concluído|VENDA|G02|
|KPI03 — ticket médio|VENDA|G03|
|KPI04 — taxa de cancelamento|VENDA|G04|
|KPI05 — estoque por situação|VEICULO|G05|
|KPI06 — taxa de aprovação de financiamento|FINANCIAMENTO, BANCO|G06|
|KPI07 — tempo médio venda–entrega|VENDA, ENTREGA|G07|
|KPI08 — vendas por funcionário|FUNCIONARIO, VENDA|G08|

# 2\. Modelo Lógico Relacional

**Software previsto:** brModelo Web, conforme a notação solicitada no esqueleto. O README da E1 informa o uso do brModelo Web para o DER; a criação e exportação do modelo lógico desta etapa deve ser confirmada pelo grupo.

O diagrama lógico deve ser anexado como `diagramas/modelo\_logico.png` (ou PDF) e conter as tabelas, tipos, PKs, FKs e cardinalidades. Abaixo está a especificação para desenhá-lo:

```text
CLIENTE (1,1) —— (0,N) VENDA
FUNCIONARIO (1,1) —— (0,N) VENDA
VEICULO (0,1) —— (1,1) VENDA
BANCO (1,1) —— (0,N) FINANCIAMENTO
VENDA (0,1) —— (1,1) FINANCIAMENTO
VENDA (0,1) —— (1,1) PEDIDO\_DE\_VENDA
VENDA (0,1) —— (1,1) ENTREGA
```

A ligação ENTREGA está implementada por `id\_venda` no script-base, embora a descrição conceitual da E1 diga que Pedido gera Entrega. Para representar exatamente o relacionamento Pedido–Entrega, recomenda-se alterar a FK para `id\_pedido` em ENTREGA e revisar o DER; o grupo deve escolher uma única interpretação e mantê-la igual no diagrama, dicionário e SQL. A versão SQL entregue nesta proposta mantém `id\_venda` para seguir o dicionário preliminar da E1.

## 2.1 Esquema relacional e tipos

* `CLIENTE(id\_cliente PK, nm\_cliente, nr\_cpf UNIQUE, nr\_telefone, ds\_email, ds\_endereco)`
* `FUNCIONARIO(id\_funcionario PK, nm\_funcionario, nr\_cpf UNIQUE, nr\_telefone, ds\_cargo)`
* `VEICULO(id\_veiculo PK, ds\_chassi UNIQUE, nm\_marca, nm\_modelo, nr\_ano, vl\_preco, tp\_veiculo, st\_veiculo)`
* `VENDA(id\_venda PK, id\_cliente FK, id\_funcionario FK, id\_veiculo FK UNIQUE, dt\_venda, vl\_total, ds\_forma\_pagamento, st\_venda)`
* `BANCO(id\_banco PK, nm\_banco, nr\_cnpj UNIQUE, nr\_telefone)`
* `FINANCIAMENTO(id\_financiamento PK, id\_banco FK, id\_venda FK UNIQUE, vl\_financiado, qt\_parcelas, vl\_parcela, st\_financiamento)`
* `PEDIDO\_DE\_VENDA(id\_pedido PK, id\_venda FK UNIQUE, dt\_pedido, nr\_nota\_fiscal UNIQUE NULL, nm\_cartorio, st\_pedido)`
* `ENTREGA(id\_entrega PK, id\_venda FK UNIQUE, dt\_prevista, dt\_entrega NULL, ds\_endereco\_entrega, st\_entrega)`

# 3\. Script SQL Completo

Arquivo separado: [`docs/script.sql`](docs/script.sql). SGBD: MySQL 8.0 ou compatível. O script contém criação do banco/tabelas, constraints, massa fictícia, consultas JOIN, UPDATE, DELETE demonstrativo, consultas gerenciais G01–G08 e auditorias A01–A08.

# 4\. Massa de Dados

Arquivo: [`docs/script.sql`](docs/script.sql), na seção de `INSERT INTO`.

A massa proposta é inteiramente fictícia. Ela contém 8 clientes, 6 funcionários, 18 veículos, 3 bancos, 15 vendas, financiamentos para parte das vendas, pedidos e entregas em diferentes situações. O volume considera o porte informado na E1: seis funcionários e pelo menos quinze vendas mensais. Os registros são uma massa de teste representativa, não uma reprodução de dados reais nem uma série histórica de 15 vendas por mês. Para simular o volume anual com maior fidelidade, ampliar os registros após validar os dados observados com a organização.

A variedade contempla veículos disponíveis, vendidos, reservados e em manutenção; vendas pendentes, aprovadas, concluídas e canceladas; pagamentos à vista, PIX, cartão, financiamento e misto; financiamentos em análise, aprovados, recusados e cancelados; pedidos em processamento, aguardando emissão, faturados e cancelados; entregas agendadas, em preparação, prontas, entregues e canceladas; e cliente sem venda. Todos os dados pessoais e identificadores inseridos são fictícios e não devem ser confundidos com dados de clientes reais.

# 6\. Uso de Inteligência Artificial
### Uso 1 e 2 — revisão do DER, atributos e documentação

* **Ferramenta/etapa:** Gemini; revisão das conexões/cardinalidades do DER e apoio à documentação das entidades e relacionamentos.
* **Motivação:** prazo curto e necessidade de organizar o modelo e a documentação após dificuldades com uma organização inicialmente contatada.
* **Prompts registrados na E1:** (1) pedido para verificar conexões e relacionamentos do DER com base em imagem e PDF de exemplo de dicionário; (2) pedido para documentar entidades e relacionamentos com base na imagem e no PDF.
* **Resposta recebida:** apontamento de ajustes nas cardinalidades entre venda e cliente, veículo, funcionário e financiamento/banco; geração de texto de apoio para a documentação.
* **Fontes verificadas:** imagem do DER e PDF de exemplo anexados ao Gemini, conforme relato do grupo.
* **Correções/rejeições:** o grupo relata que analisou as sugestões e fez ajustes de documentação; não informou trechos específicos rejeitados.
* **Justificativa/reflexão:** as sugestões foram mantidas após discussão do grupo. A resposta da IA deve ser tratada como apoio, não como validação automática; cardinalidades e regras precisam ser conferidas com a organização e com as FKs implementadas.

### Uso 3 — listagem de entidades, atributos e restrições

* **Ferramenta/etapa:** Gemini; documentação de entidades, atributos, classificações, relacionamentos e políticas organizacionais.
* **Motivação:** reduzir o tempo de organização da documentação e facilitar o entendimento do modelo.
* **Prompt registrado na E1:** pedido para listar e justificar entidades/atributos, classificar atributos, explicar relacionamentos e restrições a partir da conversa e do DER.
* **Resposta recebida:** estrutura organizada com entidades, atributos, relacionamentos e restrições.
* **Fontes verificadas:** conversa anterior, imagem do DER e PDF anexado, conforme relato do grupo.
* **Correções/rejeições:** o grupo relata ajustes de apresentação e entendimento; não especifica trechos rejeitados.
* **Justificativa/reflexão:** o conteúdo foi aproveitado após análise coletiva. A documentação precisa manter consistência entre DER, dicionário, modelo lógico e script.

### Uso 4 — geração da massa de dados

* **Ferramenta/etapa:** Gemini; criação de comandos `INSERT INTO` para a massa fictícia.
* **Motivação:** agilizar a criação de dados de teste e evitar repetição manual.
* **Prompt registrado na E1:** solicitação de massa fictícia para MySQL com tabelas Cliente, Funcionario, Veiculo, Banco, Venda, Financiamento, Pedido\_de\_venda e Entrega, contemplando 5 clientes, 3 funcionários, veículos em estoque e vendidos e cenários variados.
* **Resposta recebida:** blocos de INSERT separados por tabela, com referências de chaves estrangeiras alinhadas.
* **Fontes verificadas:** grupo relata conferência com DER e modelo lógico, incluindo campos obrigatórios e restrições UNIQUE/NOT NULL.
* **Correções/rejeições:** ajuste manual das datas para manter cronologia coerente.
* **Justificativa/reflexão:** a geração reduziu trabalho repetitivo, mas os dados fictícios devem ser conferidos quanto a integridade, volume e variedade. A E1 informa seis funcionários; a massa desta proposta usa seis, em vez dos três citados no prompt original, para alinhar ao porte descrito.

### Uso 5 — Apoio na criação e estruturação do script.sql

- **Ferramenta/etapa:** Gemini; auxílio pontual na escrita de comandos DDL (criação de tabelas e restrições), comandos de manipulação e consultas SQL mais elaboradas (`JOIN` e funções de agregação) para o banco de dados da Xenon Multimarcas.
- **Motivação:** Como infelizmente nós não temos uma conhecimento tão avançado sobre SQL, recorremos à IA para ajudar a traduzir o modelo lógico e o dicionário de dados em um script funcional, garantindo que as tabelas e os relacionamentos fizessem sentido prático, e  nos apoiar na criação nós dando uma base.
- **Prompt registrado:** Pedimos ajuda para estruturar o código SQL completo da concessionária — incluindo a criação das tabelas, a massa de dados inicial, os comandos de teste (`UPDATE`/`DELETE`) e todas as consultas gerenciais (G01 a G08) e de auditoria (A01 a A03) exigidas pelo projeto.
- **Resposta recebida:** Um script SQL unificado com a estrutura das tabelas montada, blocos de inserção de dados e as consultas prontas cruzando as tabelas com `JOIN`.
- **Fontes verificadas:** Passamos o código linha por linha conferindo com o nosso modelo lógico, com o dicionário de dados e com as regras de negócio descritas no README para garantir que nenhuma restrição ficasse de fora.
- **Correções/rejeições:** Fizemos ajustes manuais importantes, como mudar a ordem de criação das tabelas (para evitar erros de chave estrangeira na hora de rodar), corrigir nomes de colunas que vieram diferentes e alinhar as datas dos testes para que a cronologia das vendas fizesse sentido.
- **Justificativa/reflexão:** Ter essa ajuda da IA ajudou demais a não nos deixar travado a parte prática sem travamentos de sintaxe, acelerando o trabalho da equipe. No entanto, deu para perceber que a IA às vezes cria estruturas genéricas; por isso, a revisão humana foi indispensável para adaptar o código exatamente à realidade da empresa.
