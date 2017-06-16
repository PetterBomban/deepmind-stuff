# run a map
bazel run :random_agent --define headless=false -- --width=640 --height=480 --level_script=lt_space_bounce_hard --length 10000

# train agent
bazel run :random_agent
