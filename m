Content-Type: multipart/mixed; boundary="===============3032080309033318403=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 8cc621d2f4: fio.write_iops -21.8% regression
Date: Fri, 21 May 2021 13:29:07 +0800
Message-ID: <89e2b66b-c706-c020-bff5-b815dcd5c461@intel.com>
In-Reply-To: <YKasEeXCr9R5yzCr@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3032080309033318403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Minchan,

On 5/21/2021 2:36 AM, Minchan Kim wrote:
> On Thu, May 20, 2021 at 04:31:44PM +0800, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed a -21.8% regression of fio.write_iops due to commit:
>>
>>
>> commit: 8cc621d2f45ddd3dc664024a647ee7adf48d79a5 ("mm: fs: invalidate BH=
 LRU during page migration")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>>
>> in testcase: fio-basic
>> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2=
.10GHz with 256G memory
>> with following parameters:
>>
>> 	disk: 2pmem
>> 	fs: ext4
>> 	runtime: 200s
>> 	nr_task: 50%
>> 	time_based: tb
>> 	rw: randwrite
>> 	bs: 4k
>> 	ioengine: libaio
>> 	test_size: 200G
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003006
>>
>> test-description: Fio is a tool that will spawn a number of threads or p=
rocesses doing a particular type of I/O action as specified by the user.
>> test-url: https://github.com/axboe/fio
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install                job.yaml  # job file is attached=
 in this email
>>          bin/lkp split-job --compatible job.yaml  # generate the yaml fi=
le for lkp run
>>          bin/lkp run                    generated-yaml-file
> Hi,
>
> I tried to insall the lkp-test in my machine by following above guide but=
 failed
> due to package problems(I guess it's my problem since I use something par=
ticular
> environement). However, I guess it comes from increased miss ratio of bh_=
lrus
> since the patch caused more frequent invalidation of the bh_lrus calls co=
mpared
> to old. For example, lru_add_drain could be called from several hot place=
s(e.g.,
> unmap and pagevec_release from several path) and it could keeps invalidat=
ing
> bh_lrus.
>
> IMO, we should move the overhead from such hot path to cold one. How abou=
t this?
>
> >From ebf4ede1cf32fb14d85f0015a3693cb8e1b8dbfe Mon Sep 17 00:00:00 2001
> From: Minchan Kim <minchan@kernel.org>
> Date: Thu, 20 May 2021 11:17:56 -0700
> Subject: [PATCH] invalidate bh_lrus only at lru_add_drain_all
>
> Not-Yet-Signed-off-by: Minchan Kim <minchan@kernel.org>
> ---
>   mm/swap.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/mm/swap.c b/mm/swap.c
> index dfb48cf9c2c9..d6168449e28c 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -642,7 +642,6 @@ void lru_add_drain_cpu(int cpu)
>   		pagevec_lru_move_fn(pvec, lru_lazyfree_fn);
>   =

>   	activate_page_drain(cpu);
> -	invalidate_bh_lrus_cpu(cpu);
>   }
>   =

