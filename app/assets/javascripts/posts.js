function urlsanitise(text){
	return text.replace(/[.]/ig,'').replace(/[^-a-z\d]/ig,'_');
}
var getMorePosts = function(post_id){
  
  $.get("/posts/more_except/" + post_id,{},function(result){
    //can paginate later.
    $(".more_posts").html(result)
  })
}
var getPostsByUser = function(user_id){
  
  $.get("/users/" + user_id + "/posts",{},function(result){
    $(".user_posts").html(result);
  });
}
$(function(){
	$("#post_title").on('change',function(){
		var posttitle = $(this).val();
		var urltext = urlsanitise(posttitle);
		$("#post_urltext").val(urltext);
	});
  var post_id = $("#post_id").val();
  if(post_id){getMorePosts(post_id);}
  
  var user_id = $("#user_id").val();
  if(user_id){getPostsByUser(user_id);}
});