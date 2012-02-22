use Module::Build;
my $build = new Module::Build
(
  module_name    => 'File::Path::Stderr',
  license        => 'perl',
  requires       => {
                    },
  recommends     => {
                    },
  build_requires => {
                    },
  create_makefile_pl => 'traditional',
);
$build->create_build_script;
