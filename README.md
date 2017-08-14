# docker-etd
edu.ldap ETD Component

## Configuration

(Currently) one ETD image needs to be built per AD-instance. (To be refactored)
Each instance requires a separate conf.sh and etd.conf.

### conf.sh 

conf.sh is used for dev/test, not for openshift. 

- Establish network connection to the OpenLDAP container (NETWORKSETTINGS)
- Adapt volume mapping (instance number)

### secrets/etd.conf

- Adapt endpoints, credentials, DNs and other instance-specific settings
- Note: Target-Id has a dual purpose: set the directory in path, and triggers the specif DN-Rules
  for instance #08

### secrets/certificates.pem
- TLS root certificates 

## Operation

  ./dscripts/build.sh
  ./dscripts/run.sh -i  # interrupt when printinbg "finishing: sleeping"
  ./dscripts/run.sh -i  bash  # resulting files are in  /opt/data/out/PH08/
  
Currently only differences for entries existing in the source tree are reported. If there is no 
source input, there is no output. Possible reasons: source tree is empty, or dn configuration is
broken.

  

