view: orderbreakdown {
  sql_table_name: dbo.Orderbreakdown ;;

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.OrderId ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}.Subcategory ;;
  }

  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
