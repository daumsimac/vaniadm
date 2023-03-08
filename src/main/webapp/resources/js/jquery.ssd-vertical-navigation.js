;(function($) {

    $.fn.ssdVerticalNavigation = function(options) {

        "use strict";

        var settings = $.extend({

            classMaster : 'master',
            classActive : 'active',
            classClickable : 'clickable'

        }, options);

        function _isEmpty(thisValue){       	
        	
        	if($.isArray(thisValue)){
        		return (thisValue.length<=0)
        	}else{
        		return (thisValue==""||thisValue==null
        				||typeof thisValue=="undefined")
        	}
        }
        
        function _replaceHeading(thisHeading){
        	if(!_isEmpty(thisHeading)){        		
        		$("h1#heading").html(thisHeading.trim());        		
        	}
        }
        
        function _leftNavigationActiveMain(thisLi) {

            "use strict";

            thisLi
                .toggleClass(settings.classActive)
                .siblings()
                .removeClass(settings.classActive);

        }

        function _leftNavigationActiveSub(thisLi) {

            "use strict";

            thisLi
                .addClass(settings.classActive)
                .siblings()
                .removeClass(settings.classActive)
                .closest("ul")
                .closest("li")
                .siblings()
                .find("li")
                .removeClass(settings.classActive);
            
            _replaceHeading(thisLi.text());
         
            _pageMove(thisLi.find('input').val());

        }        

        function _pageMove(target){
        	
        	$("iframe#mainFrame").attr("src",target);
        }
        
        function _leftNavigationClick(thisParentUl, thisLi, event) {

            "use strict";

            if (thisParentUl.hasClass(settings.classMaster) && ! thisLi.hasClass(settings.classClickable)) {

                event.preventDefault();
                event.stopPropagation();

                _leftNavigationActiveMain(thisLi);

            }else{
            	_leftNavigationActiveSub(thisLi);
            }

        }


        return this.each(function() {

            "use strict";

            $(this)
                .addClass(settings.classMaster)
                .on('click',  'li a', function(event) {

                try {

                    var thisA = $(this),
                        thisLi = thisA.parent('li'),
                        thisParentUl = thisLi.parent('ul');

                    _leftNavigationClick(thisParentUl, thisLi, event);

                } catch (errorMessage) {
                    console.log(errorMessage);
                }

            });
        });
    }

}(jQuery));