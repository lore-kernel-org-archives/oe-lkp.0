Content-Type: multipart/mixed; boundary="===============6782216825331950094=="
MIME-Version: 1.0
From: Neftin, Sasha <sasha.neftin@intel.com>
To: lkp@lists.01.org
Subject: Re: [Intel-wired-lan] [e1000e] e86e383f28: suspend-stress.fail
Date: Mon, 25 May 2020 08:41:58 +0300
Message-ID: <99f5e417-c369-26a9-3b61-5552d9ba8c35@intel.com>
In-Reply-To: <5A1631F8-259E-4897-BE52-0F5DB406E44F@canonical.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6782216825331950094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/23/2020 15:20, Kai-Heng Feng wrote:
> [+Cc intel-wired-lan]
> =

>> On May 21, 2020, at 13:27, kernel test robot <rong.a.chen@intel.com> w=
rote:
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: e86e383f2854234129c66e90f84ac2c74b2b1828 ("e1000e: Warn if disab=
ling ULP failed")
>> https://git.kernel.org/cgit/linux/kernel/git/jkirsher/next-queue.git dev=
-queue
> =

> kern  :warn  : [  240.884667] e1000e 0000:00:19.0 eth0: Failed to disable=
 ULP
> kern  :info  : [  241.896122] asix 2-3:1.0 eth1: link up, 100Mbps, full-d=
uplex, lpa 0xC1E1
> kern  :err   : [  242.269348] e1000e 0000:00:19.0 eth0: Hardware Error
> kern  :info  : [  242.772702] e1000e 0000:00:19.0: pci_pm_resume+0x0/0x80=
 returned 0 after 2985422 usecs
> =

> So the patch does catch issues previously ignored.
> =

> I wonder what's the next move, maybe increase the ULP timeout again?
> =

Kai-Heng, you can't simple increase ULP timeout. Why ME required more =

time? We need to find ME expert and understand why FWSM (firmware =

semaphore, bit 10 ULP_CFG_DN) indication take too much time. I wonder if =

this indication work as properly. Please, try to understand. All =

delay/timeout approach not acceptable.

Also, we communicated: : Intel vPro (vPro CPU + Corporate ME FW) system =

(i.e. I219LM system) is NOT POR to support Linux

> Kai-Heng
> =

>>
>> in testcase: suspend-stress
>> with following parameters:
>>
>> 	mode: mem
>> 	iterations: 10
>>
>>
>>
>> on test machine: 4 threads Broadwell with 8G memory
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
>>
>>
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>
>> SUSPEND RESUME TEST STARTED
>> Suspend to mem 1/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-1/10 -O /dev/null
>> Done
>> Sleep for 10 seconds
>> Suspend to mem 2/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-2/10 -O /dev/null
>> Done
>> Sleep for 10 seconds
>> Suspend to mem 3/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-3/10 -O /dev/null
>> Done
>> Sleep for 10 seconds
>> Suspend to mem 4/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-4/10 -O /dev/null
>> Done
>> Sleep for 10 seconds
>> Suspend to mem 5/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-5/10 -O /dev/null
>> Done
>> Sleep for 10 seconds
>> Suspend to mem 6/10:
>> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 h=
ttp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/sched=
uled/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f=
2854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3D=
suspending-6/10 -O /dev/null
>> Failed
>>
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp install job.yaml  # job file is attached in this email
>>         bin/lkp run     job.yaml
>>
>>
>>
>> Thanks,
>> Rong Chen
>>
>> <config-5.7.0-rc4-01618-ge86e383f28542><job-script.txt><kmsg.xz><suspend=
-stress.txt><job.yaml>
> =

> _______________________________________________
> Intel-wired-lan mailing list
> Intel-wired-lan(a)osuosl.org
> https://lists.osuosl.org/mailman/listinfo/intel-wired-lan
>=20

--===============6782216825331950094==--

