$ = jQuery

$.extend
    asyncResponse: (response) ->
        content = $('<div data-role="response"/>').html response
        content.find('[data-target]').each ->
            $elem = $(this)
            data = $elem.data()
            html = $elem.html()
            $target = $('[data-contentkey="'+data.target+'"]')
            if $target.is ':hidden'
                $target.html(html).expand()        
            else
                $(html).expand
                    target: '[data-contentkey="'+data.target+'"]'
                    load: do ->
                        if data.load?
                            return data.load
                        else
                            return 'append'        

$('[data-remote]').live
	'ajax:complete': (evt, xhr, status) ->
        $.asyncResponse xhr.responseText