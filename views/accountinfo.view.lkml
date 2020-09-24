view: accountinfo {
  sql_table_name: dbo.Accountinfo ;;
  drill_fields: [id]



  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: accounttype {
    type: string
    sql: ${TABLE}.Accounttype ;;
  }

  measure: count {
    type: count
    drill_fields: [id, currentaccountinfo.count]
  }
}
