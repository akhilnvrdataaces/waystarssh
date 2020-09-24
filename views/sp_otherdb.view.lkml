view: sp_otherdb {

  parameter: categoryparam {
    type: unquoted

    suggestable: yes
    suggest_explore: salesview
    suggest_dimension: category
    full_suggestions: yes

  }


  parameter: subcategoryparam {
    type: unquoted

    suggestable: yes
    suggest_explore: salesview
    suggest_dimension: subcategory
    full_suggestions: yes

  }

  derived_table: {

    datagroup_trigger:demo_sql_new_default_datagroup
    create_process: {
      sql_step:

          CREATE TABLE ${SQL_TABLE_NAME} (
                         orderid nvarchar(100),customer nvarchar(100),orderdate nvarchar(100),
                        country nvarchar(100),state nvarchar(100),productname nvarchar(100),
                        category nvarchar(100),subcategory nvarchar(100),sales int,quantity int



                       ) ;;
      sql_step: INSERT INTO ${SQL_TABLE_NAME}(orderid,customer ,orderdate,country,state,productname
                     , category,subcategory,sales,quantity)
                       exec SalesProcwithparam @category={% parameter categoryparam %} ,@subcategory={% parameter subcategoryparam %}
                         ;;
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orderid {
    type: string
    sql: ${TABLE}.Orderid ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.Customer ;;
  }

  dimension: orderdate {
    type: string
    sql: ${TABLE}.orderdate ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.Country ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: productname {
    type: string
    sql: ${TABLE}.Productname ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  set: detail {
    fields: [
      orderid,
      customer,
      orderdate,
      country,
      state,
      productname,
      category,
      subcategory,
      sales,
      quantity
    ]
  }
}
