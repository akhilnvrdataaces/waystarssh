view: sql_runner_query {
  derived_table: {
    sql: EXEC TEST_DB_LKR.dbo.SalesProcwithparam @category='Technology',@subcategory ='Accessories'
      ;;
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
