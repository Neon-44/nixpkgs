{ buildGoModule
, fetchFromGitHub
, lib
}:

buildGoModule rec {
  pname = "gau";
  version = "2.0.9";

  src = fetchFromGitHub {
    owner = "lc";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-8op515+0wDxxU1e08gJ6lg/8NhQScFb4b3mCzBV/VNw=";
  };

  vendorSha256 = "sha256-HQATUCzYvhhlqe4HhNu9H4CqmY2IGLNJ9ydt3/igSmQ=";

  meta = with lib; {
    description = "Tool to fetch known URLs";
    longDescription = ''
      getallurls (gau) fetches known URLs from various sources for any
      given domain.
    '';
    homepage = "https://github.com/lc/gau";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
