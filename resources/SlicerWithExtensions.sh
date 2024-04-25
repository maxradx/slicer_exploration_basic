#!/bin/bash -e

# This is the username associated with the Slicer installation to share between users.
slicer_user=maximebouthillier # TODO: Update this line

script_dir=$(cd $(dirname $0) || exit 1; pwd)
script_name=$(basename $0)
echo "script dir ${script_dir}/ \n and script name: ${script_name}"

# launcher and launcher settings
# launcher=${script_dir}/Slicer
launcher=${script_dir}/Contents/MacOs/Slicer
launcher_settings=${script_dir}/Contents/bin/SlicerLauncherSettings.ini
echo "Launcher settings ........: ${launcher_settings}"

# sanity checks
if [ ! -f ${launcher} ]; then
  echo "${script_name} is expected to exist along side the Slicer launcher: ${launcher} not found"
  exit 1
fi
if [ ! -f ${launcher_settings} ]; then
  echo "${script_name} is expected to exist along side the Slicer launcher: ${launcher_settings} not found"
  exit 1
fi

# extract revision
revision=$(cat  ${launcher_settings} | grep revision= | cut -d= -f2)
echo "Revision .................: ${revision}"

echo "home = $HOME"


# revision user settings
# slicer_revision_user_settings=/home/${slicer_user}/.config/NA-MIC/Slicer-${revision}.ini
slicer_revision_user_settings=$HOME/.config/www.na-mic.org/Slicer-${revision}.ini
echo "Revision user settings ...: ${launcher_settings}"

# sanity check
if [ ! -f ${slicer_revision_user_settings} ]; then
  echo "Slicer revision user settings not found: ${slicer_revision_user_settings}"
  exit 1
fi

echo "revision user setting path: ${slicer_revision_user_settings}"

# extract additional module paths
# TODO Handle module path with spaces
additional_module_paths=$(cat  ${slicer_revision_user_settings} | grep AdditionalPaths= | cut -d= -f2 | tr -d ",")
echo "Additional module paths ..: ${additional_module_paths}"

QT_QPA_PLATFORM_PLUGIN_PATH=/Applications/Slicer.app/Contents/bin/Designer.app
echo "${QT_QPA_PLATFORM_PLUGIN_PATH} **********"

echo "test laucnher ${launcher}"
echo "$@ test "
${launcher} --launcher-additional-settings ${slicer_revision_user_settings} --additional-module-paths ${additional_module_paths} "$@"
# ${launcher} --additional-module-paths ${additional_module_paths} "$@"