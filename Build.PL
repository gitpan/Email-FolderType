use strict;
use Module::Build;

Module::Build
  ->new( module_name => "Email::FolderType",
         license     => 'perl',
         requires    => { 
						  'Test::More' => 0,
                        },
         sign => 1,
       )
  ->create_build_script;
