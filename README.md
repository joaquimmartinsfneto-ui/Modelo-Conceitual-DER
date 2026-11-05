# Entrega 1 — Modelo Conceitual (DER)
### Modelagem de um sistema de gestão de informações para uma organização de pequeno porte

---

## Metadados 📈

Integrantes: 

- Joaquim Martins Ferreira Neto RGM: 47609630
- Gabriel Cabrera Conceição RGM: 47657499 
- Guilherme Reis RGM: 47513438
- Gabriel Franco RGM: 47451289

![Modelo Entidade-Relacionamento](ImagemDoGrupo.jpeg)

## 1. Caracterização da Organização 

- **Nome e natureza da organização:**  Xenon multimarcas (Concenssionaria )
- **Contexto e porte:** Com fins lucrativos, Uma empresa com micro operações que realiza no mínimo de 15 venda ao mês, com uma quantidade de 6 funcionarios no total atual podendo aumentar futuramente.  
- **Problemas e necessidades identificados:** Falta de organização e comprovante de transações, manutenções não organizadas.
- **Justificativa da escolha:** Um de nossos integrantes do grupo identificou a necessidade da empresa e notou que encaixaria perfeitamente no trabalho solicitado, consideramos o fato dessa área ter bastante movimentação
- **Evidências da organização:** instagram: @multimarcasxenon
- Cartão digital da empresa: https://cartao-digital.com/xenonmultimarcas/
- local do Maps: https://share.google/2ecURySgI5GrRgYwr

---

## 2. Processos de Negócio 

- **Principais processos mapeados:** Cadastro de clientes, cadastro e controle de veículos, registro de pedidos de vendas, gerenciamento de vendas, controle de financiamento, gerenciamento de entregas, organização dos registros comerciais.

---

## 3. Requisitos do Sistema 

- RF01 – Gerenciamento de Clientes
- D: O sistema deve permitir o cadastro, alteração e armazenamento de clientes, registrando obrigatoriamente o nome completo, o CPF e o telefone, além dos dados opcionais de endereço e e-mail

- **RF02 - Gerenciamento de Veiculo**
- D: O sistema deve registrar e manter os dados dos colaboradores da concessionária, armazenando obrigatoriamente o nome completo, o CPF, o telefone de contato e o cargo exercido

- **RF03 – Gerenciamento de Funcionários**
- D: O sistema deve registrar e manter os dados dos colaboradores da concessionária, armazenando obrigatoriamente o nome completo, o CPF, o telefone de contato e o cargo exercido   
- **RF04 – Registro de Vendas e Formas de Pagamento**
- D: O sistema deve permitir registrar as transações comerciais de venda, associando o cliente comprador, o funcionário responsável e o veículo comercializado, registrando a data da venda, o valor total e a forma de pagamento utilizada

- **RF05 – Gestão de Financiamentos** 
- D: O sistema deve permitir vincular um financiamento à venda quando aplicável, registrando a instituição financeira parceira, o valor financiado, a quantidade de parcelas, o valor da parcela e o status da aprovação de crédito pelo banco.

- **RF06 – Pedido de Venda**
- D: O sistema deve gerar um "Pedido de Venda" formal vinculado à transação comercial após a aprovação do financiamento (ou confirmação da compra), registrando a identificação do pedido, a data de emissão, o número da nota fiscal, o nome do cartório para trâmites legais e o status atual do pedido.

### 3.1 Requisitos Funcionais 
O sistema devera permetir a realização de vendas e a verificação de veiculos disponiveis na concenssionaria, tambêm tera que ter informações sobre a situação da venda e da entrega para a notificação a o cliente e para a organização da organização.

### 3.2 Requisitos Não Funcionais
Os requisitos não funcionais que nos averiguamos foram: Usabilidade e disponibilidade.

---

## 4. Regras de Negócio 

- **Regras operacionais:** Um pedido só pode ser feito se houver estoque, em caso de financiamento só pode haver pedido se o banco aprovar.
Um pedido só pode ser feito se as informações do veículo estiver certas.

