# Name for the new window inside current session
window_name="monitoring"

# Create new window in the current session and run sensors
tmux new-window -n "$window_name" 'watch -n2 --differences --color sensors'

# Split that window vertically and run btop in the new pane
tmux split-window -v -t "$window_name" 'btop'

# Focus the top pane (sensors), assuming pane-base-index is 1
tmux select-pane -t "$window_name".1
