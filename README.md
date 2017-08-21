# DocBook XInclude-based chunking stylesheets

When transforming the DocBook XML source into a set of HTML pages using built-in XSL stylesheet for manual chunking, it may produce files just with the title. The purpose of this customization layer is to fill this empty space by the local Table of Contents.

These XSL stylesheets are expected to be used in conjuction with the [XInclude-based chunking helper](https://github.com/doctribute/docbook-xinclude-based-chunking-helper) tool as they rely on `<?toc?>` processing instructions inserted into specific locations within the source XML file during the building the configuration file for manual chunking.

## The content
 - `chunktoc.xsl` - an entry point of the customization layer. It imports the original DocBook template for manual chunking ([chunktoc.xsl](http://docbook.sourceforge.net/release/xsl/current/html/chunktoc.xsl)) which is then overridden by the custom code collected in a single `toc.xsl` stylesheet.
 - `toc.xsl` - an actual customization code, which replaces `<?toc?>` processing instructions with the local Table of Contents if specific conditions are met.

## Example
In the example folder there are sample XML files together with the chunked HTML output to see these stylesheets in action.

## Notes
As of August 2017 the original DocBook chunktoc.xsl stylesheet contains a bug, see https://github.com/docbook/xslt10-stylesheets/issues/32 for further details and quite easy fix.
