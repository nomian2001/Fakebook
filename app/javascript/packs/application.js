// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("@popperjs/core")
require("jquery")
import "bootstrap"
require("../stylesheets/application.scss")
import "@fortawesome/fontawesome-free/css/all"

$(function(){
    $("textarea").on('input',function(e) {
        while($(this).outerHeight() < this.scrollHeight + parseFloat($(this).css("borderTopWidth")) + parseFloat($(this).css("borderBottomWidth"))) {
            $(this).height($(this).height()+1);
        };
    });

    $(".bg-create-post").off('submit').on('submit',function(e){
        e.stopImmediatePropagation();
        e.preventDefault();
        let post = $('.post_content').val();
        let link = $(this).attr('action');
        $.ajax({
            url: link,
            type: "POST",
            dataType: 'json',
            data: {
                    post: {
                        content: post
                    }
            },
            success: function() {
                alert("You created post!");
            },
            error: function(){
                alert("not success!")
            }
        })
    });

    $('.comment_form').off('submit').on('submit',function(e){
        e.stopImmediatePropagation();
        e.preventDefault();
        let contentComment = $('.comment').val();
        let link = $(this).attr('action');
        $.ajax({
            url: link,
            type: "POST",
            dataType: 'json',
            data: {
                comment: {
                    content: contentComment
                }
            },
            success: function(){
                alert("created comment!")
            },
            error: function(){
                alert("comment unsuccess!")
            }
        });
       
    });

   
})


Rails.start()
Turbolinks.start()
ActiveStorage.start()
