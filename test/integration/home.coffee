should = require 'should'
{wd40, browser, login_url, home_url, prepIntegration} = require './helper'

describe 'Home page (logged in)', ->
  prepIntegration()

  before (done) ->
    wd40.fill '#username', 'ehg', ->
      wd40.fill '#password', 'testing', ->
        wd40.click '#login', done

  before (done) ->
    browser.waitForElementByCss '.dataset-list', 4000, done

  it 'contains the scraperwiki logo', (done) ->
    wd40.getText '#logo', (err, h) ->
      h.should.equal 'ScraperWiki'
      done()

  it 'contains a list of my datasets', (done) ->
    browser.waitForVisibleByCss '.dataset', 4000, ->
      browser.elementsByCss '.dataset', (err, datasets) ->
        should.exist datasets
        datasets.length.should.be.above 0
        done()

  it 'each dataset has a visible status', (done) ->
    browser.elementsByCss '.dataset .status', (err, elements) ->
      should.exist elements
      elements.length.should.be.above 0
      done()

  context 'when I click the "new dataset" button', ->
    before (done) ->
      wd40.click '.new-dataset', done

    it 'shows the tools I can use to create datasets', (done) ->
      browser.waitForElementByCss '#chooser .tool', 4000, ->
        browser.elementsByCss '#chooser .tool', (err, tools) ->
          tools.length.should.be.above 0
          done()
