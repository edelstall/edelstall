
$(document).ready(
    function() 
    {
    	// html5
        document.documentElement.className = 'js'; 
        
        // png fix
        var i;
        
        for (i in document.images) {
            if (document.images[i].src) {
                var imgSrc = document.images[i].src;
                if (imgSrc.substr(imgSrc.length-4) === '.png' || imgSrc.substr(imgSrc.length-4) === '.PNG') {
                    document.images[i].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='crop',src='" + imgSrc + "')";
                }
            }
        }
        

        if( $('#register-date-day').exists() )
        {
        	if( $('#register-date-day').val() ) { $('#register-date-day').val( $('#register-date-day-value').val() ); }
        	if( $('#register-date-month').val() ) { $('#register-date-month').val( $('#register-date-month-value').val() ); }
        	if( $('#register-date-year').val() ) { $('#register-date-year').val( $('#register-date-year-value').val() ); }
        	
        	$('#register-date-day, #register-date-month, #register-date-year').change(registerAssembleDate);
			
			$('form').submit( 
				function()
				{ 
					if( 
						$('#register-date-day').val() != -1 &&
						$('#register-date-month').val() != -1 &&
						$('#register-date-year').val() != -1 
					)
					{
						return true;
					}
					
					$('#register-date-fields').addClass('error');
					alert('Birthday is a required field.');
					
					return false; 
				} 
			);
			
			function registerAssembleDate()
			{
	        	if( 
	        		$('#register-date-day').val() != -1 &&
	        		$('#register-date-month').val() != -1 &&
	        		$('#register-date-year').val() != -1 
	        	)
	        	{
	        		$('#register-date').val( 
	        			$('#register-date-day').val() + ' ' + 
	        			$('#register-date-month').val() + ' ' + 
	        			$('#register-date-year').val() 
	        		);
	        	}
	        }
        	
        }
        

        // back to top
        $('.back_to_top').click( //↑
            function() 
            {
                $('html, body').animate(
                    {
                        scrollTop: 0
                    }, 
                    1000, 
                    'easeInOutCubic'
                );
                
                return false;
            }
        );
    }
);






// scroll to this
function scrollToThis(obj)
{
    $('html, body').animate(
        {
            scrollTop: $(obj).offset().top
        }, 
        1000, 
        'easeInOutCubic'
    );
    
    return false;
}  



jQuery.fn.exists = function() // test to see if an object exists
{
    return jQuery(this).length > 0;
}



// analytics
/*
var _gaq = _gaq || [];
_gaq.push(['_setAccount', '']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
*/