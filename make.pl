#!/usr/bin/env perl

use JSON;

my $catmandu_git = 'git@github.com:LibreCat/Catmandu.git';
my $catmandu_branch = 'dev';

my $conf = config();

my $cmd = shift;

die "usage: $0 install|test|clean|realclean" unless $cmd;

if ($cmd eq 'install') {
	cmd_install();
}
elsif ($cmd eq 'test') {
	cmd_test();
}
elsif ($cmd eq 'clean') {
	cmd_clean();
}
elsif ($cmd eq 'realclean') {
	cmd_realclean();
}

sub cmd_install {
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

sub cmd_clean {
	for my $pkg (@{$conf->{packages}}) {
		my $name   = $pkg->{name};
		system("rm -rf $name/cpanfile.snapshot");
	}
	system("rm -rf local");
}

sub cmd_realclean {
	for my $pkg (@{$conf->{packages}}) {
		my $name   = $pkg->{name};
		system("rm -rf Catmandu*");
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