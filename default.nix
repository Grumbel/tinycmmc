{ nixpkgs }:
let
  versionFromFileOr = project: fallback-version:
    let
      version_content = nixpkgs.lib.fileContents "${project}/VERSION";
      project_version =
        if (((builtins.substring 0 1) version_content) != "v") then
          "${fallback-version}-${nixpkgs.lib.substring 0 8 project.lastModifiedDate}-${project.shortRev or "dirty"}"
        else
          builtins.substring 1 ((builtins.stringLength version_content) - 1) version_content;
    in
      project_version;

  versionFromFile = project: versionFromFileOr project "unknown";

  lib = {
    inherit
      versionFromFileOr
      versionFromFile
    ;
  };
in
lib

