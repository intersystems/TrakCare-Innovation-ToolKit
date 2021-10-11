#!/bin/bash
# Usage install.sh [instanceName] [password] [namespace]

die () {
    echo >&3 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "Usage install.sh [instanceName] [password] [Namespace]"

DIR=$(dirname $0)
if [ "$DIR" = "." ]; then
DIR=$(pwd)
fi

instanceName=$1
password=$2
NameSpace=$3

# Installer source (Installer.*.cls)
ClassImportDir=$DIR/misc
# Source dir install by source installer
DirSrc=$DIR/src



irissession $instanceName -U USER <<EOF


zn "HSLIB"
w ##class(HS.Util.Installer.Foundation).Install("$NameSpace")


zn "$NameSpace"
Set source="$DirSrc"
w !,"source path:",source
set sc = \$system.OBJ.ImportDir(source,"*.cls;*.inc;*.mac;*.xml","cubk",.errors,1)
zw errors
do:(sc'=1) \$system.Process.Terminate(,1),h
write "compile sources  done"

write !,"start installing FHIR "

do ##class(TC.hmf.FHIR.Installer.FHIR).InstallDemo(source)

write !,"installing FHIR completed"

halt
EOF