- **Restrições organizacionais:** Um pedido só pode ser feito se as informações do veículo estiver certas
---

## 5. Dicionário de Dados Conceitual (Preliminar) 

| Atributo | Descrição | Regra de negócio associada |


##                  CLIENTE

| **id_cliente** | Identificador único do cliente | PK, obrigatório e exclusivo para cada cliente cadastrado. |

| **nm_cliente** | Nome completo do cliente seja civil ou social | Obrigatório para identificação do cliente, devendo conter ao menos nome e sobrenome. |

| **nr_cpf** | Cadastro de pessoa física do cliente | Obrigatório, deve ser único para cada cliente e possuir formato válido com 11 dígitos numéricos. |

| **nr_telefone** | Telefone principal de contato ou WhatsApp do cliente | Obrigatório, deve conter DDD e número telefônico válido. |

| **ds_email** | Endereço eletrônico de contato do cliente | Opcional, quando preenchido deve possuir formato sintático de e-mail válido (ex: usuario@dominio.com). |

| **ds_endereco** | Endereço residencial completo do cliente | Opcional, texto livre contendo logradouro, número, bairro, cidade, UF e CEP. |


##                FUNCIONARIO

| **id_funcionario** | Identificador único do funcionário | PK, obrigatório e exclusivo para cada colaborador cadastrado no sistema. |

| **nm_funcionario** | Nome completo do funcionário ou vendedor | Obrigatório para qualificação e identificação nas vendas e comissões. |

| **nr_cpf** | Cadastro de pessoa física do funcionário | Obrigatório, único para cada colaborador e com validação de 11 dígitos numéricos. |

| **ds_cargo** | Cargo ou função ocupada pelo colaborador na empresa | Obrigatório, define a função exercida (ex: Vendedor, Gerente) e nível de acesso. |

| **nr_telefone** | Telefone de contato do funcionário | Obrigatório, deve incluir o código de área (DDD) e o número de telefone. |


##                  VEICULO

| **id_veiculo** | Identificador único do veículo no sistema | PK, obrigatório, numérico inteiro gerado automaticamente pelo sistema, exclusivo para cada veículo. |

| **ds_chassi** | Número de identificação do veículo (VIN/Chassi) | Obrigatório, deve ser único para cada veículo e possuir exatamente 17 caracteres alfanuméricos válidos. |

| **nm_marca** | Marca ou fabricante do veículo | Obrigatório, texto simples que identifica a fabricante (ex: Chevrolet, Volkswagen). |

| **nm_modelo** | Modelo comercial do veículo | Obrigatório, texto simples que identifica o modelo do automóvel (ex: Onix, Gol). |

| **nr_ano** | Ano de fabricação e/ou modelo do veículo | Obrigatório, valor numérico de 4 dígitos, devendo ser superior a 1900 e menor ou igual ao ano subsequente ao atual. |

| **vl_preco**. | Valor estipulado para venda do veículo | Obrigatório, valor decimal estritamente positivo (maior que zero). |

| **tp_veiculo** | Tipo ou categoria de carroceria do veículo | Opcional, classificação interna do automóvel (ex: Hatch, Sedan, SUV, Pickup). |

| **st_veiculo** | Situação atual da disponibilidade do veículo em estoque | Obrigatório, valores possíveis restritos ao domínio: 'Disponível', 'Vendido', 'Reservado', 'Em Manutenção'. |


##                   VENDA

| **id_venda** | Identificador único da transação de venda | PK, obrigatório e exclusivo para cada registro de venda efetuado. |

| **id_cliente** | Referência ao cliente comprador da venda | FK, obrigatório, deve corresponder a um id_cliente válido e ativo na tabela CLIENTE (relacionamento 1:N). |

| **id_funcionario** | Referência ao funcionário responsável pela venda | FK, obrigatório, deve corresponder a um id_funcionario válido na tabela FUNCIONARIO (relacionamento 1:N). |

| **id_veiculo** | Referência ao veículo comercializado na venda | FK, obrigatório e único para vendas ativas, devendo corresponder a um id_veiculo válido em VEICULO (relacionamento 1:1). |

