view: accountinfofromotherdb {
  sql_table_name: {%parameter databaseparam%}.dbo.Accountinfo  ;;


  parameter:databaseparam {
    type: unquoted
    allowed_value: {
      label: "TEST_DB_LKR"
      value: "TEST_DB_LKR"
    }
    allowed_value: {
      label: "TEST_DB_LKR1"
      value: "TEST_DB_LKR1"
    }
  }

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
