{ stdenv, fetchFromGitHub, boost, cmake, libuv, libmsgpack}:

with stdenv.lib;

let
  dds = stdenv.mkDerivation rec {
    name = "dds-${version}";
    version = "2.1";

    src = fetchFromGitHub {
      owner = "FairRootGroup";
      repo = "DDS";
      rev = "2.1";
      sha256 = "0s2l6988piwgd84s7s8x46mh4h1nj9x88l2sgw1b0d535fkb40l7";
    };

    enableParallelBuilding = true;

    buildInputs = [
      boost
      libuv
      libmsgpack
    ];

    nativeBuildInputs = [
      cmake
    ];

    cmakeFlags = [
    ];

    # triggers on buffer overflow bug while running tests
    #hardeningDisable = [ "fortify" ];

    meta = {
      description = "The Dynamic Deployment System";
      longDescription = ''
        The Dynamic Deployment System (DDS) - is a tool-set that automates and
        significantly simplifies a deployment of user defined processes and
        their dependencies on any resource management system using a given
        topology.
      '';
      homepage    = http://dds.gsi.de;
      license = with licenses; [ lgpl3 ];
      maintainers = with maintainers; [ ktf ];
      platforms   = platforms.unix;
    };
  };

in
  dds
