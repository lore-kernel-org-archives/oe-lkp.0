Content-Type: multipart/mixed; boundary="===============8049805670360223601=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [mm/filemap] cbd59c48ae: fxmark.hdd_ext4_no_jnl_DRBM_9_bufferedio.works/sec -7.6% regression
Date: Tue, 09 Mar 2021 13:05:27 +0000
Message-ID: <20210309130527.GK3479805@casper.infradead.org>
In-Reply-To: <20210309075706.GB12057@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8049805670360223601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 03:57:06PM +0800, kernel test robot wrote:
> FYI, we noticed a -7.6% regression of fxmark.hdd_ext4_no_jnl_DRBM_9_buffe=
redio.works/sec due to commit:
> =

> commit: cbd59c48ae2bcadc4a7599c29cf32fd3f9b78251 ("mm/filemap: use head p=
ages in generic_file_buffered_read")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fxmark
> on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz wit=
h 80G memory

Can you send me one of those to test on?  ;-)

>          %stddev     %change         %stddev
>              \          |                \  =

>       0.05 =C2=B1  5%     -10.1%       0.05 =C2=B1  3%  fxmark.hdd_ext4_n=
o_jnl_DRBM_18_bufferedio.softirq_util
>    4168491            -7.6%    3849925        fxmark.hdd_ext4_no_jnl_DRBM=
_9_bufferedio.works/sec
>     300.00            +2.1%     306.16        fxmark.time.system_time
>      87.53            -6.7%      81.69        fxmark.time.user_time
>     784.83 =C2=B1  5%     +23.6%     970.33 =C2=B1  7%  perf-sched.wait_a=
nd_delay.count.preempt_schedule_common.__cond_resched.copy_page_to_iter.gen=
eric_file_buffered_read.new_sync_read

23% more delay while preempted copying to user?  That seems bad, but I
don't see anything in this commit that would cause that.

>       7.59            -7.6        0.00        perf-profile.calltrace.cycl=
es-pp.find_get_pages_contig.filemap_get_pages.generic_file_buffered_read.ne=
w_sync_read.vfs_read

That makes sense; we don't call find_get_pages_contig() any more, instead
we call ...

>       0.00           +11.9       11.90        perf-profile.calltrace.cycl=
es-pp.filemap_get_read_batch.filemap_get_pages.generic_file_buffered_read.n=
ew_sync_read.vfs_read

filemap_get_read_batch() ... which is more expensive ;-(

                if (PageReadahead(head))
                        break;
+		if (!PageHead(head))
+			continue;
                xas.xa_index =3D head->index + thp_nr_pages(head) - 1;
                xas.xa_offset =3D (xas.xa_index >> xas.xa_shift) & XA_CHUNK=
_MASK;

might be worth a try, but I have a medical appointment to get to.
I'll test it out later.

--===============8049805670360223601==--

