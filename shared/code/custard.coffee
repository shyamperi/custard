# Utility functions for
# the Custard frontend


showOrAddSSH = (model, type) =>

  initZeroClipboard = ->
    clip = new ZeroClipboard $('.zeroclipboard')[0], { moviePath: "/vendor/js/ZeroClipboard.swf" }
    clip.on "complete", -> $(@).html '<i class="icon-ok space"></i> Copied!'
    return clip

  makeModal = (html) ->
    # html should be the HTML *content* of a modal, as a string,
    # without the surrounding <div class="modal">...</div>
    if $('.modal').length
      $('.modal').html html
      initZeroClipboard()
    else
      modalWindow = $("""<div class="modal hide fade">#{html}</div>""")
      modalWindow.modal()
      modalWindow.on 'hidden', -> modalWindow.remove()
      modalWindow.on 'shown', initZeroClipboard

  addSSHKey = ->
    $('.modal .text-error').remove()
    key = $('.modal textarea').val()
    if $.trim(key) == ''
      $('#ssh-key').after('<p class="text-error">Please supply an SSH key!</p>')
    else if /PRIVATE KEY/.test key
      $('#ssh-key').after('<p class="text-error">Oops! That looks like your private key. Please paste in the contents of your public key, <code>id_rsa.pub</code>.</p>')
    else
      $.ajax
        url: "/api/#{window.user.effective.shortName}/sshkeys",
        type: "POST",
        data: {key: key}
      model.set {'type': type}, {silent: true}
      makeModal JST['modal-ssh'] model.toJSON()

  $.ajax
    url: "/api/#{window.user.effective.shortName}/sshkeys"
    success: (sshKeys) ->
      if sshKeys.length
        model.set {'type': type}, {silent: true}
        makeModal JST['modal-ssh'] model.toJSON()
      else
        makeModal JST['modal-add-ssh']()

  $(document).on 'click', '.modal #add-ssh-key', addSSHKey
  $(document).on 'click', '.modal #add-another-ssh-key', ->
    makeModal JST['modal-add-ssh']()


String::twoLineWrap = (characters=20) ->
  return this if this.length <= characters
  text = this
  if this.length > characters*2
    regexp = new RegExp "(.{1,#{characters*2}})[ ](.*)"
    text = text.replace regexp, "$1\u2026"
  regexp = new RegExp "(.{1,#{characters}})[ ](.*)"
  text = text.replace regexp, '$1<br>$2'
  return text
