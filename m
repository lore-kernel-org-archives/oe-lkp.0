Content-Type: multipart/mixed; boundary="===============0939248120981636688=="
MIME-Version: 1.0
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: lkp@lists.01.org
Subject: Re: [ata] 0568e61225: stress-ng.copy-file.ops_per_sec -15.0% regression
Date: Tue, 09 Aug 2022 07:55:53 -0700
Message-ID: <e4106ffa-3842-45c0-9756-5226cfcfa17d@opensource.wdc.com>
In-Reply-To: <3451fa5a-6229-073f-ae18-0c232cd48ed5@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0939248120981636688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/08/09 2:58, John Garry wrote:
> On 08/08/2022 15:52, Damien Le Moal wrote:
>> On 2022/08/05 1:05, kernel test robot wrote:
>>>
>>>
>>> Greeting,
>>>
>>> FYI, we noticed a -15.0% regression of stress-ng.copy-file.ops_per_sec =
due to commit:
>>>
>>>
>>> commit: 0568e6122574dcc1aded2979cd0245038efe22b6 ("ata: libata-scsi: ca=
p ata_device->max_sectors according to shost->max_sectors")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: stress-ng
>>> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
>>> with following parameters:
>>>
>>> 	nr_threads: 10%
>>> 	disk: 1HDD
>>> 	testtime: 60s
>>> 	fs: f2fs
>>> 	class: filesystem
>>> 	test: copy-file
>>> 	cpufreq_governor: performance
>>> 	ucode: 0xb000280
>>
>> Without knowing what the device adapter is, hard to say where the proble=
m is. I
>> suspect that with the patch applied, we may be ending up with a small de=
fault
>> max_sectors value, causing overhead due to more commands than necessary.
>>
>> Will check what I see with my test rig.
> =

> As far as I can see, this patch should not make a difference unless the =

> ATA shost driver is setting the max_sectors value unnecessarily low.

That is my hunch too, hence my question about which host driver is being us=
ed
for this test... That is not apparent from the problem report.

> =

>>
>>>
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------------=
--------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>          git clone https://github.com/intel/lkp-tests.git
>>>          cd lkp-tests
>>>          sudo bin/lkp install job.yaml           # job file is attached=
 in this email
>>>          bin/lkp split-job --compatible job.yaml # generate the yaml fi=
le for lkp run
>>>          sudo bin/lkp run generated-yaml-file
>>>
>>>          # if come across any failure that blocks the test,
>>>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_=
group/test/testcase/testtime/ucode:
>>>    filesystem/gcc-11/performance/1HDD/f2fs/x86_64-rhel-8.3/10%/debian-1=
1.1-x86_64-20220510.cgz/lkp-icl-2sp1/copy-file/stress-ng/60s/0xb000280
>>>
>>> commit:
>>>    4cbfca5f77 ("scsi: scsi_transport_sas: cap shost opt_sectors accordi=
ng to DMA optimal limit")
>>>    0568e61225 ("ata: libata-scsi: cap ata_device->max_sectors according=
 to shost->max_sectors")
>>>
>>> 4cbfca5f7750520f 0568e6122574dcc1aded2979cd0
>>> ---------------- ---------------------------
>>>           %stddev     %change         %stddev
>>>               \          |                \
>>>        1627           -14.9%       1385        stress-ng.copy-file.ops
>>>       27.01           -15.0%      22.96        stress-ng.copy-file.ops_=
per_sec
>>>     8935079           -11.9%    7870629        stress-ng.time.file_syst=
em_outputs
>>>       14.88 =C2=B1  5%     -31.8%      10.14 =C2=B1  3%  stress-ng.time=
.percent_of_cpu_this_job_got
>>>       50912           -14.7%      43413        vmstat.io.bo
>>>       93.78            +1.4%      95.10        iostat.cpu.idle
>>>        3.89           -31.6%       2.66        iostat.cpu.iowait
>>>        4.01            -1.3        2.74        mpstat.cpu.all.iowait%
>>>        0.23 =C2=B1  9%      -0.1        0.17 =C2=B1 11%  mpstat.cpu.all=
.sys%
>>>        1.66 =C2=B1 37%      -1.2        0.51 =C2=B1 55%  perf-profile.c=
alltrace.cycles-pp.f2fs_write_end.generic_perform_write.f2fs_buffered_write=
_iter.f2fs_file_write_iter.do_iter_readv_writev
>>>        1.66 =C2=B1 37%      -1.1        0.59 =C2=B1 25%  perf-profile.c=
hildren.cycles-pp.f2fs_write_end
>>>        1.51 =C2=B1 40%      -1.1        0.45 =C2=B1 26%  perf-profile.c=
hildren.cycles-pp.f2fs_dirty_data_folio
>>>        1.21 =C2=B1 49%      -1.0        0.23 =C2=B1 33%  perf-profile.c=
hildren.cycles-pp.f2fs_update_dirty_folio
>>>        0.88 =C2=B1 56%      -0.8        0.04 =C2=B1111%  perf-profile.c=
hildren.cycles-pp.native_queued_spin_lock_slowpath
>>>        0.14 =C2=B1 26%      +0.1        0.25 =C2=B1 28%  perf-profile.c=
hildren.cycles-pp.page_cache_ra_unbounded
>>>        0.88 =C2=B1 56%      -0.8        0.04 =C2=B1112%  perf-profile.s=
elf.cycles-pp.native_queued_spin_lock_slowpath
>>>     3164876 =C2=B1  9%     -20.2%    2524713 =C2=B1  7%  perf-stat.i.ca=
che-misses
>>>   4.087e+08            -4.6%  3.899e+08        perf-stat.i.dTLB-loads
>>>      313050 =C2=B1 10%     -18.4%     255410 =C2=B1  6%  perf-stat.i.no=
de-loads
>>>      972573 =C2=B1  9%     -16.4%     812873 =C2=B1  6%  perf-stat.i.no=
de-stores
>>>     3114748 =C2=B1  9%     -20.2%    2484807 =C2=B1  7%  perf-stat.ps.c=
ache-misses
>>>   4.022e+08            -4.6%  3.837e+08        perf-stat.ps.dTLB-loads
>>>      308178 =C2=B1 10%     -18.4%     251418 =C2=B1  6%  perf-stat.ps.n=
ode-loads
>>>      956996 =C2=B1  9%     -16.4%     799948 =C2=B1  6%  perf-stat.ps.n=
ode-stores
>>>      358486            -8.3%     328694        proc-vmstat.nr_active_fi=
le
>>>     1121620           -11.9%     987816        proc-vmstat.nr_dirtied
>>>      179906            -6.7%     167912        proc-vmstat.nr_dirty
>>>     1151201            -1.7%    1131322        proc-vmstat.nr_file_pages
>>>      100181            +9.9%     110078 =C2=B1  2%  proc-vmstat.nr_inac=
tive_file
>>>      846362           -14.6%     722471        proc-vmstat.nr_written
>>>      358486            -8.3%     328694        proc-vmstat.nr_zone_acti=
ve_file
>>>      100181            +9.9%     110078 =C2=B1  2%  proc-vmstat.nr_zone=
_inactive_file
>>>      180668            -6.8%     168456        proc-vmstat.nr_zone_writ=
e_pending
>>>      556469            -3.5%     536985        proc-vmstat.pgactivate
>>>     3385454           -14.6%    2889953        proc-vmstat.pgpgout
>>>
>>>
>>>
>>>
>>> Disclaimer:
>>> Results have been estimated based on internal Intel analysis and are pr=
ovided
>>> for informational purposes only. Any difference in system hardware or s=
oftware
>>> design or configuration may affect actual performance.
>>>
>>>
>>
>>
> =



-- =

Damien Le Moal
Western Digital Research
--===============0939248120981636688==--

