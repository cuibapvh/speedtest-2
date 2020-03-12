#!/usr/bin/perl
my $buffer = '';
if($ENV{CONTENT_LENGTH}) { read(STDIN,$buffer,$ENV{CONTENT_LENGTH}); }
print "Content-type: text/plain\n";
print "Content-type: text/plain\n";
print "Access-Control-Allow-Origin: *\n";
print "Access-Control-Allow-Methods: GET, POST\n";
print "Access-Control-Allow-Headers: Content-Encoding, Content-Type\n";
print "Cache-Control: no-store, no-cache, must-revalidate, max-age=0, s-maxage=0\n";
print "Cache-Control: post-check=0, pre-check=0\n";
print "Pragma: no-cache\n\n";
print 'Post data contain (' . length($buffer) . " chars)\n";
if( ! length($buffer) ) { $buffer = '[No POST data received]'; }
exit;