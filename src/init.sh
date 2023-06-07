
EXIT_WITH_ERROR=1
EXIT_WITH_SUCCESS=0

SRC_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

source "$SRC_PATH/core/path.sh"
source "$SRC_PATH/core/vendor.sh"
source "$SRC_PATH/core/format.sh"
source "$SRC_PATH/core/general.sh"
source "$SRC_PATH/core/theme.sh"
source "$SRC_PATH/core/color.sh"
source "$SRC_PATH/core/progress.sh"
source "$SRC_PATH/core/show.sh"
source "$SRC_PATH/core/shape.sh"
source "$SRC_PATH/core/option.sh"
source "$SRC_PATH/core/help.sh"
source "$SRC_PATH/core/test.sh"
