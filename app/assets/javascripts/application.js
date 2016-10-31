//= require jquery
//= require jquery_ujs
//= require turbolinks

/**
 * @const
 */
var App = {};

$(function() {

    /**
     * menu box
     */
    App.open_menu_box = function(id) {
        $('#' + id + '_arrow_right').hide();
        $('#' + id + '_arrow_down').show();

        $('#' + id + '_open_content').show();
        $('#' + id + '_closed_content').hide();
    };
    App.close_menu_box = function(id) {
        $('#' + id + '_arrow_right').show();
        $('#' + id + '_arrow_down').hide();

        $('#' + id + '_open_content').hide();
        $('#' + id + '_closed_content').show();
    };

});
