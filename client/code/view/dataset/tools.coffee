class Cu.View.DatasetTools extends Backbone.View
  id: 'dataset-tools'
  events:
    'click .tool': 'toolClick'
    'click .scroll': 'scrollMore'

  initialize: ->
    if @options.view?
      @selectedTool = @options.view
    else
      @selectedTool = @model

    # Tool relations might not have been loaded yet,
    # so we listen for future tool-related events.
    app.tools().on 'add', @addToolArchetype, @
    @model.on 'update:tool', @addToolInstance, @
    @model.get('views').on 'update:tool', @addToolInstance, @

  render: ->
    @$el.html """<ul class="tools"></ul>
      <ul class="archetypes"></ul>
      <ul class="more">
        <li><a class="new-view">More tools&hellip;</a></li>
      </ul>
      <span class="scroll"></span>"""
    @addToolInstance @model
    views = @model.get('views').visible()
    views.each (view) =>
      @addToolInstance view
    app.tools().each (archetype) =>
      @addToolArchetype archetype
    @

  toolClick: (e) ->
    # Do nothing if cmd or ctrl keys are held down (allows cmd-click for new tabs).
    # The global link handler in app.coffee will deal with navigation.
    unless e.metaKey or e.ctrlKey
      $('.tool.active').removeClass("active")
      $(e.currentTarget).addClass("active")

  addToolArchetype: (toolModel) ->
    # The setTimeout thing is because we can't work out Backbone (Relational) model loading:
    # without the setTimeout, instance.get('tool') is undefined.
    setTimeout =>
      if toolModel.isBasic()
        item = $("[data-toolname=#{toolModel.get 'name'}]", @$el)
        if item.length > 0
          return
        v = new Cu.View.ArchetypeMenuItem { archetype: toolModel, dataset: @model }
        $('.archetypes', @$el).append v.render().el
      @positionIframe()
    , 0

  addToolInstance: (instance) ->
    if not instance.isVisible()
      # Don't show "hidden" tool instances
      return
    if $("#instance-#{instance.get 'box'}", @$el).length > 0
      # Already added as a menu item; don't add again.
      return
    if not instance.get 'tool'
      # Tool relation not loaded yet. Bail out.
      # The instance will be added again later, once tools have loaded.
      return
    v = new Cu.View.ToolMenuItem model: instance
    el = v.render().el
    $('a', el).addClass('active') if instance is @selectedTool
    if instance is @model
      # This is the dataset's main tool instance! Put it first.
      $('.tools', @$el).prepend el
    else
      $('.tools', @$el).append el
      @positionIframe()

  positionIframe: ->
    if window.app.appView.currentView?.positionIframe?
      window.app.appView.currentView.positionIframe?()
    @showOrHideScroller()

  scrollMore: ->
    w = @$el.width()
    l = @$el[0].scrollLeft + (w * 0.9)
    @$el.animate {scrollLeft: l}, 250, =>
      @showOrHideScroller()

  showOrHideScroller: ->
    totalWidth = 0
    visibleWidth = @$el.width()
    scrollLeft = @$el[0].scrollLeft
    @$el.children('ul').each ->
      totalWidth += $(this).outerWidth(true)
    if visibleWidth + scrollLeft > totalWidth
      @$el.children('.scroll:visible').fadeOut 100
    else if visibleWidth < totalWidth
      @$el.children('.scroll:hidden').fadeIn 100
    else
      @$el.children('.scroll:visible').fadeOut 100
