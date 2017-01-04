# Attaches the Select2 JavaScript behavior to standard select inputs.
#
# ==== Example
#
#  <select data-behavior="selectable menu-item-create">
#    <option value="AL">Alabama</option>
#    <option value="MN">Minnesota</option>
#    <option value="WY">Wyoming</option>
#  </select>
#

$(document).on 'app:ready', ->
  $('[data-behavior~=selectable]').select2()
