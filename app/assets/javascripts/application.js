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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .

// 投稿表示のアニメーション
$(function() {
	$('.post-list').hide().fadeIn('slow');
});

// =========================================

$(function() {
	$('.main-text').hide('slow').fadeIn('slow');
});

$(function() {
	$('.main-title').hide('slow').fadeIn('slow');
});

// =========================================


// 投稿のページネーション
$(function(){
	$("#posts").infinitescroll({
		loading: {
		      img: "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif",
		  msgText: "loading..."
		 },
		navSelector  : ".pagination",
		nextSelector : ".pagination a",
		itemSelector : ".post-list"
	});
});

// DMのページネーション
$(function(){
	$("#messages-page").infinitescroll({
		loading: {
		      img: "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif",
		  msgText: "loading..."
		 },
		navSelector  : ".pagination",
		nextSelector : ".pagination a",
		itemSelector : ".message-user"
	});
});

// 通知のページネーション
$(function(){
	$("#user-notifications").infinitescroll({
		loading: {
		      img: "http://www.mytreedb.com/uploads/mytreedb/loader/ajax_loader_blue_48.gif",
		  msgText: "loading..."
		 },
		navSelector  : ".pagination",
		nextSelector : ".pagination a",
		itemSelector : ".user-view"
	});
});

// DMページのメッセージTopに戻すボタン
$(document).ready(function() {
  var pagetop = $('.pagetop');
    $(window).scroll(function () {
       if ($(this).scrollTop() > 100) {
            pagetop.fadeIn();
       } else {
            pagetop.fadeOut();
            }
       });
       pagetop.click(function () {
           $('body, html').animate({ scrollTop: 0 }, 500);
   });
});

// Userページのナビゲーションバーのアクション
 $(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 240) {
                    $('#articles-scroll').addClass('is-fixed');
                } else {
                    $('#articles-scroll').removeClass('is-fixed');
                }
            });
        });

// headerドロップダウン
	$(function(){
	    $('#header-menu li').hover(function(){
	        $("ul:not(:animated)", this).slideDown();
	    }, function(){
	        $("ul.header-list",this).slideUp();
	    });
	});