/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2017                    */
/* Created on:     8/5/2024 11:54:58                            */
/*==============================================================*/

/*==============================================================*/
/* Table: ORDERS_STAGE                                          */
/*==============================================================*/
create table ORDERS_STAGE (
   ORDER_ID             varchar(32)          not null,
   CUSTOMER_ID          varchar(32)          null,
   ORDER_STATUS         varchar(9)           null,
   ORDER_PURCHASE_TIMESTAMP datetime             null,
   ORDER_APPROVED_AT    datetime             null,
   ORDER_DELIVERED_CARRIER_DATE datetime             null,
   ORDER_DELIVERED_CUSTOMER_DATE datetime             null,
   ORDER_ESTIMATED_DELIVERY_DATE datetime             null,
   constraint PK_ORDERS_STAGE primary key (ORDER_ID)
)
go

/*==============================================================*/
/* Table: ORDER_ITEMS_STAGE                                     */
/*==============================================================*/
create table ORDER_ITEMS_STAGE (
   ORDER_ITEM_ID        int                  not null,
   PRODUCT_ID          varchar(32)          null,
   ORDER_ID             varchar(32)          null,
   SELLER_ID            varchar(32)          null,
   SHIPPING_LIMIT_DATE  datetime             null,
   PRICE                decimal(8,2)         null,
   FREIGHT_VALUE        decimal(8,2)         null,
   constraint PK_ORDER_ITEMS_STAGE primary key (ORDER_ITEM_ID)
)
go

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/


create nonclustered index RELATIONSHIP_1_FK on ORDER_ITEMS_STAGE (PRODUCTO_ID ASC)
go

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/


create nonclustered index RELATIONSHIP_2_FK on ORDER_ITEMS_STAGE (ORDER_ID ASC)
go

/*==============================================================*/
/* Table: PRODUCTS_STAGE                                        */
/*==============================================================*/
create table PRODUCTS_STAGE (
   PRODUCT_ID          varchar(32)          not null,
   PRODUCT_CATEGORY_NAME varchar(50)          null,
   PRODUCT_NAME_LENGHT  int                  null,
   PRODUCT_DESCRIPTION_LENGHT int                  null,
   PRODUCT_PHOTOS_QTY   int                  null,
   PRODUCT_WEIGHT_G     int                  null,
   PRODUCT_LENGTH_CM    int                  null,
   PRODUCT_HEIGHT_CM    int                  null,
   PRODUCT_WIDTH_CM     int                  null,
   constraint PK_PRODUCTS_STAGE primary key (PRODUCT_ID)
)
go

alter table ORDER_ITEMS_STAGE
   add constraint FK_ORDER_IT_RELATIONS_PRODUCTS foreign key (PRODUCT_ID)
      references PRODUCTS_STAGE (PRODUCT_ID)
go

alter table ORDER_ITEMS_STAGE
   add constraint FK_ORDER_IT_RELATIONS_ORDERS_S foreign key (ORDER_ID)
      references ORDERS_STAGE (ORDER_ID)
go

