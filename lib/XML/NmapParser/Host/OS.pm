# v 0.2b

package NmapParser::Host::OS; 
use base NmapParser::Host;

my @ISA = "Host";
  
use vars qw($AUTOLOAD);

sub new {
    my $pkg = shift;
    my $self = bless {}, $pkg;
    $self->initialize(@_);
    return $self;
}

sub initialize {
    my $self = shift;
    $self->SUPER::initialize(shift, shift);
    $self->{OS} = shift;
}

sub all {
	
	my ($self) = @_;
	my @ALL;
	foreach ( @{$self->{stem}{osmatch}} ) {
		# return an array of OS objects......
		my $osmatch = NmapParser::Host::OS::osmatch->new($_);
		push(@ALL,$osmatch);
	}	
	return @ALL;		 

}

sub fingerprint { 
	my ($self) = @_;
	my $returnValue = "unknown";
	if ( defined($self->{stem}{osfingerprint}) ) { $returnValue = $self->{stem}{osfingerprint}; } 
	return $returnValue;
}


######################################################################################

package NmapParser::Host::OS::osmatch; 
use base NmapParser::Host::OS;

my @ISA = "OS";
  
use vars qw($AUTOLOAD);

sub new {
    my $pkg = shift;
    my $self = bless {}, $pkg;

    $self->SUPER::initialize(shift, shift);
    $self->{OSmatch} = $self->{stem};
    return $self;
}

sub initialize {
    my $self = shift;
    $self->SUPER::initialize(shift, shift);
    $self->{OSmatch} = shift;
}


sub name { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSmatch}{name}) ) { $returnValue = $self->{OSmatch}{name};  }
	return $returnValue;
} 

sub accuracy { 
	my ($self) = @_;
	my $returnValue = "unknown";
	if ( defined($self->{OSmatch}{accuracy}) ) { $returnValue = $self->{OSmatch}{accuracy}; } 
	return $returnValue;
} 
 

sub line { 
	my ($self) = @_;
	my $returnValue = "unknown";
	if ( defined($self->{OSmatch}{line}) ) { $returnValue = $self->{OSmatch}{line}; } 
	return $returnValue;
} 

sub osclass { 
	
	my ($self) = @_;
	my @ALL;
	foreach ( @{$self->{OSmatch}{osclass}} ) {
		# return an array of OS objects......
		my $osclass = NmapParser::Host::OS::osclass->new($_);
 
		push(@ALL,$osclass);
	}	
	return @ALL;		 

	
	
}
######################################################################################

package NmapParser::Host::OS::osclass; 
use base NmapParser::Host::OS;

my @ISA = "OS";
  
use vars qw($AUTOLOAD);

sub new {
    my $pkg = shift;
    my $self = bless {}, $pkg;

    $self->SUPER::initialize(shift, shift);
    $self->{OSclass} = $self->{stem};
    return $self;
}

sub initialize {
    my $self = shift;
    $self->SUPER::initialize(shift, shift);
    $self->{OSclass} = shift;
}


sub vendor { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSclass}{vendor}) ) { $returnValue = $self->{OSclass}{vendor};  }
	return $returnValue;
} 


sub generation { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSclass}{osgen}) ) { $returnValue = $self->{OSclass}{osgen};  }
	return $returnValue;
} 


sub family { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSclass}{osfamily}) ) { $returnValue = $self->{OSclass}{osfamily};  }
	return $returnValue;
} 


sub type { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSclass}{type}) ) { $returnValue = $self->{OSclass}{type};  }
	return $returnValue;
} 


 
sub accuracy { 
	my ($self) = @_;
	my $returnValue = "unknown"; 
	if ( defined($self->{OSclass}{accuracy}) ) { $returnValue = $self->{OSclass}{accuracy};  }
	return $returnValue;
} 

sub cpe { 
	my ($self) = @_;
	my @returnValue; 
	if ( defined($self->{OSclass}{cpe}) ) {
		foreach ( @{$self->{OSclass}{cpe}}) { 
			push(@returnValue,$_);
		} 
	}
	return @returnValue;
}

1; 
