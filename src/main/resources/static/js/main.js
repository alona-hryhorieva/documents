$(document).ready(function () {

    $('button.delete').on("click", function(){
        var id = $(this).parents(".doc").attr("data-id");
        $.ajax({
            type: "DELETE",
            url: "/documents?id=" + id
        })
    });


    $('button.edit').on("click", function(){
        var parent = $(this).parents(".doc");
        var id = parent.attr("data-id");
        var name =  parent.find(".name span").text();
        var dotIndex = name.lastIndexOf(".");
        var extension = name.substring(dotIndex);
        name = name.substring(0, dotIndex);

        parent.find(".name").html("<input class='mb-2 new_name' type='text' value='" + name + "'><br><input class='save' type='submit' class='button' value='save'>")

        $(".save").on("click", function(){
            var new_name = $(this).siblings(".new_name").val();
            $.ajax({
                type: "PUT",
                url: "/documents?id=" + id + "&name=" + new_name + extension
            });
            parent.find(".name").html("<span>"+ new_name + extension +"</span>");
        });
    });

    $('.tab_name').on("click", function(){
        $(this).addClass('active');
        $(this).siblings().removeClass('active');
        var index = $(this).index();
        $('.tab_text').eq(index).show();
        $('.tab_text').eq(index).siblings().hide();
    });

    $('.button.sign_out').on("click", function(){
        $.ajax({
            type: "DELETE",
            url: "/registration"
        })
    });
});