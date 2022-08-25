Content-Type: multipart/mixed; boundary="===============0659973453218333871=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: [PATCH v2 0/3] memcg: optimize charge codepath
Date: Thu, 25 Aug 2022 00:05:03 +0000
Message-ID: <20220825000506.239406-1-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0659973453218333871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Recently Linux networking stack has moved from a very old per socket
pre-charge caching to per-cpu caching to avoid pre-charge fragmentation
and unwarranted OOMs. One impact of this change is that for network
traffic workloads, memcg charging codepath can become a bottleneck. The
kernel test robot has also reported this regression[1]. This patch
series tries to improve the memcg charging for such workloads.

This patch series implement three optimizations:
(A) Reduce atomic ops in page counter update path.
(B) Change layout of struct page_counter to eliminate false sharing
    between usage and high.
(C) Increase the memcg charge batch to 64.

To evaluate the impact of these optimizations, on a 72 CPUs machine, we
ran the following workload in root memcg and then compared with scenario
where the workload is run in a three level of cgroup hierarchy with top
level having min and low setup appropriately.

 $ netserver -6
 # 36 instances of netperf with following params
 $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K

Results (average throughput of netperf):
1. root memcg		21694.8 Mbps
2. 6.0-rc1		10482.7 Mbps (-51.6%)
3. 6.0-rc1 + (A)	14542.5 Mbps (-32.9%)
4. 6.0-rc1 + (B)	12413.7 Mbps (-42.7%)
5. 6.0-rc1 + (C)	17063.7 Mbps (-21.3%)
6. 6.0-rc1 + (A+B+C)	20120.3 Mbps (-7.2%)

With all three optimizations, the memcg overhead of this workload has
been reduced from 51.6% to just 7.2%.

[1] https://lore.kernel.org/linux-mm/20220619150456.GB34471(a)xsang-OptiPle=
x-9020/

Changes since v1:
- Commit message updates
- Instead of explicit padding add align compiler option with struct

Shakeel Butt (3):
  mm: page_counter: remove unneeded atomic ops for low/min
  mm: page_counter: rearrange struct page_counter fields
  memcg: increase MEMCG_CHARGE_BATCH to 64

 include/linux/memcontrol.h   |  7 ++++---
 include/linux/page_counter.h | 34 +++++++++++++++++++++++-----------
 mm/page_counter.c            | 13 ++++++-------
 3 files changed, 33 insertions(+), 21 deletions(-)

-- =

2.37.1.595.g718a3a8f04-goog

--===============0659973453218333871==--

