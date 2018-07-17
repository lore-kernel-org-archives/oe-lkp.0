Content-Type: multipart/mixed; boundary="===============2920354827053450230=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rbd] 2f18d46683: vm-scalability.throughput -92.3% regression
Date: Tue, 17 Jul 2018 15:37:44 +0800
Message-ID: <87sh4igvnb.fsf@yhuang-dev.intel.com>
In-Reply-To: <CAOi1vP8q45y35hbFyqkNGN4iB2BAbBwzhwROO6TmaoURJUcFEg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2920354827053450230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ilya Dryomov <idryomov@gmail.com> writes:

> On Fri, Jun 22, 2018 at 10:37 AM kernel test robot
> <xiaolong.ye@intel.com> wrote:
>>
>>
>> Greeting,
>>
>> We noticed a -92.3% regression of vm-scalability.throughput due to commi=
t:
>>
>> commit: 2f18d46683cb3047c41229d57cf7c6e2ee48676f ("rbd: refactor rbd_wai=
t_state_locked()")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: vm-scalability
>> on test machine: 80 threads Skylake with 64G memory
>> with following parameters:
>>
>>         runtime: 300s
>>         test: lru-file-readonce
>>         cpufreq_governor: performance
>>
>> test-description: The motivation behind this suite is to exercise functi=
ons and regions of the mm/ of the Linux kernel which are of interest to us.
>> test-url: https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalabilit=
y.git/
>
> This is a false positive: rbd is disabled in the attached config,
> as is the rest of ceph:
>
>   # CONFIG_CEPH_LIB is not set
>   # CONFIG_BLK_DEV_RBD is not set
>   # CONFIG_CEPH_FS is not set
>

After double check, it is found that there's a bug in test system itself
which cause the false positive.  Sorry for bothering.

Best Regards,
Huang, Ying

--===============2920354827053450230==--

