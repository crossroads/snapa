var page = require('webpage').create(),
    system = require('system'),
    address, output, selector;

if (system.args.length < 2) {
    console.log('Usage: snapa.js URL output [selector]');
    console.log('    opens a page and renders the contents of selector to output file');
    phantom.exit(1);
} else {
    address = system.args[1];
    output = system.args[2];
    selector = system.args[3] || 'body';

    page.open(address, function () {
        page.clipRect = page.evaluate(function(selector) {
            return document.querySelector(selector).getBoundingClientRect();
        }, selector);
        page.render(output);
        phantom.exit();
    });
}