| **dt_venda** | Data e horário em que a venda foi efetuada | Obrigatório, preenchido automaticamente com a data e hora do sistema; não aceita datas futuras. |

| **vl_total** | Valor total fechado da negociação | Obrigatório, deve ser um valor numérico decimal maior que zero. |

| **ds_forma_pagamento** | Modalidade utilizada para quitação do valor da venda | Obrigatório, valores possíveis restritos a: 'À Vista', 'Financiamento', 'Cartão de Crédito', 'PIX', 'Misto'. |

| **st_venda** | Situação do andamento e fechamento da venda | Obrigatório, valores possíveis restritos a: 'Pendente', 'Aprovada', 'Concluída', 'Cancelada'. |


##                   BANCO

| **id_banco** | Identificador único da instituição financeira | PK, obrigatório e exclusivo para cada banco/financeira parceira. |

| **nm_banco** | Nome comercial ou razão social da instituição financeira | Obrigatório, texto simples contendo a identificação do banco. |

| **nr_cnpj** | Cadastro Nacional da Pessoa Jurídica do banco | Obrigatório, único para cada banco e deve possuir formato válido com 14 dígitos numéricos. |

| **nr_telefone** | Telefone de contato da central ou mesa de crédito do banco | Opcional, deve conter o DDD e número telefônico. |


##                 FINANCIAMENTO

| **id_financiamento** | Identificador único do contrato de financiamento | PK, obrigatório e exclusivo para cada proposta ou contrato de financiamento. |

| **id_banco** | Referência ao banco concessor do financiamento | FK, obrigatório, deve corresponder a um id_banco válido na tabela BANCO (relacionamento 1:N). |

| **id_venda** | Referência à venda vinculada ao financiamento | FK, obrigatório e único, deve corresponder a um id_venda válido na tabela VENDA (relacionamento 1:1 opcional). |

| **vl_financiado** | Valor total contratado e financiado pelo banco | Obrigatório, deve ser um valor decimal estritamente positivo (maior que zero). |

| **qt_parcelas** | Quantidade total de parcelas acertadas no contrato | Obrigatório, valor inteiro positivo (ex: 12, 24, 36, 48, 60). |

| **vl_parcela** | Valor cobrado em cada parcela mensal | Obrigatório, deve ser um valor decimal estritamente positivo. |

| **st_financiamento** | Status da análise de crédito e concessão do financiamento | Obrigatório, valores possíveis restritos a: 'Em Análise', 'Aprovado', 'Recusado', 'Cancelado'. |


##               PEDIDO_DE_VENDA

| **id_pedido** | Identificador único do pedido burocrático de venda | PK, obrigatório e exclusivo para cada pedido emitido. |

| **id_venda** | Referência à venda correspondente ao pedido | FK, obrigatório, deve corresponder a um id_venda válido na tabela VENDA. |

| **dt_pedido** | Data de criação e processamento do pedido | Obrigatório, preenchido automaticamente com a data corrente no momento do faturamento. |

| **nr_nota_fiscal** | Número do documento fiscal (NF-e) emitido | Opcional, preenchido obrigatoriamente após a emissão do faturamento fiscal do veículo. |

| **nm_cartorio** | Nome do cartório responsável pelos trâmites de transferência | Opcional, texto livre indicando a serventia extrajudicial para reconhecimento de firma e CRV. |

| **st_pedido** | Situação do andamento burocrático do pedido | Obrigatório, valores possíveis restritos a: 'Em Processamento', 'Aguardando Emissão', 'Faturado', 'Cancelado'. |


##                  ENTREGA 

| **id_entrega** | Identificador único da logística de entrega | PK, obrigatório e exclusivo para cada agendamento de entrega. |

| **id_venda** | Referência à venda correspondente à entrega | FK, obrigatório, deve corresponder a um id_venda válido na tabela VENDA. |

| **dt_prevista** | Data agendada para entrega ou retirada do veículo | Obrigatório, deve ser uma data igual ou posterior à data do pedido de venda. |

