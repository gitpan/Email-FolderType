    use ExtUtils::MakeMaker;
    WriteMakefile
      ('DISTNAME' => 'Email-FolderType',
       'VERSION' => '0.5',
       'PL_FILES' => {},
       'PREREQ_PM' => {
			'Test::More' => '0',

		      },
      );
