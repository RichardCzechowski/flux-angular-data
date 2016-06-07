#
# Copyright (C) 2015 by Looker Data Services, Inc.
# All rights reserved.
#

m = module.exports = angular.module 'directives', [
  'dataflux'
  'stores'

  require('./drag_container/drag_container_module').name
  require('./drag_element/drag_element_module').name
  require('./trash/trash_module').name
  require('./add_button/add_button_module').name
]
