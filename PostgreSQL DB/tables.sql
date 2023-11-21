CREATE TABLE "dim_vendedor"(
    "codigo_vendedor" BIGINT NOT NULL,
    "nome_vendedor" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_vendedor" ADD PRIMARY KEY("codigo_vendedor");
CREATE TABLE "dim_familia_produtos"(
    "codigo_familia" VARCHAR(255) NOT NULL,
    "descricaofamilia" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_familia_produtos" ADD PRIMARY KEY("codigo_familia");
CREATE TABLE "fato_vendas"(
    "codigo_contrato" VARCHAR(255) NOT NULL,
    "data_venda" DATE NOT NULL,
    "codigo_produto" BIGINT NOT NULL,
    "filial_venda" BIGINT NULL,
    "quantidade" BIGINT NOT NULL,
    "valor_monetario_total" DECIMAL(8, 2) NOT NULL,
    "valor_desconto" DECIMAL(8, 2) NULL,
    "codigo_vendedor" BIGINT NULL,
    "codigo_cliente" BIGINT NULL
);
CREATE TABLE "dim_produto"(
    "codigo_produto" BIGINT NOT NULL,
    "descricaoproduto" VARCHAR(255) NOT NULL,
    "codigo_familia" VARCHAR(255) NULL,
    "preco_venda_unitario" DECIMAL(8, 2) NOT NULL,
    "custo_produto_unitario" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "dim_produto" ADD PRIMARY KEY("codigo_produto");
ALTER TABLE
    "fato_vendas" ADD CONSTRAINT "fato_vendas_codigo_vendedor_foreign" FOREIGN KEY("codigo_vendedor") REFERENCES "dim_vendedor"("codigo_vendedor");
ALTER TABLE
    "dim_produto" ADD CONSTRAINT "dim_produto_codigo_familia_foreign" FOREIGN KEY("codigo_familia") REFERENCES "dim_familia_produtos"("codigo_familia");
ALTER TABLE
    "fato_vendas" ADD CONSTRAINT "fato_vendas_codigo_produto_foreign" FOREIGN KEY("codigo_produto") REFERENCES "dim_produto"("codigo_produto");