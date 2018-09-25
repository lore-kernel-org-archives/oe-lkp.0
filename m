Content-Type: multipart/mixed; boundary="===============4612117870737476084=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] 6209f6fc62: general_protection_fault:#[##]
Date: Tue, 25 Sep 2018 09:59:39 +0200
Message-ID: <20180925075939.GP18685@dhcp22.suse.cz>
In-Reply-To: <917270d5-8755-b0d6-60c4-871f8c7ff982@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4612117870737476084==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 25-09-18 15:43:22, Rong Chen wrote:
> =

> =

> On 09/25/2018 03:31 PM, Michal Hocko wrote:
> > On Tue 25-09-18 15:00:15, Rong Chen wrote:
> > > =

> > > On 09/25/2018 02:06 PM, Michal Hocko wrote:
> > > > On Tue 25-09-18 13:48:20, kernel test robot wrote:
> > > > > FYI, we noticed the following commit (built with gcc-7):
> > > > > =

> > > > > commit: 6209f6fc62835d84c2a92d237588a114e39436ce ("mm, oom: rewor=
k mmap_exit vs. oom_reaper synchronization")
> > > > > https://github.com/0day-ci/linux UPDATE-20180911-024633/Tetsuo-Ha=
nda/mm-oom-Fix-unnecessary-killing-of-additional-processes/20180910-163452
> > > > Do you have a msg-id to the patch that has been tested?
> > > message_id: 20180910125513.311-2-mhocko(a)kernel.org
> > Thanks! It woudl be really great if this was a part of the report when
> > testing patches which are not mainline yet.
> > =

> > This patch resulting in a crash is quite surprising. The patch is RFC
> > and not tested yet but I will definitely have a look. Could you help me
> > some more and give faddr2line __oom_reap_task_mm+0x40 please?
> $ faddr2line ./vmlinux __oom_reap_task_mm+0x40
> __oom_reap_task_mm+0x40/0x175:
> can_madv_dontneed_vma at mm/internal.h:48
> =C2=A0(inlined by) __oom_reap_task_mm at mm/oom_kill.c:505

OK, this suggests the vma is gone. The problem is that I have removed
MMF_OOM_SKIP from the exit path and mm->mmap still points to the freed
memory. Later patch in the series does the later so the resulting code
is safe but not bisect safe. I will return MMF_OOM_SKIP setting to the
exit_mmap path and that should cure the issue.

diff --git a/mm/mmap.c b/mm/mmap.c
index 3481424717ac..a02b314c0546 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -3083,8 +3083,10 @@ void exit_mmap(struct mm_struct *mm)
 	unmap_vmas(&tlb, vma, 0, -1);
 =

 	/* oom_reaper cannot race with the page tables teardown */
-	if (oom)
+	if (oom) {
 		down_write(&mm->mmap_sem);
+		set_bit(MMF_OOM_SKIP, &mm->flags);
+	}
 =

 	free_pgtables(&tlb, vma, FIRST_USER_ADDRESS, USER_PGTABLES_CEILING);
 	tlb_finish_mmu(&tlb, 0, -1);
diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index f10aa5360616..b7137ca9c7a2 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -554,7 +554,7 @@ static bool oom_reap_task_mm(struct task_struct *tsk, s=
truct mm_struct *mm)
 	 * MMF_OOM_SKIP is set by exit_mmap when the OOM reaper can't
 	 * work on the mm anymore. The check for MMF_OOM_SKIP must run
 	 * under mmap_sem for reading because it serializes against the
-	 * down_write();up_write() cycle in exit_mmap().
+	 * down_write() in exit_mmap().
 	 */
 	if (test_bit(MMF_OOM_SKIP, &mm->flags)) {
 		trace_skip_task_reaping(tsk->pid);
-- =

Michal Hocko
SUSE Labs

--===============4612117870737476084==--

