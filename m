Content-Type: multipart/mixed; boundary="===============3904953502903679722=="
MIME-Version: 1.0
From: Ira Weiny <ira.weiny@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/highmem] 61b205f579: WARNING:at_mm/highmem.c:#__kmap_local_sched_out
Date: Tue, 16 Mar 2021 00:37:57 -0700
Message-ID: <20210316073756.GQ3014244@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20210312062755.GA5022@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3904953502903679722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Adding Thomas.  Thomas I've been looking into the following test failure:

https://lore.kernel.org/lkml/20210304083825.GB17830(a)xsang-OptiPlex-9020/

See below.

On Fri, Mar 12, 2021 at 02:27:55PM +0800, Oliver Sang wrote:
> Hi Ira,
 =

[snip]

> > > >
> > > > caused below changes (please refer to attached dmesg/kmsg for entir=
e log/backtrace):
> > > =

> > > Is the fix for this been posted yet ?
> > =

> > No.  I've been unable to reproduce it yet.
> =

> just FYI
> the issue does not always happen but the rate on 61b205f579 is not low,
> while we didn't observe it happen on parent commit.
> =

> bb90d4bc7b6a536b 61b205f579911a11f0b576f7327
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>            :38          16%           6:38    dmesg.EIP:__kmap_local_sche=
d_in
>            :38          16%           6:38    dmesg.EIP:__kmap_local_sche=
d_out
>            :38          16%           6:38    dmesg.WARNING:at_mm/highmem=
.c:#__kmap_local_sched_in
>            :38          16%           6:38    dmesg.WARNING:at_mm/highmem=
.c:#__kmap_local_sched_out
> =

> also please permit me to quote our internal analysis by Zhengjun (cced)
> (Thanks a lot, Zhengjun)
> =

> "the commit has the potential to cause the issue.
> It replaces " kmap_atomic" to " kmap_local_page".
> =

> Most of the two API is the same, except for " kmap_atomic" disable preemp=
tion and cannot sleep.
> I check the issue happened when there is a preemption,  in FBC " kmap_loc=
al_page",
> the  preemption is enabled,  the issue may happen."
> "


I think I see the issue.  I think this is an invalid configuration.

00:26:43 > grep DEBUG_KMAP config-5.11.0-rc7-00002-g61b205f57991 =

CONFIG_DEBUG_KMAP_LOCAL=3Dy
CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP=3Dy

00:26:48 > grep DEBUG_HIGHMEM config-5.11.0-rc7-00002-g61b205f57991 =

# CONFIG_DEBUG_HIGHMEM is not set


DEBUG_KMAP_LOCAL causes guard pages to be added to the kmap_ctrl array.  But
DEBUG_HIGHMEM is used in __kmap_local_sched_out() to check the guard pages.

DEBUG_HIGHMEM is supposed to select DEBUG_KMAP_LOCAL...  but apparently that
did not happen when this configuration was made.

I still have not hit this condition in my testing.  Could you ensure that
DEBUG_HIGMEM is set and rerun the test to see if I am correct?

Thomas wouldn't the following enable checks make more sense?  Or perhaps be
more consistent with the processing of kmap_ctrl?

Ira

diff --git a/mm/highmem.c b/mm/highmem.c
index 86f2b9495f9c..6ef8f5e05e7e 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -618,7 +618,7 @@ void __kmap_local_sched_out(void)
                int idx;
 =

                /* With debug all even slots are unmapped and act as guard =
*/
-               if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
+               if (IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL) && !(i & 0x01)) {
                        WARN_ON_ONCE(!pte_none(pteval));
                        continue;
                }
@@ -654,7 +654,7 @@ void __kmap_local_sched_in(void)
                int idx;
 =

                /* With debug all even slots are unmapped and act as guard =
*/
-               if (IS_ENABLED(CONFIG_DEBUG_HIGHMEM) && !(i & 0x01)) {
+               if (IS_ENABLED(CONFIG_DEBUG_KMAP_LOCAL) && !(i & 0x01)) {
                        WARN_ON_ONCE(!pte_none(pteval));
                        continue;
                }



--===============3904953502903679722==--

