
#!/bin/bash
lynis audit --tests-from-group malware,authentication,networking,storage,filesystems >> /tmp/lynis_scan.log