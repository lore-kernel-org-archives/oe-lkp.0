Content-Type: multipart/mixed; boundary="===============8487442223045033374=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Thu, 16 Jun 2016 07:42:07 +0800
Message-ID: <87bn32xbn4.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160614133807.GA16342@bbox>
List-Id: <oe-lkp.lists.linux.dev>

--===============8487442223045033374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Minchan Kim <minchan@kernel.org> writes:

> On Mon, Jun 13, 2016 at 05:02:15PM +0800, Huang, Ying wrote:
>> Linus Torvalds <torvalds@linux-foundation.org> writes:
>> =

>> > On Sat, Jun 11, 2016 at 5:49 PM, Huang, Ying <ying.huang@intel.com> =
wrote:
>> >>
>> >> From perf profile, the time spent in page_fault and its children
>> >> functions are almost same (7.85% vs 7.81%).  So the time spent in page
>> >> fault and page table operation itself doesn't changed much.  So, you
>> >> mean CPU may be slower to load the page table entry to TLB if accessed
>> >> bit is not set?
>> >
>> > So the CPU does take a microfault internally when it needs to set the
>> > accessed/dirty bit. It's not architecturally visible, but you can see
>> > it when you do timing loops.
>> >
>> > I've timed it at over a thousand cycles on at least some CPU's, but
>> > that's still peanuts compared to a real page fault. It shouldn't be
>> > *that* noticeable, ie no way it's a 6% regression on its own.
>> =

>> I done some simple counting, and found that about 3.15e9 PTE are set to
>> old during the test after the commit.  This may interpret the user_time
>> increase as below, because these accessed bit microfault is accounted as
>> user time.
>> =

>>     387.66 .  0%      +5.4%     408.49 .  0%  unixbench.time.user_time
>> =

>> I also make a one line debug patch as below on top of the commit to set
>> the PTE to young unconditionally, which recover the regression.
>
> With this patch, meminfo.Active(file) is almost same unlike previous
> experiment?

Yes.  meminfo.Active(file) is almost same of that of the parent commit of
the first bad commit.

Best Regards,
Huang, Ying

>> =

>> modified   mm/filemap.c
>> @@ -2193,7 +2193,7 @@ repeat:
>>  		if (file->f_ra.mmap_miss > 0)
>>  			file->f_ra.mmap_miss--;
>>  		addr =3D address + (page->index - vmf->pgoff) * PAGE_SIZE;
>> -		do_set_pte(vma, addr, page, pte, false, false, true);
>> +		do_set_pte(vma, addr, page, pte, false, false, false);
>>  		unlock_page(page);
>>  		atomic64_inc(&old_pte_count);
>>  		goto next;
>> =

>> Best Regards,
>> Huang, Ying

--===============8487442223045033374==--

