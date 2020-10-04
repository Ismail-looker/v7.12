project_name: "ismail_look"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

application: main {
  label: "Main Extension"
  file: "main.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    allow_same_origin: yes
    allow_forms: yes


  }
}
