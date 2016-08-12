# Author: Jérémy POSE
# v1.0 / 11/08/2016

package Apache::Ocsinventory::Plugins::Fwstate::Map;
 
use strict;
 
use Apache::Ocsinventory::Map;
#Plugin FWSTATE
$DATA_MAP{fwstate} = {
		mask => 0,
		multi => 1,
		auto => 1,
		delOnReplace => 1,
		sortBy => 'DOMAINSTATE',
		writeDiff => 0,
		cache => 0,
		mandatory => 1,
		fields => {
                        DOMAINSTATE => {},
                        PRIVATESTATE => {},
                        PUBLICSTATE => {},
	}
};
1;
