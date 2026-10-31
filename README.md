# Shiquan fused LiDAR viewer (20261026)

Live viewer: https://teryzh.github.io/shiquan-lidar-viewer/

Double-click `start_viewer.bat`, or run `python -m http.server 8765` in this folder and open
http://localhost:8765/index.html (opening index.html directly does not work: browsers block local data reads).

Works offline (three.js r160 bundled in `vendor/`). Desktop and mobile browsers.

Data per intersection (`data/<site>.bin`, little-endian):
uint32 c0[F], uint32 c1[F] (moving points per frame, LiDAR_0 / LiDAR_1), then int16 xyz in cm for:
background LiDAR_0 (nbg0 pts), background LiDAR_1 (nbg1), moving LiDAR_0 (all frames), moving LiDAR_1 (all frames).
All coordinates are in the ground-leveled LiDAR_0 frame G (x = LiDAR_0 heading, z up, origin on the ground under LiDAR_0).
`data/meta.json`: counts, frame times (s), clock offset dt, baseline, LiDAR_1 position/yaw, sensor heights.
F = 300 synchronized frame pairs (30 s at 10 Hz), the 30 s with the most traffic in the extracted 150 s window.
