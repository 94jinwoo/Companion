
(function($){
	$.fn.boardSlide = function(opt){
		
		var $this = this;
		
		opt = $.extend({
			speed : 400,
			btn : $this.children('.click'),
			current : 0,
			openType : true,
			ease : 'linear'
		}, opt);
		
		if(opt.current > 0){
			$this.children('li').eq(opt.current - 1).addClass('on').children('.hidden').show();		
		}
		
		opt.btn.click(function(e){
			e.preventDefault();
			if($('.hidden').is(":animated")) { return; }
			var	  $thisBtn = $(this), 
				  $item = $thisBtn.parent(),
				  $not = opt.btn.not($thisBtn);						
			if($item.hasClass('on')){
				$item.removeClass('on');
				$thisBtn.next('.hidden').stop().slideUp(opt.speed, opt.ease);				
			}else{
				$item.addClass('on');
				$thisBtn.next('.hidden').stop().slideDown(opt.speed, opt.ease);				
			}
			if(opt.openType){
				$not.parent().removeClass('on');
				$not.next('.hidden').stop().slideUp(opt.speed, opt.ease);		
			}
		})	
					
	}
				
})(jQuery);