| **dt_entrega** | Data e hora em que o veículo foi efetivamente entregue | Opcional, preenchido no momento em que a entrega é finalizada com sucesso. |

| **ds_endereco_entrega** | Endereço estipulado para entrega física do veículo | Opcional, texto livre especificando o local da entrega ou concessionária. |

| **st_entrega** | Estado de progresso do fluxo logístico | Obrigatório, valores possíveis restritos a: 'Agendada', 'Em Preparação', 'Pronto para Retirada', 'Entregue', 'Cancelada'. |


---

## 6. Modelagem Conceitual (Entidades, Atributos, Relacionamentos)

- **Entidades reconhecidas:** 

    **VEICULO:** Representa os automóveis em estoque disponíveis para comercialização na concessionária. Justifica-se pela necessidade de rastrear histórico de preços, características físicas e status de disponibilidade.
   
    **CLIENTE:** Representa a pessoa física que adquire veículos ou solicita propostas comerciais. Sua manutenção é essencial para a emissão de contratos, faturamento e cumprimento das exigências contratuais
    
    **FUNCIONARIO:** Representa o colaborador/vendedor responsável pelo atendimento ao cliente e intermediação da venda. Justifica-se para fins de controle de comissões, 
    auditoria de processos e auditoria interna de acesso

    **VENDA:** Entidade central da aplicação que registra a transação comercial. Conecta o cliente, o vendedor e o veículo comercializado em uma data e valor específicos
   
    **BANCO:** Representa as instituições financeiras parceiras que concedem crédito para as operações de financiamento. É necessária para o controle de propostas enviadas e parceiros comerciais.

    **FINANCIAMENTO:** Representa o contrato de crédito aprovado por um banco para viabilizar uma venda. Justifica-se para controle de taxas, parcelamento e aprovação de crédito

    **PEDIDO DE VENDA**: Representa o trâmite documental e fiscal decorrente do fechamento da venda. Justifica-se pela necessidade de registrar a emissão de Nota Fiscal Eletrônica e processos de cartório para transferência de propriedade.

    **ENTREGA:** Representa a etapa logística de transferência de posse do veículo ao cliente. Justifica-se para agendamento, controle de datas de liberação e local de entrega.

- **Atributos e classificações:** 

    **VEICULO:**
      PK: id_veiculo
      atributos Simples / Obrigatórios: ds_chassi (único), nm_marca, nm_modelo, nr_ano, vl_preco, st_veiculo (domínio restrito)
      Atributos Opcionais: ds_cor, tp_veiculo

    **CLIENTE:**
      PK: id_cliente
      Atributos Simples / Obrigatórios: nm_cliente, nr_cpf (único), nr_telefone
      Atributos Opcionais: ds_email, ds_endereco

    **FUNCIONARIO:**
      PK: id_funcionario
      Atributos Simples / Obrigatórios: nm_funcionario, nr_cpf (único), ds_cargo, nr_telefone

    **VENDA:**
      PK: id_venda
      FK: id_cliente, id_funcionario, id_veiculo
      Atributos Simples / Obrigatórios: dt_venda, vl_total, ds_forma_pagamento, st_venda

    **BANCO**
      PK: id_banco
      Atributos Simples / Obrigatórios: nm_banco, nr_cnpj (único)
      Atributos Opcionais: nr_telefone

    **FINANCIAMENTO**
      PK: id_financiamento
      FK: id_banco, id_venda
      Atributos Simples / Obrigatórios: vl_financiado, qt_parcelas, vl_parcela, st_financiamento
      Atributos Opcionais: pc_taxa_juros

    **PEDIDO DE VENDA:**
      PK: id_pedido
      FK: id_venda
      Atributos Simples / Obrigatórios: dt_pedido, st_pedido
      Atributos Opcionais: nr_nota_fiscal, nm_cartorio

    **ENTREGA:**
      PK: id_entrega
      FK: id_venda
      Atributos Simples / Obrigatórios: dt_prevista, st_entrega
      Atributos Opcionais: dt_entrega, ds_endereco_entrega

