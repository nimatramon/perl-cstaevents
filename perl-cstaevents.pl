#!/usr/bin/perl

# perl-cstaevents
# https://github.com/nimatramon/perl-cstaevents
# License: MIT
# Written by NimatramoN

#use strict;
#use warnings;

# Address of csta_server in the network
my $csta_server = "http://127.0.0.1/csta_server";

# Let me kn ow where to store log

my $csta_log_file = "/var/log/cstaevents.log";

# Do you want to write log. 0 = No, 1 = Yes

my $csta_log_enabled = 1;


sub cstaConnectionClearedEvent
{
  my ($server_url,$monitorCrossRefID,$callID,$releasingDevice,$cause) = @_ ;
  

  use SOAP::Lite;
  my $soap = SOAP::Lite
  ->on_action(sub{return 'urn:#CSTA-Connection-Cleared-event'})
  ->uri('http://www.ecma-international.org/standards/ecma-323/csta/ed6')
  ->ns('http://www.ecma-international.org/standards/ecma-323/csta/ed6','ed6')
  ->proxy($server_url)
  ->autotype(0);



  my @params = 
  (
    SOAP::Data->name('monitorCrossRefID' => $monitorCrossRefID)->prefix('ed6')->type(''),
    SOAP::Data->name('droppedConnection' => \SOAP::Data->value(SOAP::Data->name("callID" => $callID)->prefix('ed6')->type(''),))->prefix('ed6'),
    SOAP::Data->name('releasingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $releasingDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('cause' => $cause)->prefix('ed6')->type(''),

  );
  my $method = SOAP::Data->name('ConnectionClearedEvent')->prefix('ed6');


  my $som = $soap->call($method => @params);


}
#############################################################################
sub cstaOriginatedEvent
{

  my ($server_url,$monitorCrossRefID,$callID,$callingDevice,$calledDevice,$cause) = @_;

  use SOAP::Lite;

  my $soap = SOAP::Lite
  ->on_action(sub{return 'urn:#CSTA-Originated-event'})
  ->uri('http://www.ecma-international.org/standards/ecma-323/csta/ed6')
  ->ns('http://www.ecma-international.org/standards/ecma-323/csta/ed6','ed6')
  ->proxy($server_url)
  ->autotype(0);

  my @params = 
  (
    SOAP::Data->name('monitorCrossRefID' => $monitorCrossRefID)->prefix('ed6')->type(''),
    SOAP::Data->name('originatedConnection' => \SOAP::Data->value(SOAP::Data->name("callID" => $callID)->prefix('ed6')->type(''),))->prefix('ed6'),
    SOAP::Data->name('callingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $callingDevice,)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('calledDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $calledDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('cause' => $cause)->prefix('ed6')->type(''),
  );
  my $method = SOAP::Data->name('OriginatedEvent')->prefix('ed6');
  my $som = $soap->call($method => @params);

}




###################################################################################################################
sub cstaDeliveredEvent
{

  my ($server_url,$monitorCrossRefID,$callID,$alertingDevice,$callingDevice,$calledDevice,$cause) = @_;

  use SOAP::Lite;

  my $soap = SOAP::Lite
  ->on_action(sub{return 'urn:#CSTA-Delivered-event'})
  ->uri('http://www.ecma-international.org/standards/ecma-323/csta/ed6')
  ->ns('http://www.ecma-international.org/standards/ecma-323/csta/ed6','ed6')
  ->proxy($server_url)
  ->autotype(0);

  my @params = 
  (
    SOAP::Data->name('monitorCrossRefID' => $monitorCrossRefID)->prefix('ed6')->type(''),SOAP::Data->name('connection' => \SOAP::Data->value(SOAP::Data->name("callID" => $callID)->prefix('ed6')->type(''),))->prefix('ed6'),
    SOAP::Data->name('alertingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $alertingDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('callingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $callingDevice,)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('calledDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $calledDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('cause' => $cause)->prefix('ed6')->type(''),
  );
  my $method = SOAP::Data->name('DeliveredEvent')->prefix('ed6');
  my $som = $soap->call($method => @params);

}

#############################################################################################
sub cstaEstablishedEvent
{

  my ($server_url,$monitorCrossRefID,$callID,$answeringDevice,$callingDevice,$calledDevice,$cause) = @_;

  use SOAP::Lite;

  my $soap = SOAP::Lite
  ->on_action(sub{return 'urn:#CSTA-Established-event'})
  ->uri('http://www.ecma-international.org/standards/ecma-323/csta/ed6')
  ->ns('http://www.ecma-international.org/standards/ecma-323/csta/ed6','ed6')
  ->proxy($server_url)
  ->autotype(0);

  my @params = 
  (
    SOAP::Data->name('monitorCrossRefID' => $monitorCrossRefID)->prefix('ed6')->type(''),SOAP::Data->name('establishedConnection' => \SOAP::Data->value(SOAP::Data->name("callID" => $callID)->prefix('ed6')->type(''),))->prefix('ed6'),
    SOAP::Data->name('answeringDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $answeringDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('callingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $callingDevice,)->prefix('ed6')) )->prefix('ed6'),

    SOAP::Data->name('calledDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $calledDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('cause' => $cause)->prefix('ed6')->type(''),
 
  );
  my $method = SOAP::Data->name('EstablishedEvent')->prefix('ed6');
  my $som = $soap->call($method => @params);

}

#########################################################################################################



sub cstaFailedEvent
{

  my ($server_url,$monitorCrossRefID,$callID,$failingDevice,$callingDevice,$calledDevice,$cause) = @_;

  use SOAP::Lite;

  my $soap = SOAP::Lite
  ->on_action(sub{return 'urn:#CSTA-Failed-event'})
  ->uri('http://www.ecma-international.org/standards/ecma-323/csta/ed6')
  ->ns('http://www.ecma-international.org/standards/ecma-323/csta/ed6','ed6')
  ->proxy($server_url)
  ->autotype(0);

  my @params = 
  (
    SOAP::Data->name('monitorCrossRefID' => $monitorCrossRefID)->prefix('ed6')->type(''),SOAP::Data->name('originatedConnection' => \SOAP::Data->value(SOAP::Data->name("callID" => $callID)->prefix('ed6')->type(''),))->prefix('ed6'),
    SOAP::Data->name('failingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $failingDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('callingDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $callingDevice,)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('calledDevice' =>  \SOAP::Data->value(SOAP::Data->name("deviceIdentifier" => $calledDevice)->prefix('ed6')) )->prefix('ed6'),
    SOAP::Data->name('cause' => $cause)->prefix('ed6')->type(''),
  );
  my $method = SOAP::Data->name('FailedEvent')->prefix('ed6');
  my $som = $soap->call($method => @params);

}



##################################################
# sendCstaEvent
# Sends prefered event to the server
# @Param  $event  // Name of the event. Valid Values: originated, delivered, established, connection-cleared, failed
# @Param  %data   // A hash containing event patameters
##################################################
sub sendCstaEvent
{
  my ($event,%data) = @_;




  my $msg_syslog = "Trying to send  CSTA EVENT: " .   $event;
  logCstaEvent($msg_syslog);

  my @pairs = ();
  while ( my ($key,$value) = each %data) {
    push @pairs, $key . ' => ' . $value;
  }
  my $strparams =  join(', ', @pairs);

  $msg_syslog =    $event . " Params: " . $strparams;
  logCstaEvent($msg_syslog);


  if($event eq 'originated')
  {
    cstaOriginatedEvent($csta_server,$data{monitorCrossRefID},$data{callID},$data{callingDevice},$data{calledDevice},$data{cause});

  }
  elsif($event eq 'delivered')
  {
    cstaDeliveredEvent($csta_server,$data{monitorCrossRefID},$data{callID},$data{alertingDevice},$data{callingDevice},$data{calledDevice},$data{cause});

  }
  elsif($event eq 'established')
  {

  
    cstaEstablishedEvent($csta_server,$data{monitorCrossRefID},$data{callID},$data{answeringDevice},$data{callingDevice},$data{calledDevice},$data{cause});


  }
  elsif($event eq 'connection-cleared')
  {

    cstaConnectionClearedEvent($csta_server,$data{monitorCrossRefID},$data{callID},$data{releasingDevice},$data{cause});
  }
  elsif($event eq 'failed')
  {

    cstaFailedEvent($csta_server,$data{monitorCrossRefID},$data{callID},$data{failingDevice},$data{callingDevice},$data{calledDevice},$data{cause});
  }


}

sub logCstaEvent
{
    my ($log_content) = @_;
    if($csta_log_enabled == 1)
    {
      return `echo '$log_content \n' >> $csta_log_file &`;
    }
    return 0;
}







1;
