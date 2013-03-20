function urlsanitise(text){
	return text.replace(/[.]/ig,'').replace(/[^-a-z\d]/ig,'_');
}
$(function(){
	$("#post_title").on('change',function(){
		var posttitle = $(this).val();
		var urltext = urlsanitise(posttitle);
		$("#post_urltext").val(urltext);
	});
});