- **Relacionamentos pertinentes:** 
    **Cliente realiza Venda:**
      Mapeamento: CLIENTE (1, 1) <---- realiza ----> (0, N) VENDA
      Descrição: Um cliente pode realizar várias vendas ao longo do tempo (0 a N), porém cada registro de venda pertence obrigatoriamente a um único cliente (1 para 1).

    **Funcionário realiza Venda:**
      Mapeamento: FUNCIONARIO (1, 1) <---- intermedia ----> (0, N) VENDA
      Descrição: Um colaborador pode atuar em diversas vendas (0 a N), mas cada venda é intermediada por apenas um funcionário responsável (1 para 1).

    **Venda envolve Veículo:**
      Mapeamento: VEICULO (0, 1) <---- envolve ----> (1, 1) VENDA
      Descrição: Toda venda registrada deve conter obrigatoriamente exatamente um veículo (1 para 1). Um veículo em estoque participa de no máximo uma venda ativa (0 a 1).

    **Venda possui Financiamento:**
      Mapeamento: VENDA (0, 1) <---- gera ----> (1, 1) FINANCIAMENTO
      Descrição: Uma venda pode ou não ser financiada (0 a 1, pois o pagamento pode ser à vista). Quando existe um financiamento, ele pertence a uma única venda específica (1 para 1).

    **Banco analisa Financiamento:**
      Mapeamento: BANCO (1, 1) <---- avalia ----> (0, N) FINANCIAMENTO
      Descrição: Um banco pode analisar e aprovar múltiplos financiamentos (0 a N), mas cada proposta de financiamento é vinculada a um único banco concessor (1 para 1).
    
    **Venda gera Pedido de Venda:**
      Mapeamento: VENDA (0, 1) <---- consolida ----> (1, 1) PEDIDO_DE_VENDA
      Descrição: Uma venda efetuada origina um pedido de venda formal (1 para 1), no qual serão vinculados os trâmites fiscais e cartorários.

    **Pedido gera Entrega:**
      Mapeamento: PEDIDO_DE_VENDA (0, 1) <---- origina ----> (1, 1) ENTREGA
      Descrição: Um pedido de venda gera o processo de agendamento e liberação logística para entrega do veículo ao cliente (1 para 1).
      
- **Restrições e políticas organizacionais aplicadas ao modelo.**

1. Unicidade e Validação Cadastral: O *nr_cpf* de **clientes** e **funcionários**, o *nr_cnpj* de **bancos** e o *ds_chassi* de veículos possuem restrição de integridade do tipo **UNIQUE**, impedindo a duplicação de cadastros no sistema

2. Exclusividade de Venda de Veículo: Um **veículo** cadastrado só pode estar associado a um único registro de venda com status concluído ou ativo. Seu atributo *st_veiculo* deve ser alterado obrigatoriamente para **'Vendido'** imediatamente após o fechamento da transação

3. Modalidade de Pagamento e Financiamento: A criação de um registro na entidade **FINANCIAMENTO** é condicional: só ocorre caso o atributo *ds_forma_pagamento* da entidade **VENDA** seja igual a *'Financiamento'* ou *'Misto'*.

4. Faturamento e Emissão de Documentação: A liberação da **ENTREGA** com status *'Entregue'* fica estritamente sujeita ao preenchimento do atributo *nr_nota_fiscal* na entidade **PEDIDO_DE_VENDA** e à aprovação prévia do financiamento (caso existente).

5. Datas Cronológicas Coerentes: A *dt_venda* não pode conter valores futuros em relação ao timestamp do servidor, e a dt_prevista da entrega deve ser igual ou posterior à *dt_venda*.

---

## 7. Diagrama Entidade-Relacionamento (DER)

