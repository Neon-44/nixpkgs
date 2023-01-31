{stdenvNoCC, fetchFromGitHub, bash, ...}:

stdenvNoCC.mkDerivation rec {
    
    outDirectory = "$out/etc/udev/rules.d"; #put it in out/etc instead of out/lib for compatibility with the steamPackages/steam package


    pname = "steam-devices";
    version = "2021-08-25";

    src = fetchFromGitHub{
        owner = "ValveSoftware";
        repo = "steam-devices";
        rev = "d87ef558408c5e7a1a793d738db4c9dc2cb5f8fa";
        sha256 = "pNAmXfj7PK/QHypSYFKCTSl7+rrCFlVRACm49FV+Efs=";
    };

    installPhase = ''
    mkdir -p ${outDirectory}
    cp *.rules ${outDirectory}
    substituteInPlace ${outDirectory} \
      --replace "/bin/sh" "${bash}/bin/bash"
    '';
}
