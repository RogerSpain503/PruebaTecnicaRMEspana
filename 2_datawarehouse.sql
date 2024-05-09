/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     8/5/2024 13:09:14                            */
/*==============================================================*/


/*==============================================================*/
/* Table: ORDENES                                               */
/*==============================================================*/
create table ORDENES (
   ID_ORDEN             varchar(32)          not null,
   ID_CLIENTE           varchar(32)          null,
   ESTATUS              varchar(9)           null,
   FECHA_DE_COMPRA      datetime             null,
   FECHA_DE_APROBACION  datetime             null,
   FECHA_ENTREGA_TRANSPORTISTA datetime             null,
   FECHA_ENTREGA_CLIENTE datetime             null,
   FECHA_ENTREGA_ESTIMADA datetime             null,
   FECHA_CARGA_DW       datetime             null,
   constraint PK_ORDENES primary key (ID_ORDEN)
)
go

/*==============================================================*/
/* Table: ITEMS_ORDEN                                           */
/*==============================================================*/
create table ITEMS_ORDEN (
   ID_ITEM_ORDEN        int                  not null,
   ID_ORDEN             varchar(32)          null,
   ID_PRODUCTO          varchar(32)          null,
   CATEGORIA_PRODUCTO   datetime             null,
   PRECIO               decimal(8,2)         null,
   FECHA_CARGA_DW       datetime             null,
   constraint PK_ITEMS_ORDEN primary key (ID_ITEM_ORDEN)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/


create nonclustered index RELATIONSHIP_1_FK on ITEMS_ORDEN (ID_ORDEN ASC)
go

alter table ITEMS_ORDEN
   add constraint FK_ITEMS_OR_RELATIONS_ORDENES foreign key (ID_ORDEN)
      references ORDENES (ID_ORDEN)
go

