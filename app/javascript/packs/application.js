// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("@popperjs/core")
import "bootstrap"
require("../stylesheets/application.scss")
import "@fortawesome/fontawesome-free/css/all"

global.toastr = require("toastr")



$(function(){
    $("textarea").on('input',function(e) {
        while($(this).outerHeight() < this.scrollHeight + parseFloat($(this).css("borderTopWidth")) + parseFloat($(this).css("borderBottomWidth"))) {
            $(this).height($(this).height()+1);
        };
    });

    $(".comment-btn").on('click',function() {
        let id = $(this).parent().parent().attr('id')
        id = id.replace('post_','');
        $("#comments_"+id).toggle();
       
    })
    
   
   
})


Rails.start()
Turbolinks.start()
ActiveStorage.start()
require("jquery")
