class Cu.View.DatasetList extends Backbone.View
  className: 'dataset-list row'

  initialize: ->
    @collection = Cu.CollectionManager.get Cu.Collection.Datasets
    @collection.on 'sync', @addDatasets, @

  events:
    'click .new-dataset-tile': ->
      $('#subnav .new-dataset').trigger('click') # :TODO: this is nasty and hacky

  render: ->
    @$el.append $('<a class="new-dataset-tile swcol" title="Add a new dataset">Create a<br/>new dataset</a>').hide().fadeIn(150)
    @addDatasets() if @collection.length
    @

  addDatasets: ->
    @collection.visible().each @addDataset

  addDataset: (dataset, i) =>
    view = new Cu.View.DatasetTile model: dataset
    @$el.append $(view.render().el).hide().delay(i*75 + 100).fadeIn(150)
