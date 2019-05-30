Content-Type: multipart/mixed; boundary="===============4338641612263904156=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Thu, 30 May 2019 15:20:28 +0800
Message-ID: <d796ac23-d5d6-cdfa-89c8-536e9496b551@linux.intel.com>
In-Reply-To: <9a07c589f955e5af5acc0fa09a16a3256089e764.camel@hammerspace.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4338641612263904156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/30/2019 10:00 AM, Trond Myklebust wrote:
> Hi Xing,
> =

> On Thu, 2019-05-30 at 09:35 +0800, Xing Zhengjun wrote:
>> Hi Trond,
>>
>> On 5/20/2019 1:54 PM, kernel test robot wrote:
>>> Greeting,
>>>
>>> FYI, we noticed a 16.0% improvement of fsmark.app_overhead due to
>>> commit:
>>>
>>>
>>> commit: 0472e476604998c127f3c80d291113e77c5676ac ("SUNRPC: Convert
>>> socket page send code to use iov_iter()")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
>>> master
>>>
>>> in testcase: fsmark
>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @
>>> 3.00GHz with 384G memory
>>> with following parameters:
>>>
>>> 	iterations: 1x
>>> 	nr_threads: 64t
>>> 	disk: 1BRD_48G
>>> 	fs: xfs
>>> 	fs2: nfsv4
>>> 	filesize: 4M
>>> 	test_size: 40G
>>> 	sync_method: fsyncBeforeClose
>>> 	cpufreq_governor: performance
>>>
>>> test-description: The fsmark is a file system benchmark to test
>>> synchronous write workloads, for example, mail servers workload.
>>> test-url: https://sourceforge.net/projects/fsmark/
>>>
>>>
>>>
>>> Details are as below:
>>> -----------------------------------------------------------------
>>> --------------------------------->
>>>
>>>
>>> To reproduce:
>>>
>>>           git clone https://github.com/intel/lkp-tests.git
>>>           cd lkp-tests
>>>           bin/lkp install job.yaml  # job file is attached in this
>>> email
>>>           bin/lkp run     job.yaml
>>>
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> compiler/cpufreq_governor/disk/filesize/fs2/fs/iterations/kconfig/n
>>> r_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>>>     gcc-7/performance/1BRD_48G/4M/nfsv4/xfs/1x/x86_64-rhel-
>>> 7.6/64t/debian-x86_64-2018-04-03.cgz/fsyncBeforeClose/lkp-ivb-
>>> ep01/40G/fsmark
>>>
>>> commit:
>>>     e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use
>>> iov_iter_kvec()")
>>>     0472e47660 ("SUNRPC: Convert socket page send code to use
>>> iov_iter()")
>>>
>>> e791f8e9380d945e 0472e476604998c127f3c80d291
>>> ---------------- ---------------------------
>>>          fail:runs  %reproduction    fail:runs
>>>              |             |             |
>>>              :4           50%           2:4     dmesg.WARNING:at#for
>>> _ip_interrupt_entry/0x
>>>            %stddev     %change         %stddev
>>>                \          |                \
>>>     15118573 =C2=B1  2%     +16.0%   17538083        fsmark.app_overhead
>>>       510.93           -22.7%     395.12        fsmark.files_per_sec
>>>        24.90           +22.8%      30.57        fsmark.time.elapsed_
>>> time
>>>        24.90           +22.8%      30.57        fsmark.time.elapsed_
>>> time.max
>>>       288.00 =C2=B1  2%     -
>>> 27.8%     208.00        fsmark.time.percent_of_cpu_this_job_got
>>>        70.03 =C2=B1  2%     -
>>> 11.3%      62.14        fsmark.time.system_time
>>>
>>
>> Do you have time to take a look at this regression?
> =

>  From your stats, it looks to me as if the problem is increased NUMA
> overhead. Pretty much everything else appears to be the same or
> actually performing better than previously. Am I interpreting that
> correctly?
The real regression is the throughput(fsmark.files_per_sec) is decreased =

by 22.7%.
> =

> If my interpretation above is correct, then I'm not seeing where this
> patch would be introducing new NUMA regressions. It is just converting
> from using one method of doing socket I/O to another. Could it perhaps
> be a memory artefact due to your running the NFS client and server on
> the same machine?
> =

> Apologies for pushing back a little, but I just don't have the
> hardware available to test NUMA configurations, so I'm relying on
> external testing for the above kind of scenario.
> =

Thanks for looking at this.  If you need more information, please let me
know.
> Thanks
>    Trond
> =


-- =

Zhengjun Xing

--===============4338641612263904156==--

