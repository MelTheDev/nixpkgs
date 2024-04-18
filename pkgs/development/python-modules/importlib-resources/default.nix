{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder

# build-system
, setuptools
, setuptools-scm

# dependencies
, importlib-metadata

# tests
, jaraco-collections
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "importlib-resources";
  version = "6.4.0";
  pyproject = true;

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    pname = "importlib_resources";
    inherit version;
    hash = "sha256-zbK0U7gEbKTjeY6x2E88zhRGoOjnte9O+2APGfw5gUU=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    importlib-metadata
  ];

  nativeCheckInputs = [
    pytestCheckHook
    jaraco-collections
  ];

  pythonImportsCheck = [
    "importlib_resources"
  ];

  meta = with lib; {
    description = "Read resources from Python packages";
    homepage = "https://importlib-resources.readthedocs.io/";
    license = licenses.asl20;
    maintainers = [ ];
  };
}
