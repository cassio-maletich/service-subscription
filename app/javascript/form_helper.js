$(document).on('turbolinks:load', function () {
    $('form').on('click', '.add_fields', function (event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $('#orders-wrapper').append($(this).data('fields').replace(regexp, time));
        return event.preventDefault();
    });

    $('form').on('click', '.remove_order', function (event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('.border').hide();
        return event.preventDefault();
    });
});