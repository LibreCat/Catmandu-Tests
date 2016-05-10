#!/usr/bin/env perl

use JSON;

my $catmandu_git = 'git@github.com:LibreCat/Catmandu.git';
my $catmandu_branch = 'dev';

my $conf = config();

my $cmd = shift;

die "usage: $0 install|test" unless $cmd;

if ($cmd eq 'install') {
	cmd_install();
}
elsif ($cmd eq 'test') {
	cmd_test();
}

sub cmd_install {
	system("./install_catmandu.sh $catmandu_git $catmandu_branch");
	for my $pkg (@{$conf->{packages}}) {
		my $name   = $pkg->{name};
		my $git    = $pkg->{git};
		my $branch = $pkg->{branch} // 'master';
		system("./install_package.sh $name $git $branch");
	}
}

sub cmd_test {
	for my $pkg (@{$conf->{packages}}) {
		my $name   = $pkg->{name};
		system("./test_package.sh $name");
	}
}

sub config {
	local $/;
    open( my $fh, '<', 'config.json' );
    my $json_text   = <$fh>;
    my $perl_scalar = decode_json( $json_text );
    close($fh);
    $perl_scalar;
}