>   /**
> @@ -725,6 +724,17 @@ void lru_add_drain(void)
>   	local_unlock(&lru_pvecs.lock);
>   }
>   =

> +void lru_and_bh_lrus_drain(void)
> +{
> +	int cpu;
> +
> +	local_lock(&lru_pvecs.lock);
> +	cpu =3D smp_processor_id();
> +	lru_add_drain_cpu(cpu);
> +	local_unlock(&lru_pvecs.lock);
> +	invalidate_bh_lrus_cpu(cpu);
> +}
> +
>   void lru_add_drain_cpu_zone(struct zone *zone)
>   {
>   	local_lock(&lru_pvecs.lock);
> @@ -739,7 +749,7 @@ static DEFINE_PER_CPU(struct work_struct, lru_add_dra=
in_work);
>   =

>   static void lru_add_drain_per_cpu(struct work_struct *dummy)
>   {
> -	lru_add_drain();
> +	lru_and_bh_lrus_drain();
>   }
>   =

>   /*
> @@ -881,6 +891,7 @@ void lru_cache_disable(void)
>   	__lru_add_drain_all(true);
>   #else
>   	lru_add_drain();
> +	invalidate_bh_lrus_cpu(smp_processor_id());
>   #endif
>   }
>   =

I test the patch, the regression reduced to -2.9%.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/disk/fs/runtime/nr_task/time_ba=
sed/rw/bs/ioengine/test_size/cpufreq_governor/ucode:
lkp-csl-2sp6/fio-basic/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-=
9/2pmem/ext4/200s/50%/tb/randwrite/4k/libaio/200G/performance/0x5003006

commit:
 =C2=A0 361a2a229fa31ab7f2b236b5946e434964d00762
 =C2=A0 8cc621d2f45ddd3dc664024a647ee7adf48d79a5
 =C2=A0 7bafb1c4e72a5e8d40cd0681b80b1ffeb31a064c=C2=A0 (the test patch)

361a2a229fa31ab7 8cc621d2f45ddd3dc664024a647 7bafb1c4e72a5e8d40cd0681b80
---------------- --------------------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=
=A0=C2=A0=C2=A0=C2=A0 %change %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.0=
 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

fio.latency_1000ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.27 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1=C2=A0 =
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0.27 =C2=B1=C2=A0 =

5%=C2=A0 fio.latency_10ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.0=
 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

fio.latency_2000ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1=C2=A0 =
7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0.36 =C2=B1=C2=A0 =

9%=C2=A0 fio.latency_20ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.0=
 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

fio.latency_500ms%
 =C2=A0=C2=A0=C2=A0=C2=A0 13.99=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.96=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.5=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14.52 =C2=B1=C2=A0 =

4%=C2=A0 fio.latency_50ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.0=
 0.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

fio.latency_750ms%
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.40 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.17 =C2=B1 46%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.59 =
=C2=B1 =

35%=C2=A0 fio.latency_750us%
 =C2=A0 62087973=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -21.8%=C2=A0=C2=A0 48559860=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -2.8%=C2=A0=C2=A0 60364160 =C2=B1=C2=A0 =

3%=C2=A0 fio.workload
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1212=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -21.8%=C2=A0=C2=A0=C2=A0=C2=A0 948.29=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -2.9%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 1177 =C2=B1=C2=A0 =

3%=C2=A0 fio.write_bw_MBps
 =C2=A0 33073834=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -11.6%=C2=A0=C2=A0 29229056=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -1.3%=C2=A0=C2=A0 32636928 =C2=B1=C2=A0 =

4%=C2=A0 fio.write_clat_95%_us
 =C2=A0 34865152=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -9.1%=C2=A0=C2=A0 31675733=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -0.3% 34760294=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =

fio.write_clat_99%_us
 =C2=A0=C2=A0 4794125=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 +27.9%=C2=A0=C2=A0=C2=A0 6129631=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.0%=C2=A0=C2=A0=C2=A0 4936772 =C2=B1=C2=A0 =

3%=C2=A0 fio.write_clat_mean_us
 =C2=A0 13179671 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -10.1%=C2=A0=C2=A0=
 11842274=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 -3.9%=C2=A0=C2=A0 12665456 =C2=B1=C2=A0 =

5%=C2=A0 fio.write_clat_stddev
 =C2=A0=C2=A0=C2=A0 310403=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -21.8%=C2=A0=C2=A0=C2=A0=C2=A0 242761=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -2.9%=C2=A0=C2=A0=C2=A0=C2=A0 30=
1531 =C2=B1=C2=A0 =

3%=C2=A0 fio.write_iops
 =C2=A0=C2=A0=C2=A0 152653=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +28.9%=C2=A0=C2=A0=C2=A0=C2=A0 196759=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.2%=C2=A0=C2=A0=C2=A0=C2=A0 15=
7562 =C2=B1=C2=A0 =

3%=C2=A0 fio.write_slat_mean_us
 =C2=A0=C2=A0 2139749=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +9.3%=C2=A0=C2=A0=C2=A0 2338598=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.8% 2179116=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =

fio.write_slat_stddev

When build kernel, there is a warning for the patch:

All warnings (new ones prefixed by >>):

>> mm/swap.c:727:6: warning: no previous prototype for 'lru_and_bh_lrus_dra=
in' [-Wmissing-prototypes]

      727 | void lru_and_bh_lrus_drain(void)
          |      ^~~~~~~~~~~~~~~~~~~~~


vim +/lru_and_bh_lrus_drain +727 mm/swap.c

    726	=

  > 727	void lru_and_bh_lrus_drain(void)
    728	{
    729		int cpu;
    730	=

    731		local_lock(&lru_pvecs.lock);
    732		cpu =3D smp_processor_id();
    733		lru_add_drain_cpu(cpu);
    734		local_unlock(&lru_pvecs.lock);
    735		invalidate_bh_lrus_cpu(cpu);
    736	}
    737	=


-- =

Zhengjun Xing


--===============3032080309033318403==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5PgogICAgSGkg
TWluY2hhbiw8YnI+CiAgICA8YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9u
IDUvMjEvMjAyMSAyOjM2IEFNLCBNaW5jaGFuIEtpbQogICAgICB3cm90ZTo8YnI+CiAgICA8L2Rp
dj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9Im1pZDpZS2FzRWVYQ3I5UjV5ekNy
QGdvb2dsZS5jb20iPgogICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9u
IFRodSwgTWF5IDIwLCAyMDIxIGF0IDA0OjMxOjQ0UE0gKzA4MDAsIGtlcm5lbCB0ZXN0IHJvYm90
IHdyb3RlOgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHBy
ZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KCkdyZWV0aW5nLAoKRllJLCB3ZSBub3Rp
Y2VkIGEgLTIxLjglIHJlZ3Jlc3Npb24gb2YgZmlvLndyaXRlX2lvcHMgZHVlIHRvIGNvbW1pdDoK
Cgpjb21taXQ6IDhjYzYyMWQyZjQ1ZGRkM2RjNjY0MDI0YTY0N2VlN2FkZjQ4ZDc5YTUgKCJtbTog
ZnM6IGludmFsaWRhdGUgQkggTFJVIGR1cmluZyBwYWdlIG1pZ3JhdGlvbiIpCjxhIGNsYXNzPSJt
b3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCI+aHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9jZ2l0L2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0PC9hPiBtYXN0ZXIKCgpp
biB0ZXN0Y2FzZTogZmlvLWJhc2ljCm9uIHRlc3QgbWFjaGluZTogOTYgdGhyZWFkcyAyIHNvY2tl
dHMgSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyNTIgQ1BVIEAgMi4xMEdIeiB3aXRoIDI1NkcgbWVt
b3J5CndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6CgoJZGlzazogMnBtZW0KCWZzOiBleHQ0Cgly
dW50aW1lOiAyMDBzCglucl90YXNrOiA1MCUKCXRpbWVfYmFzZWQ6IHRiCglydzogcmFuZHdyaXRl
CgliczogNGsKCWlvZW5naW5lOiBsaWJhaW8KCXRlc3Rfc2l6ZTogMjAwRwoJY3B1ZnJlcV9nb3Zl
cm5vcjogcGVyZm9ybWFuY2UKCXVjb2RlOiAweDUwMDMwMDYKCnRlc3QtZGVzY3JpcHRpb246IEZp
byBpcyBhIHRvb2wgdGhhdCB3aWxsIHNwYXduIGEgbnVtYmVyIG9mIHRocmVhZHMgb3IgcHJvY2Vz
c2VzIGRvaW5nIGEgcGFydGljdWxhciB0eXBlIG9mIEkvTyBhY3Rpb24gYXMgc3BlY2lmaWVkIGJ5
IHRoZSB1c2VyLgp0ZXN0LXVybDogPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tL2F4Ym9lL2ZpbyI+aHR0cHM6Ly9naXRodWIuY29tL2F4Ym9l
L2ZpbzwvYT4KCgoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRh
ZwpSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm9saXZlci5zYW5nQGludGVsLmNvbSI+Jmx0O29saXZlci5z
YW5nQGludGVsLmNvbSZndDs8L2E+CgoKRGV0YWlscyBhcmUgYXMgYmVsb3c6Ci0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tJmd0OwoKClRvIHJlcHJvZHVjZToKCiAgICAg
ICAgZ2l0IGNsb25lIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBz
Oi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMuZ2l0Ij5odHRwczovL2dpdGh1Yi5jb20vaW50
ZWwvbGtwLXRlc3RzLmdpdDwvYT4KICAgICAgICBjZCBsa3AtdGVzdHMKICAgICAgICBiaW4vbGtw
IGluc3RhbGwgICAgICAgICAgICAgICAgam9iLnlhbWwgICMgam9iIGZpbGUgaXMgYXR0YWNoZWQg
aW4gdGhpcyBlbWFpbAogICAgICAgIGJpbi9sa3Agc3BsaXQtam9iIC0tY29tcGF0aWJsZSBqb2Iu
eWFtbCAgIyBnZW5lcmF0ZSB0aGUgeWFtbCBmaWxlIGZvciBsa3AgcnVuCiAgICAgICAgYmluL2xr
cCBydW4gICAgICAgICAgICAgICAgICAgIGdlbmVyYXRlZC15YW1sLWZpbGUKPC9wcmU+CiAgICAg
IDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4K
SGksCgpJIHRyaWVkIHRvIGluc2FsbCB0aGUgbGtwLXRlc3QgaW4gbXkgbWFjaGluZSBieSBmb2xs
b3dpbmcgYWJvdmUgZ3VpZGUgYnV0IGZhaWxlZApkdWUgdG8gcGFja2FnZSBwcm9ibGVtcyhJIGd1
ZXNzIGl0J3MgbXkgcHJvYmxlbSBzaW5jZSBJIHVzZSBzb21ldGhpbmcgcGFydGljdWxhcgplbnZp
cm9uZW1lbnQpLiBIb3dldmVyLCBJIGd1ZXNzIGl0IGNvbWVzIGZyb20gaW5jcmVhc2VkIG1pc3Mg
cmF0aW8gb2YgYmhfbHJ1cwpzaW5jZSB0aGUgcGF0Y2ggY2F1c2VkIG1vcmUgZnJlcXVlbnQgaW52
YWxpZGF0aW9uIG9mIHRoZSBiaF9scnVzIGNhbGxzIGNvbXBhcmVkCnRvIG9sZC4gRm9yIGV4YW1w
bGUsIGxydV9hZGRfZHJhaW4gY291bGQgYmUgY2FsbGVkIGZyb20gc2V2ZXJhbCBob3QgcGxhY2Vz
KGUuZy4sCnVubWFwIGFuZCBwYWdldmVjX3JlbGVhc2UgZnJvbSBzZXZlcmFsIHBhdGgpIGFuZCBp
dCBjb3VsZCBrZWVwcyBpbnZhbGlkYXRpbmcKYmhfbHJ1cy4KCklNTywgd2Ugc2hvdWxkIG1vdmUg
dGhlIG92ZXJoZWFkIGZyb20gc3VjaCBob3QgcGF0aCB0byBjb2xkIG9uZS4gSG93IGFib3V0IHRo
aXM/CgomZ3Q7RnJvbSBlYmY0ZWRlMWNmMzJmYjE0ZDg1ZjAwMTVhMzY5M2NiOGUxYjhkYmZlIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNaW5jaGFuIEtpbSA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bWluY2hhbkBrZXJuZWwub3JnIj4mbHQ7bWlu
Y2hhbkBrZXJuZWwub3JnJmd0OzwvYT4KRGF0ZTogVGh1LCAyMCBNYXkgMjAyMSAxMToxNzo1NiAt
MDcwMApTdWJqZWN0OiBbUEFUQ0hdIGludmFsaWRhdGUgYmhfbHJ1cyBvbmx5IGF0IGxydV9hZGRf
ZHJhaW5fYWxsCgpOb3QtWWV0LVNpZ25lZC1vZmYtYnk6IE1pbmNoYW4gS2ltIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzptaW5jaGFuQGtlcm5lbC5vcmciPiZs
dDttaW5jaGFuQGtlcm5lbC5vcmcmZ3Q7PC9hPgotLS0KIG1tL3N3YXAuYyB8IDE1ICsrKysrKysr
KysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbW0vc3dhcC5jIGIvbW0vc3dhcC5jCmluZGV4IGRmYjQ4Y2Y5YzJjOS4u
ZDYxNjg0NDllMjhjIDEwMDY0NAotLS0gYS9tbS9zd2FwLmMKKysrIGIvbW0vc3dhcC5jCkBAIC02
NDIsNyArNjQyLDYgQEAgdm9pZCBscnVfYWRkX2RyYWluX2NwdShpbnQgY3B1KQogCQlwYWdldmVj
X2xydV9tb3ZlX2ZuKHB2ZWMsIGxydV9sYXp5ZnJlZV9mbik7CiAKIAlhY3RpdmF0ZV9wYWdlX2Ry
YWluKGNwdSk7Ci0JaW52YWxpZGF0ZV9iaF9scnVzX2NwdShjcHUpOwogfQogCiAvKioKQEAgLTcy
NSw2ICs3MjQsMTcgQEAgdm9pZCBscnVfYWRkX2RyYWluKHZvaWQpCiAJbG9jYWxfdW5sb2NrKCZh
bXA7bHJ1X3B2ZWNzLmxvY2spOwogfQogCit2b2lkIGxydV9hbmRfYmhfbHJ1c19kcmFpbih2b2lk
KQoreworCWludCBjcHU7CisKKwlsb2NhbF9sb2NrKCZhbXA7bHJ1X3B2ZWNzLmxvY2spOworCWNw
dSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKKwlscnVfYWRkX2RyYWluX2NwdShjcHUpOworCWxvY2Fs
X3VubG9jaygmYW1wO2xydV9wdmVjcy5sb2NrKTsKKwlpbnZhbGlkYXRlX2JoX2xydXNfY3B1KGNw
dSk7Cit9CisKIHZvaWQgbHJ1X2FkZF9kcmFpbl9jcHVfem9uZShzdHJ1Y3Qgem9uZSAqem9uZSkK
IHsKIAlsb2NhbF9sb2NrKCZhbXA7bHJ1X3B2ZWNzLmxvY2spOwpAQCAtNzM5LDcgKzc0OSw3IEBA
IHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qgd29ya19zdHJ1Y3QsIGxydV9hZGRfZHJhaW5f
d29yayk7CiAKIHN0YXRpYyB2b2lkIGxydV9hZGRfZHJhaW5fcGVyX2NwdShzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKmR1bW15KQogewotCWxydV9hZGRfZHJhaW4oKTsKKwlscnVfYW5kX2JoX2xydXNfZHJh
aW4oKTsKIH0KIAogLyoKQEAgLTg4MSw2ICs4OTEsNyBAQCB2b2lkIGxydV9jYWNoZV9kaXNhYmxl
KHZvaWQpCiAJX19scnVfYWRkX2RyYWluX2FsbCh0cnVlKTsKICNlbHNlCiAJbHJ1X2FkZF9kcmFp
bigpOworCWludmFsaWRhdGVfYmhfbHJ1c19jcHUoc21wX3Byb2Nlc3Nvcl9pZCgpKTsKICNlbmRp
ZgogfQogCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgSSB0ZXN0IHRoZSBwYXRjaCwgdGhl
IHJlZ3Jlc3Npb24gcmVkdWNlZCB0byAtMi45JS48YnI+Cj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PGJyPgp0Ym94X2dyb3VwL3Rlc3RjYXNlL3Jvb3Rmcy9rY29uZmlnL2NvbXBpbGVy
L2Rpc2svZnMvcnVudGltZS9ucl90YXNrL3RpbWVfYmFzZWQvcncvYnMvaW9lbmdpbmUvdGVzdF9z
aXplL2NwdWZyZXFfZ292ZXJub3IvdWNvZGU6PGJyPgogICAgwqAKbGtwLWNzbC0yc3A2L2Zpby1i
YXNpYy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3g4Nl82NC1yaGVsLTguMy9nY2Mt
OS8ycG1lbS9leHQ0LzIwMHMvNTAlL3RiL3JhbmR3cml0ZS80ay9saWJhaW8vMjAwRy9wZXJmb3Jt
YW5jZS8weDUwMDMwMDY8YnI+CiAgICA8YnI+CiAgICBjb21taXQ6PGJyPgogICAgwqAgMzYxYTJh
MjI5ZmEzMWFiN2YyYjIzNmI1OTQ2ZTQzNDk2NGQwMDc2Mjxicj4KICAgIMKgIDhjYzYyMWQyZjQ1
ZGRkM2RjNjY0MDI0YTY0N2VlN2FkZjQ4ZDc5YTU8YnI+CiAgICDCoCA3YmFmYjFjNGU3MmE1ZThk
NDBjZDA2ODFiODBiMWZmZWIzMWEwNjRjwqAgKHRoZSB0ZXN0IHBhdGNoKTxicj4KICAgIDxicj4K
ICAgIDM2MWEyYTIyOWZhMzFhYjcgOGNjNjIxZDJmNDVkZGQzZGM2NjQwMjRhNjQ3CiAgICA3YmFm
YjFjNGU3MmE1ZThkNDBjZDA2ODFiODA8YnI+CiAgICAtLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPGJyPgog
ICAgwqDCoMKgwqDCoMKgwqDCoCAlc3RkZGV2wqDCoMKgwqAgJWNoYW5nZcKgwqDCoMKgwqDCoMKg
wqAgJXN0ZGRldsKgwqDCoMKgICVjaGFuZ2XCoMKgwqDCoMKgwqDCoMKgCiAgICAlc3RkZGV2PGJy
PgogICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFzCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAKICAgIFw8YnI+CiAgICDCoMKgwqDCoMKgIDAuMDHCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0wLjDCoMKgwqDCoMKgwqDCoCAwLjAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCArMC4wwqDCoMKgwqDCoMKgwqAKICAgIDAuMDHCoMKgwqDCoMKgwqDCoCBmaW8ubGF0ZW5j
eV8xMDAwbXMlPGJyPgogICAgwqDCoMKgwqDCoCAwLjI3IMKxwqAgNSXCoMKgwqDCoMKgIC0wLjDC
oMKgwqDCoMKgwqDCoCAwLjI0IMKxwqAgNyXCoMKgwqDCoMKgIC0wLjDCoMKgwqDCoMKgwqDCoCAw
LjI3CiAgICDCscKgIDUlwqAgZmlvLmxhdGVuY3lfMTBtcyU8YnI+CiAgICDCoMKgwqDCoMKgIDAu
MDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0wLjDCoMKgwqDCoMKgwqDCoCAwLjAwwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArMC4wwqDCoMKgwqDCoMKgwqAKICAgIDAuMDHCoMKgwqDCoMKgwqDCoCBm
aW8ubGF0ZW5jeV8yMDAwbXMlPGJyPgogICAgwqDCoMKgwqDCoCAwLjMzIMKxwqAgOCXCoMKgwqDC
oMKgICswLjHCoMKgwqDCoMKgwqDCoCAwLjQ0IMKxwqAgNyXCoMKgwqDCoMKgICswLjDCoMKgwqDC
oMKgwqDCoCAwLjM2CiAgICDCscKgIDklwqAgZmlvLmxhdGVuY3lfMjBtcyU8YnI+CiAgICDCoMKg
wqDCoMKgIDAuMDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0wLjDCoMKgwqDCoMKgwqDCoCAwLjAw
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCArMC4wwqDCoMKgwqDCoMKgwqAKICAgIDAuMDHCoMKgwqDC
oMKgwqDCoCBmaW8ubGF0ZW5jeV81MDBtcyU8YnI+CiAgICDCoMKgwqDCoCAxMy45OcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKzYuMMKgwqDCoMKgwqDCoCAxOS45NsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKzAuNcKgwqDCoMKgwqDCoCAxNC41MgogICAgwrHCoCA0JcKgIGZpby5sYXRlbmN5XzUwbXMl
PGJyPgogICAgwqDCoMKgwqDCoCAwLjAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMC4wwqDCoMKg
wqDCoMKgwqAgMC4wMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKzAuMMKgwqDCoMKgwqDCoMKgCiAg
ICAwLjAxwqDCoMKgwqDCoMKgwqAgZmlvLmxhdGVuY3lfNzUwbXMlPGJyPgogICAgwqDCoMKgwqDC
oCAzLjQwIMKxIDQ0JcKgwqDCoMKgwqAgLTIuMsKgwqDCoMKgwqDCoMKgIDEuMTcgwrEgNDYlwqDC
oMKgwqDCoCAtMC44wqDCoMKgwqDCoMKgwqAgMi41OSDCsQogICAgMzUlwqAgZmlvLmxhdGVuY3lf
NzUwdXMlPGJyPgogICAgwqAgNjIwODc5NzPCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMjEuOCXCoMKg
IDQ4NTU5ODYwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMi44JcKgwqAgNjAzNjQxNjAKICAgIMKx
wqAgMyXCoCBmaW8ud29ya2xvYWQ8YnI+CiAgICDCoMKgwqDCoMKgIDEyMTLCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtMjEuOCXCoMKgwqDCoCA5NDguMjnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0yLjkl
wqDCoMKgwqDCoMKgIDExNzcKICAgIMKxwqAgMyXCoCBmaW8ud3JpdGVfYndfTUJwczxicj4KICAg
IMKgIDMzMDczODM0wqDCoMKgwqDCoMKgwqDCoMKgwqAgLTExLjYlwqDCoCAyOTIyOTA1NsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLTEuMyXCoMKgIDMyNjM2OTI4CiAgICDCscKgIDQlwqAgZmlvLndy
aXRlX2NsYXRfOTUlX3VzPGJyPgogICAgwqAgMzQ4NjUxNTLCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC05LjElwqDCoCAzMTY3NTczM8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTAuMyXCoMKgCiAgICAz
NDc2MDI5NMKgwqDCoMKgwqDCoMKgIGZpby53cml0ZV9jbGF0Xzk5JV91czxicj4KICAgIMKgwqAg
NDc5NDEyNcKgwqDCoMKgwqDCoMKgwqDCoMKgICsyNy45JcKgwqDCoCA2MTI5NjMxwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArMy4wJcKgwqDCoCA0OTM2NzcyCiAgICDCscKgIDMlwqAgZmlvLndyaXRl
X2NsYXRfbWVhbl91czxicj4KICAgIMKgIDEzMTc5NjcxIMKxwqAgNiXCoMKgwqDCoCAtMTAuMSXC
oMKgIDExODQyMjc0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMy45JcKgwqAgMTI2NjU0NTYKICAg
IMKxwqAgNSXCoCBmaW8ud3JpdGVfY2xhdF9zdGRkZXY8YnI+CiAgICDCoMKgwqAgMzEwNDAzwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLTIxLjglwqDCoMKgwqAgMjQyNzYxwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAtMi45JcKgwqDCoMKgIDMwMTUzMQogICAgwrHCoCAzJcKgIGZpby53cml0ZV9pb3BzPGJy
PgogICAgwqDCoMKgIDE1MjY1M8KgwqDCoMKgwqDCoMKgwqDCoMKgICsyOC45JcKgwqDCoMKgIDE5
Njc1OcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKzMuMiXCoMKgwqDCoCAxNTc1NjIKICAgIMKxwqAg
MyXCoCBmaW8ud3JpdGVfc2xhdF9tZWFuX3VzPGJyPgogICAgwqDCoCAyMTM5NzQ5wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArOS4zJcKgwqDCoCAyMzM4NTk4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
MS44JcKgwqDCoAogICAgMjE3OTExNsKgwqDCoMKgwqDCoMKgIGZpby53cml0ZV9zbGF0X3N0ZGRl
djxicj4KICAgIDxicj4KICAgIFdoZW4gYnVpbGQga2VybmVsLCB0aGVyZSBpcyBhIHdhcm5pbmcg
Zm9yIHRoZSBwYXRjaDo8YnI+CiAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PkFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgJmd0OyZndDspOgoKPC9wcmU+CiAg
ICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6ICMwMDdjZmY7Ij4KICAgICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9ImNvbG9yOiAjMDA3Y2ZmOyI+CiAgICAgICAg
PHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5tbS9zd2FwLmM6NzI3OjY6IHdhcm5p
bmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3IgJ2xydV9hbmRfYmhfbHJ1c19kcmFpbicgWy1X
bWlzc2luZy1wcm90b3R5cGVzXQo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgPC9ibG9j
a3F1b3RlPgogICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4gICAgIDcyNyB8
IHZvaWQgbHJ1X2FuZF9iaF9scnVzX2RyYWluKHZvaWQpCiAgICAgICAgIHwgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn4KCgp2aW0gKy9scnVfYW5kX2JoX2xydXNfZHJhaW4gKzcyNyBtbS9zd2Fw
LmMKCiAgIDcyNgkKICZndDsgNzI3CXZvaWQgbHJ1X2FuZF9iaF9scnVzX2RyYWluKHZvaWQpCiAg
IDcyOAl7CiAgIDcyOQkJaW50IGNwdTsKICAgNzMwCQogICA3MzEJCWxvY2FsX2xvY2soJmFtcDts
cnVfcHZlY3MubG9jayk7CiAgIDczMgkJY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwogICA3MzMJ
CWxydV9hZGRfZHJhaW5fY3B1KGNwdSk7CiAgIDczNAkJbG9jYWxfdW5sb2NrKCZhbXA7bHJ1X3B2
ZWNzLmxvY2spOwogICA3MzUJCWludmFsaWRhdGVfYmhfbHJ1c19jcHUoY3B1KTsKICAgNzM2CX0K
ICAgNzM3CTwvcHJlPgogICAgPHByZSBjbGFzcz0ibW96LXNpZ25hdHVyZSIgY29scz0iNzIiPi0t
IApaaGVuZ2p1biBYaW5nPC9wcmU+CiAgPC9ib2R5Pgo8L2h0bWw+Cg==

--===============3032080309033318403==--

