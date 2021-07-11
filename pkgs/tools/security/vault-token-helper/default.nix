{ lib, fetchFromGitHub, buildGoModule }:

buildGoModule rec {
  pname = "vault-token-helper";
  version = "0.3.5";

  src = fetchFromGitHub {
    owner = "joemiller";
    repo = "vault-token-helper";
    rev = "v${version}";
    sha256 = "sha256-DOUZAu4iCKGSH2RRY/oV5iEXMczn0yqPg8eAbeH7LBU=";
  };

  vendorSha256 = "sha256-4A18ju5pXpFJTgGLBn7dTu6nVOs13HhQQUQlhDoT5Wk=";

  # Disable tests because it wants to use keyring backends...
  doCheck = false;

  meta = with lib; {
    description = "Vault Token Helper with support for native credential storage";
    homepage = "https://github.com/joemiller/vault-token-helper";
    license = licenses.mit;
    maintainers = with maintainers; [ citadelcore ];
  };
}
