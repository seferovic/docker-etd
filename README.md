# docker-etd
edu.ldap ETD Component

## Configuration

One ETD container needs to be configured per AD-instance, but all may run from the same image.
Each instance requires a separate conf.sh and etd.conf.

conf.sh is used for dev/test, not for openshift. 

### conf.sh 

- Establish network connection to the OpenLDAP container (NETWORKSETTINGS)
- Adapt volume mapping (instance number)

### etd.conf
 
- Adapt endpoints, credentials, DNs and other instance-specific settings
- Note: Target-Id has a dual purpose: set the directory in path, and triggers the specif DN-Rules
  for isntance #08