# Run a map

```bash
bazel run :random_agent --define headless=false -- --width=640 --height=480 --level_script=lt_space_bounce_hard --length 10000
```

# Train agent

```bash
bazel run :random_agent
```