#!/bin/sh
#
TAG=jb-ep-5-win-candidate
VM=jboss-natives-20110516-1
CMD=win-build
for o
do
    case $o in
        --tag=* )
            TAG="`sed 's/.*=//'`"
            shift
        ;;
        --vm=* )
            VM="`sed 's/.*=//'`"
            shift
        ;;
        --*    )
            CMD="$CMD $o"
            shift
        ;;
        *      )
          echo "Unknown option $o"
          exit 1
        ;;
    esac
done
HEAD=`svn info http://anonsvn.jboss.org/repos/xbuild/trunk | grep Revision: | sed 's/.*: //'`
echo "$CMD $TAG svn+http://anonsvn.jboss.org/repos/xbuild?trunk#$HEAD $VM"
brew $CMD $TAG svn+http://anonsvn.jboss.org/repos/xbuild?trunk#$HEAD $VM
