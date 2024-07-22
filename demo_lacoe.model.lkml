connection: "pandera-bi-demo-connection"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
# map_layer: high_school_district_boundaries {
#   file: "/map_layer_files/High_School_Districts_+_Unified_Districts.geojson"
#   property_key: "LABEL"
# }
map_layer: school_district_boundaries {
  file: "/map_layer/HEU_school_districts.geojson"
  property_key: "LABEL"
}

# map_layer: LA_district_boundaries {
#   file: "/map_layer_files/School_District_Boundaries.geojson"
#   property_key: "LABEL"
# }
explore: cal_enviro_full_data {}
