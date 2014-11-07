/*global $:false */
import Ember from 'ember';

var mockApi = function() {
  $.mockjaxSettings.logging = true;
  $.mockjaxSettings.responseTime = 0;
  $.mockjaxSettings.throwUnmocked = true;
  $.ajaxSettings.dataType = 'json';

  Ember.Test.registerHelper('stubEndpointForHttpRequest', function(app, verb, url, data, response, status) {
    if (verb == null) {
        verb = "GET";
    }
    if (status == null) {
        status = 200;
    }

    return $.mockjax({
        type: verb,
        url: url,
        data: data,
        status: status,
        dataType: 'json',
        responseText: response
    });
  });
}();

export default mockApi;