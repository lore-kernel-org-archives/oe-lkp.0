Content-Type: multipart/mixed; boundary="===============8582804328145962481=="
MIME-Version: 1.0
From: Yin, Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 016a23388c: stress-ng.xattr.ops_per_sec 58.4% improvement
Date: Tue, 02 Aug 2022 14:36:00 +0800
Message-ID: <9d4e37e2-417e-7a2f-a187-5c7b680c6777@intel.com>
In-Reply-To: <20220721220142.GW3861211@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============8582804328145962481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On 7/22/2022 6:01 AM, Dave Chinner wrote:
> A huge amount of spinlock contention in the xlog_commit_cil() path
> went away. The commit identified doesn't remove/change any
> spinlocks, it actually adds more overhead to the critical section of
> the above spinlock in preparation for removing said spinlocks.
> =

> That removal happens in the next commit in that series - c0fb4765c508 ("x=
fs:
> convert CIL to unordered per cpu lists") - so I'd be expecting a
> bisect to demonstrate that the spinlock contention goes away with
> the commit that removed the spinlocks (as it does in all the testing
> of this I've done over the past 2 years), not the commit this bisect
> identified. Hence I think the bisect went wrong somewhere...

We did some investigation and got:

commit:
  df7a4a2134b0a ("xfs: convert CIL busy extents to per-cpu")
  016a23388cdcb ("xfs: Add order IDs to log items in CIL")
  c0fb4765c5086 ("xfs: convert CIL to unordered per cpu lists")

df7a4a2134b0a201 016a23388cdcb2740deb1379dc4 c0fb4765c5086cfd00f1158f5f4
---------------- --------------------------- ---------------------------
         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \
     62.07            +0.0%      62.09            -0.0%      62.06        s=
tress-ng.time.elapsed_time
     62.07            +0.0%      62.09            -0.0%      62.06        s=
tress-ng.time.elapsed_time.max
      2237            +0.0%       2237            +0.0%       2237        s=
tress-ng.time.file_system_inputs
      1842 =C2=B1  4%     +16.9%       2152 =C2=B1  3%     +17.6%       216=
6        stress-ng.time.involuntary_context_switches
    551.00            -0.3%     549.10            -0.3%     549.40        s=
tress-ng.time.major_page_faults
      6376            -1.1%       6305 =C2=B1  2%      +0.6%       6416    =
    stress-ng.time.maximum_resident_set_size
      9704            -0.3%       9676            -0.1%       9691        s=
tress-ng.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        s=
tress-ng.time.page_size
    841.90            -2.4%     821.70            -2.4%     821.90        s=
tress-ng.time.percent_of_cpu_this_job_got
    512.83            -3.4%     495.24            -3.6%     494.18        s=
tress-ng.time.system_time
     10.05 =C2=B1  8%     +52.3%      15.30 =C2=B1  3%     +61.1%      16.1=
9 =C2=B1  2%  stress-ng.time.user_time
      2325 =C2=B1 16%     +66.5%       3873 =C2=B1  7%     +70.3%       396=
2 =C2=B1  6%  stress-ng.time.voluntary_context_switches
      1544 =C2=B1  4%     +54.4%       2385           +63.9%       2531    =
    stress-ng.xattr.ops

Yes. commit c0fb4765c5086 ("xfs: convert CIL to unordered per cpu lists")
could bring performance gain also. But the most performance gain (54.4%)
is from commit 016a23388cdcb ("xfs: Add order IDs to log items in CIL").


Based on commit 016a23388cdcb and add following change:

diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index 6bc540898e3a..7c6c91a0a12d 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -659,9 +659,14 @@ xlog_cil_insert_items(
                        continue;
 =

                lip->li_order_id =3D order;
-               if (!list_empty(&lip->li_cil))
-                       continue;
-               list_add_tail(&lip->li_cil, &cil->xc_cil);
+
+               /*
+                * Only move the item if it isn't already at the tail. This=
 is
+                * to prevent a transient list_empty() state when reinserti=
ng
+                * an item that is already the only item in the CIL.
+                */
+               if (!list_is_last(&lip->li_cil, &cil->xc_cil))
+                       list_move_tail(&lip->li_cil, &cil->xc_cil);
        }

The performance will drop to the same level as commit df7a4a2134b0a
 ("xfs: convert CIL busy extents to per-cpu"):

commit: =

  016a23388cdcb2740deb1379dc408f21c84efb11
  a8bef09e7d8e65207c8403e030a0965db43ce3de

016a23388cdcb274 a8bef09e7d8e65207c8403e030a =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     62.06            -0.0%      62.05        stress-ng.time.elapsed_time
     62.06            -0.0%      62.05        stress-ng.time.elapsed_time.m=
ax
      2237            +0.0%       2237        stress-ng.time.file_system_in=
puts
      2226           -16.7%       1855 =C2=B1  4%  stress-ng.time.involunta=
ry_context_switches
    549.00            +0.5%     551.67        stress-ng.time.major_page_fau=
lts
      6286            +0.1%       6292        stress-ng.time.maximum_reside=
nt_set_size
      9636            +0.1%       9641        stress-ng.time.minor_page_fau=
lts
      4096            +0.0%       4096        stress-ng.time.page_size
    823.00            +3.0%     847.33        stress-ng.time.percent_of_cpu=
_this_job_got
    496.02            +4.2%     516.61        stress-ng.time.system_time
     15.08           -38.1%       9.33 =C2=B1  4%  stress-ng.time.user_time
      4034 =C2=B1  3%     -43.0%       2299 =C2=B1  6%  stress-ng.time.volu=
ntary_context_switches
      2368           -37.4%       1482 =C2=B1  4%  stress-ng.xattr.ops



Regards
Yin, Fengwei
--===============8582804328145962481==--

