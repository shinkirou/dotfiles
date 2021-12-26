#!/usr/bin/env bash

function main() {
    # DEFAULT_SOURCE=$(pw-record --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: description="\(.*\)" prio=[[:digit:]]\+$/\1/p')
    # DEFAULT_SINK_ID=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*\([[:digit:]]\+\):.*$/\1/p')
    # DEFAULT_SINK=$(pw-play --list-targets | sed -n 's/^*[[:space:]]*[[:digit:]]\+: description="\(.*\)" prio=[[:digit:]]\+$/\1/p')

    action=$1
    if [ "${action}" == "up" ]; then
        pamixer --increase 2
    elif [ "${action}" == "down" ]; then
        pamixer --decrease 2
    elif [ "${action}" == "mute" ]; then
        pamixer --toggle-mute
    fi

    VOLUME=$(pamixer --get-volume-human)

    if [ "${VOLUME}" == "muted" ]; then
        ICON=""
        echo "%{F#5e81ac}%{T5}${ICON}%{T-}%{F-}"
    elif [[ "${VOLUME}" < 25 ]]; then
        ICON=""
        echo "%{F#5e81ac}%{T5}${ICON}%{T-}%{F-} ${VOLUME}"
    elif [[ "${VOLUME}" < 50 ]]; then
        ICON=""
        echo "%{F#5e81ac}%{T5}${ICON}%{T-}%{F-} ${VOLUME}"
    else
        ICON=""
        echo "%{F#5e81ac}%{T5}${ICON}%{T-}%{F-} ${VOLUME}"
    fi
}

main "$@"
