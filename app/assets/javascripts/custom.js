$(function () {
    $('#items-index-table').DataTable({
        'pageLength': '50',
        'columnDefs': [
            {'orderable': false, 'targets': [8, 9, 10]}
        ]
    });

});