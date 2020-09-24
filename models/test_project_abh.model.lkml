connection: "mysql-server2"

# include all the views
include: "/views/**/*.view"

datagroup: test_project_abh_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_project_abh_default_datagroup

explore: accountinfo {}

explore: currentaccountinfo {
  join: accountinfo {
    type: left_outer
    sql_on: ${currentaccountinfo.accountinfoid} = ${accountinfo.id} ;;
    relationship: many_to_one
  }
}

explore: order_lists {}

explore: orderbreakdown {}

explore: accountinfofromotherdb {
  view_name:accountinfofromotherdb
}

explore: sql_runner_query {
  view_name: sql_runner_query
}
explore: sp_otherdb {
  view_name: sp_otherdb
}
