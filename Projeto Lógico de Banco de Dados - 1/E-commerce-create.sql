-- criação do banco de dados para o cenário de E-commerce

create database	ecommerce; 

 use ecommerce; 

-- criar tabela cliente
create table clients (
       idClient int identity primary key,
	   Fname varchar(10),
	   Minit char(3),
	   Lname varchar(20),
	   CPF char(11) not null,
	   Endereco varchar(30),
	   constraint unique_cpf_client unique(CPF)
);

-- criar tabela produto 

create table product (
       idProduct int identity primary key,
	   Pname varchar(10) not null,
	   classification_kids bit,
	   category varchar (30) check(category in ('Eletronico', 'Vestimenta', 'brinquedo', 'Alimentos', 'Móveis')) not null,
	   avaliacao float default 0,
	   size varchar(10),
	   );
	   
-- criar tabela de pagamento

create table payments (
  idclient int,
  idPayment int,
  typePayment varchar (20) check(typePayment in ('Boleto', 'Cartão', 'Dois cartões')),
  limitAvailable float,
  primary key (idclient,idPayment)

);

-- criar tabela pedido

create table orders ( 
  idOrder int identity primary key,
  idOrderClient int,
  orderStatus  varchar (30) check(orderStatus in ('Cancelado', 'Confirmado', 'Em processamento')) not null,
  orderDescription varchar(255),
  sendValue float default 10,
  paymentsCash bit default 0,
  constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)

);