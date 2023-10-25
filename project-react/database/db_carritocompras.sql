/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     24/10/2023 09:07:44 p. m.                    */
/*==============================================================*/


drop table if exists DISTRIBUCION;

drop table if exists LISTA_COMPRAS;

drop table if exists LISTA_PRODUCTO;

drop table if exists PRODUCTO;

drop table if exists PROVEEDOR;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION
(
   IDPROVEEDOR          numeric(10,0) not null,
   IDPRODUCTO           numeric(7,0) not null,
   primary key (IDPROVEEDOR, IDPRODUCTO)
);

/*==============================================================*/
/* Table: LISTA_COMPRAS                                         */
/*==============================================================*/
create table LISTA_COMPRAS
(
   IDLISTA              numeric(7,0) not null,
   IDUSUARIO            numeric(10,0),
   FECHA_LISTA          date not null,
   NOMBRE_LISTA         varchar(15) not null,
   primary key (IDLISTA)
);

/*==============================================================*/
/* Table: LISTA_PRODUCTO                                        */
/*==============================================================*/
create table LISTA_PRODUCTO
(
   IDLISTA              numeric(7,0) not null,
   IDPRODUCTO           numeric(7,0) not null,
   ESTADO               varchar(10) not null,
   primary key (IDLISTA, IDPRODUCTO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   IDPRODUCTO           numeric(7,0) not null,
   NOMBRE_PRODUCTO      varchar(20) not null,
   PRECIO               numeric(6,0) not null,
   FECHA_FABRICACION    date not null,
   primary key (IDPRODUCTO)
);

/*==============================================================*/
/* Table: PROVEEDOR                                             */
/*==============================================================*/
create table PROVEEDOR
(
   IDPROVEEDOR          numeric(10,0) not null,
   NOMBRE_PROVEEDOR     varchar(20) not null,
   primary key (IDPROVEEDOR)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   IDUSUARIO            numeric(10,0) not null,
   NOMBRE_USUARIO       varchar(30) not null,
   CLAVE                varchar(15) not null,
   USERNAME             varchar(10) not null,
   primary key (IDUSUARIO)
);

alter table DISTRIBUCION add constraint FK_DISTRIBUCION foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table DISTRIBUCION add constraint FK_DISTRIBUCION2 foreign key (IDPROVEEDOR)
      references PROVEEDOR (IDPROVEEDOR) on delete restrict on update restrict;

alter table LISTA_COMPRAS add constraint FK_TIENE foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table LISTA_PRODUCTO add constraint FK_LISTA_PRODUCTO foreign key (IDPRODUCTO)
      references PRODUCTO (IDPRODUCTO) on delete restrict on update restrict;

alter table LISTA_PRODUCTO add constraint FK_LISTA_PRODUCTO2 foreign key (IDLISTA)
      references LISTA_COMPRAS (IDLISTA) on delete restrict on update restrict;

