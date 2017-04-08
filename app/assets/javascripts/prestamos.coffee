# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
# enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'

    $ ->
  $(document).on 'change', '#tipo_select', (evt) ->
    $.ajax 'new_prestamo',
      type: 'GET'
      dataType: 'script'
      data: {
        vehiculo_tipo: $("#tipo_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")



$(document).ready ->
  $('#tabla-prestamo').DataTable 'language':
    'sProcessing': 'Procesando...'
    'sLengthMenu': 'Mostrar _MENU_ registros'
    'sZeroRecords': 'No se encontraron resultados'
    'sEmptyTable': 'Ningún dato disponible en esta tabla'
    'sInfo': 'Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros'
    'sInfoEmpty': 'Mostrando registros del 0 al 0 de un total de 0 registros'
    'sInfoFiltered': '(filtrado de un total de _MAX_ registros)'
    'sInfoPostFix': ''
    'sSearch': 'Buscar:'
    'sUrl': ''
    'sInfoThousands': ','
    'sLoadingRecords': 'Cargando...'
    'oPaginate':
      'sFirst': 'Primero'
      'sLast': 'Último'
      'sNext': 'Siguiente'
      'sPrevious': 'Anterior'
    'oAria':
      'sSortAscending': ': Activar para ordenar la columna de manera ascendente'
      'sSortDescending': ': Activar para ordenar la columna de manera descendente'
  return

