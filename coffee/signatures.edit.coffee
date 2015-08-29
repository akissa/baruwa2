###!
 * Baruwa Enterprise Edition
 * http://www.baruwa.com
 *
 * Copyright (c) 2013-2015 Andrew Colin Kissa
 *
 *
###
$ = jQuery
$(document).ready ->
    csrf = $('#csrf_token').val()
    uploadform = "<form enctype=\"multipart/form-data\" method=\"post\" action=\"#{fm_url}?action=upload\">
                 <p><input type=\"file\" name=\"handle\" /><br>
                 <input type=\"text\" name=\"newName\" style=\"width:250px; border:solid 1px !important;\" /><br>
                 <input type=\"hidden\" value=\"#{csrf}\" name=\"csrf_token\">
                 <input type=\"submit\" name=\"submit\" value=\"Upload\" /></p>
                 </form>"
    editor = $("#signature_content").cleditor({width:"100%", height:"100%"})[0].focus()
    $('#currimgs .wysiwyg-dialog-close-button').click((e)->
        e.preventDefault()
        $('#currimgs').hide())
    $('#imgupload .wysiwyg-dialog-close-button').click((e)->
        e.preventDefault()
        $('#currimgs').hide()
        $('#imgupload').hide())
    $(".wysiwyg-files-action-upload").click((e)->
        $('#imgupload .wysiwyg-dialog-content').empty()
        $("<iframe/>", { "class": "wysiwyg-files-upload" }).load(->
            $doc = $(this).contents()
            $doc.find("body").append(uploadform)
            $doc.find("input[type=file]").change(->
                $val = $(this).val()
                $val = $val.replace(/.*[\\\/]/, '')
                $doc.find("input[name=newName]").val($val))
            ).appendTo($('#imgupload .wysiwyg-dialog-content'))
        $('#imgupload').show())
    1

