// To use these, install the mongo fixtures utility
//    npm install pow-mongodb-fixtures -g
// and install mongodb locally, ensure it's runnning!
exports.users = [
{
  shortName: 'test',
  email: ['test@example.org'],
  displayName: 'Test Testofferson',
  password: '$2a$10$EWqKC.kk2vYtmkW4fdCk7OxcnvZbd5SXwszHK6LQRlh59PYQK1hBm',
  apikey: process.env.COTEST_USER_API_KEY,
  isStaff: false
},
{
  shortName: 'teststaff',
  email: ['teststaff@example.org'],
  displayName: 'General Test Testington',
  password: '$2a$10$CFjsDLWeS1x5BiX0mLulnOH97vop1KwUmzPnx5NvmZ1oda.LZNXNm',
  apikey: process.env.COTEST_STAFF_API_KEY,
  isStaff: true
},
{
  shortName: 'ehg',
  email: ['chris@scraperwiki.com'],
  displayName: 'Chris Blower',
  password: '$2a$10$EWqKC.kk2vYtmkW4fdCk7OxcnvZbd5SXwszHK6LQRlh59PYQK1hBm',
  apikey: process.env.COTEST_USER_API_KEY,
  isStaff: true
},
{
  shortName: 'ickletest',
  email: ['ickletest@example.org'],
  displayName: 'Ickle Test',
  password: '$2a$10$zGJXsNwhOBvze9GDm.jeEuLBX.TciRIKxNXfslxe5TZ.9/fDgpeDu',
  apikey: process.env.COTEST_STAFF_API_KEY,
  isStaff: true
},
{
  shortName: 'zarino',
  email: ['zarino@scraperwiki.com'],
  displayName: 'Zarino Testington',
  password: '$2a$10$EWqKC.kk2vYtmkW4fdCk7OxcnvZbd5SXwszHK6LQRlh59PYQK1hBm',
  apikey: process.env.COTEST_USER_API_KEY
}
];

exports.tokens = [
{
  token: "339231725782156",
  shortName: "ickletest"
}
]

exports.tools = [
{ name: "newdataset", public: true, type: "importer", gitUrl: "https://github.com/scraperwiki/newdataset-tool.git", manifest: { description: "Create a new, empty dataset", gitUrl: "https://github.com/scraperwiki/newdataset-tool.git", displayName: "Code a dataset!" } },
{ name: "test-app", public: true, type: "importer", gitUrl: "https://github.com/scraperwiki/test-app-tool.git", manifest: { description: "Test app", gitUrl: "https://github.com/scraperwiki/test-app-tool.git", displayName: "Test app" } },
{ name: "test-plugin", public: true, type: "view", gitUrl: "https://github.com/scraperwiki/test-plugin-tool.git", manifest: { description: "Test plugin", gitUrl: "https://github.com/scraperwiki/test-plugin-tool.git", displayName: "Test plugin" } },
{ name: "spreadsheet-download", public: true, type: "view", gitUrl: "https://github.com/scraperwiki/spreadsheet-download-tool", manifest: { description: "Download your dataset as an Excel file", gitUrl: "git://github.com/scraperwiki/spreadsheet-download-tool.git", displayName: "Download as spreadsheet" } },
{ name: "newview", public: true, type: "view", gitUrl: "git://github.com/scraperwiki/newview-tool.git", manifest: { description: "Visualise or export your dataset however you'd like. A blank slate. Get creative!", gitUrl: "git://github.com/scraperwiki/newview-tool.git", displayName: "Code your own view!" } },
{ name: "view-source", public: true, type: "view", gitUrl: "git://github.com/scraperwiki/view-source-tool.git", manifest: { description: "Find out how to see the code that powers your dataset", gitUrl: "https://github.com/scraperwiki/view-source-tool.git", displayName: "View source" } },
{ name: "view-data", public: true, type: "view", gitUrl: "git://github.com/scraperwiki/spreadsheet-tool.git", manifest: { description: "See your data in a spreadsheet. Like it's 1990.", gitUrl: "git://github.com/scraperwiki/spreadsheet-tool.git", displayName: "View data" } },
{ name: "spreadsheet-upload", public: true, type: "importer", gitUrl: "git://github.com/scraperwiki/spreadsheet-upload-tool.git", manifest: { description: "Upload an Excel file or CSV", gitUrl: "git://github.com/scraperwiki/spreadsheet-download-tool.git", displayName: "Upload a spreadsheet" } },
{ name: "view-source-pro", public: true, type: "view", gitUrl: "git://github.com/zarino/view-source-tool.git", manifest: { description: "Browse the filesystem behind ScraperWiki a dataset and see how it ticks.", gitUrl: "git://github.com/zarino/view-source-tool.git", displayName: "View source: Pro" } },
{ name: "datatables-view-tool", public: true, type: "view", gitUrl: "https://github.com/scraperwiki/datatables-view-tool", manifest: { description: "Sort, search and page through your data.", gitUrl: "https://github.com/scraperwiki/datatables-view-tool", displayName: "View in a table" } }
]

exports.datasets = [
{ "box" : "3006375730", "tool": "test-app", "displayName" : "Cheese", "user" : "ickletest", "views" : [] },
{ "box" : "3006375731", "tool": "test-app", "displayName" : "Apricot", "user" : "ehg", "views" : [] },
{ "box" : "3006375815", "tool": "test-app", "displayName" : "Prune", "user" : "ehg", "views" : [  { "name": "viwewe", "displayName": "A View", "box": "abox", "state": "state", "tool": "test-plugin" } ] },
{ "box" : "3006375816", "tool": "test-app", "displayName" : "Kittens", "user" : "zarino", "views" : [  { "name": "table1", "displayName": "View in a Table", "box": "400857239", "state": "state", "tool": "test-plugin" } ], "status": { "updated": "2013-03-12T08:23:00.000Z", "message": "Fully up to date", "type": "ok" } },
{ "box" : "3006375818", "tool": "test-app", "displayName" : "Puppies", "user" : "zarino", "views" : [], "status": { "updated": "2013-03-12T07:20:00.000Z", "message": "Fully up to date", "type": "ok" } },
{ "box" : "3006375819", "tool": "test-app", "displayName" : "Piglets", "user" : "zarino", "views" : [], "status": { "updated": "2013-01-10T10:23:00.000Z", "message": "No piglets detected", "type": "error" } },
{ "box" : "3006375821", "tool": "test-app", "displayName" : "Chicks", "user" : "zarino", "views" : [] },
{ "box" : "3006375823", "tool": "test-app", "displayName" : "Bobcats", "user" : "zarino", "views" : [] }
]
//
//exports.boxes = [
//]