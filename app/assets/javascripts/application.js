// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require refile
//= require jquery
//= require turbolinks
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .


$(function() {
    // 画像をアップしたら表示する
    // jQuery Upload Thumbs
    $('form input:file').uploadThumbs();

    // サクセスメッセージを秒数で消す
    
    setTimeout("$('#flash').fadeOut('slow')", 2000);
});

// 住所の自動入力
$(window).ready( function() {
  $(".postal_code").jpostal({
    postcode : [ ".postal_code" ],
    address  : {
        ".address"    : "%3%4%5%6%7",
    }
  });
});