![Modelo DER Imagem](ModeloDER.png)
Link: [https://app.brmodeloweb.com/publicview/6ab03281226d3f36496c6ecb](https://app.brmodeloweb.com/publicview/6ab03281226d3f36496c6ecb)

---

## 8. Justificativa Técnica

Para este projeto a gente buscou criar uma estrutura bem organizada e fácil de manter no futuro atendendo diretamente aos requisitos que a organização nos solicitou, a decisão de separar venda pedido de venda e entrega em tabelas diferentes foi justamente para cumprir essa exigencia e não sobrecarregar uma tabela só com muita informação misturada a venda cuida da parte comercial da negociação o pedido cuida da burocracia de nota fiscal e cartorio e a entrega cuida apenas da logística física de enviar ou liberar o veiculo, com isso a gente consegue acompanhar o avanço de cada etapa de forma independente conforme o fluxo do negócio exige a mesma ideia serviu para isolar o financiamento e os bancos atendendo a outra necessidade da empresa como nem todo cliente compra um carro financiado colocar esses campos direto na tabela de venda ia deixar um monte de dados em branco desnecessariamente criando uma estrutura propria para financiamento e mantendo o banco separado a gente evita dados repetidos cumpre os requisitos de integração com as financeiras e ainda consegue analisar quais instituições parceiras estão aprovando mais credito para a loja.

Na parte dos atributos a gente adotou uma nomenclatura bem padronizada usando prefixos simples antes de cada nome, que foi nos ensinado em uma aula de quinta-feira para seguir as boas praticas e padrões, alem disso vimos que realmente isso ajuda bastante a identificar na hora de consultar o que é texto o que é valor numérico e o que é data sem criar confusão,os relacionamentos foram pensados para garantir as regras reais que a organização utiliza no dia a dia, um cliente pode comprar vários carros com a empresa ao longo do tempo mas cada registro de venda vai pertencer sempre a um unico cliente, o mesmo vale para os vendedores onde um funcionário pode fechar varios negocios mas cada venda tem apenas um responsavel ja a relação entre o veiculo e a venda garante que cada contrato seja de apenas um carro e que um veiculo em estoque so possa ser vendido uma unica vez respeitando a regra do negocio e evitando qualquer tipo de venda duplicada, utilizamos essa entidades para uma facilidade de compreensão da equipe que utilizara o modelo, os atributos foram especialmente escolhidos tambem como necessidade da organização, que fez a solicitação restritamente desses atributos

---

## 9. Uso de Inteligência Artificial
 
| Item | O que registrar |

|------|------------------|

1 e 2 USO

| **Ferramenta e etapa** | Gemini, Utilização para ajudar e orientar na organização do modelo DER em relação aos Atributos, e na documentação.

| **Motivação** | Recorremos a IA, pois estavamos com um prazo curto para realizar esse trabalho, já que tivemos dificuldades com uma empresa passada que agendou a entrevista muito encima da hora da entrega do trabalho, utilizamos ela para nos ajudar a terminar o trabalho o mais rapido possivel e com qualidade. |

| **Prompt(s) utilizados** |

 **1 Prompt:** Gemini, com base nesse PDF (02-03g_Exemplo_Dicionario_Dados.pdf), e nessa imagem desse modelo DER (Arquivos Anexados no prompt), verifique se as conexões das entidades e seus relacionamentos estão adequados e corretos, caso tenha algum acrescimo ou algum erro nos relate, caso tenha alguma opinião sobre nos diga.

 **2 Prompt:** Gemini, com base na imagem desse modelo DER e no PDF (02-03g_Exemplo_Dicionario_Dados.pdf), nos ajude a documentar sobre as entidades e seus relacionamentos. |

| **Resposta recebida** | 1 Prompt: A IA nos notificou sobre um erro que tinha na cardinalidade entre vendas e clientes, venda e veiculols, venda e funcionarios, financiamento e banco, onde nos optamos por seguir a base dela que realmente nos averiguamos e era condizente com oque nos pensamos. 

2 Prompt: A IA nos deu a documentação inteira sobre as entidade e seus relacionamentos para utilizarmos no Dicionario Conceitual, nos ajudando a finalizar ele com mais rapidez, realizamos modificações. |

| **Fontes consultadas e verificadas** | Sim, ambos os Prompts tiveram o PDF e uma Imagem do modelo DER anexados, e ela relatou a utilização sobre eles. |

| **Trechos rejeitados ou corrigidos** | Nos não tivemos problemas ao ponto de necessitar de correções por parte da IA, o prompt foi bem elaborado e ela conseugiu trazer uma resposta condizente com oque precisavamos. |

| **Justificativa da escolha final** | Mantivemos oque a IA sugeriu, Apos uma analise em conjunto chegamos a conclusão que bateu com oque a organização necessitava. |

| **Reflexão crítica** | Não tivemos probelmas com a resposta da IA, já que conseguimos realizar um prompt que deu uma resposta que colidiu com oque a organização necesstiva. |

|------|------------------|

3 USO

| **Ferramenta e etapa** | Gemini, Utilização para a ajuda da documentação em relação a listagem de entidades e atributos, a atribuições e qualificações, relacionamentos pertinentes e as restrições e politicas organizacionais .

| **Motivação** | Recorremos a IA, pois estavamos com um prazo curto para realizar esse trabalho. |

| **Prompt(s) utilizados** |

 **Prompt:** Gemini, com base no prompt que pedi para você me ajudar com o modelo DER, agora me ajude a realizar uma listagem de: Entidades e atributos liste e justifique brevemente cada uma, Atributos e classificações quais atributos pertencem a cada entidade, Relacionamentos pertinentes como as entidades se conectam e Restrições e políticas organizacionais aplicadas ao modelo. 

| **Resposta recebida** | O Gemini nos deu toda a listagem de entidades reconhecidas, atributos e classificações, relacionamentos pertinentes e restrições politicas organizacionais aplicadas ao modelo, ele nos deu de maneira organizada e explicando de maneira simples que nos ajudou tambêm a estudar. |

| **Fontes consultadas e verificadas** | O Gemini demonstrou utilizar tanto das informações do chat que nos ficavamos conversando quanto da demonstração dos arquivos que foram anexados no chat, o PDF e a imagem do modelo. |

| **Trechos rejeitados ou corrigidos** | Nos não tivemos problemas ao ponto de necessitar de correções por parte da IA, o prompt foi bem elaborado e ela conseugiu trazer uma resposta condizente com oque precisavamos. |

| **Justificativa da escolha final** | Mantivemos oque a IA nos deu, Apos uma analise em conjunto chegamos a conclusão que bateu com oque a organização necessitava, no maximo fizemos modificações para melhorar o entendimento, marcando as entidades e os atributos. |

| **Reflexão crítica** | Não tivemos probelmas com a resposta da IA, já que conseguimos realizar um prompt que deu uma resposta que colidiu com oque a organização necesstiva. |

---

## Critérios Atitudinais (20%)
**Estes critérios NÃO constam explicitamente como item de entrega no README.** Eles são avaliados por meio de **Avaliação 360º entre os integrantes do grupo** (cada membro avalia os colegas de equipe) e, no caso da Colaboração, também pela **colaboração equilibrada no histórico de commits** do repositório GitHub — não pela leitura do restante do repositório nem pela apresentação:

- **Participação (5%):** envolvimento nas discussões técnicas e nas decisões do grupo.
- **Comprometimento (5%):** cumprimento de prazos e responsabilidades assumidas.
- **Colaboração (5%):** respeito às contribuições dos colegas, cooperação na construção do projeto e colaboração equilibrada no histórico de commits do repositório GitHub.
- **Autonomia (5%):** busca independente de soluções e proposta de melhorias.

---

## Resumo dos Pesos

| Dimensão | Peso total |
|----------|-----------|
| Conceitual (contexto, requisitos/regras, modelagem, justificativa técnica) | 30% |
| Procedimental (requisitos, fluxogramas, dicionário de dados, DER) | 50% |
| Atitudinal (participação, comprometimento, colaboração, autonomia) | 20% |

**Entrega final:** README.md completo + DER + Dicionário de Dados em HTML (com exceção dos cursos GTI) anexado no repositório GitHub do grupo.
