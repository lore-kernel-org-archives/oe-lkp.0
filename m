Content-Type: multipart/mixed; boundary="===============6971643188894582787=="
MIME-Version: 1.0
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: lkp@lists.01.org
Subject: Re: [e1000e] e86e383f28: suspend-stress.fail
Date: Sat, 23 May 2020 20:20:37 +0800
Message-ID: <5A1631F8-259E-4897-BE52-0F5DB406E44F@canonical.com>
In-Reply-To: <20200521052753.GB12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6971643188894582787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[+Cc intel-wired-lan]

> On May 21, 2020, at 13:27, kernel test robot <rong.a.chen@intel.com> wr=
ote:
> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: e86e383f2854234129c66e90f84ac2c74b2b1828 ("e1000e: Warn if disabl=
ing ULP failed")
> https://git.kernel.org/cgit/linux/kernel/git/jkirsher/next-queue.git dev-=
queue

kern  :warn  : [  240.884667] e1000e 0000:00:19.0 eth0: Failed to disable U=
LP
kern  :info  : [  241.896122] asix 2-3:1.0 eth1: link up, 100Mbps, full-dup=
lex, lpa 0xC1E1
kern  :err   : [  242.269348] e1000e 0000:00:19.0 eth0: Hardware Error
kern  :info  : [  242.772702] e1000e 0000:00:19.0: pci_pm_resume+0x0/0x80 r=
eturned 0 after 2985422 usecs

So the patch does catch issues previously ignored.

I wonder what's the next move, maybe increase the ULP timeout again?

Kai-Heng

> =

> in testcase: suspend-stress
> with following parameters:
> =

> 	mode: mem
> 	iterations: 10
> =

> =

> =

> on test machine: 4 threads Broadwell with 8G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> SUSPEND RESUME TEST STARTED
> Suspend to mem 1/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-1/10 -O /dev/null
> Done
> Sleep for 10 seconds
> Suspend to mem 2/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-2/10 -O /dev/null
> Done
> Sleep for 10 seconds
> Suspend to mem 3/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-3/10 -O /dev/null
> Done
> Sleep for 10 seconds
> Suspend to mem 4/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-4/10 -O /dev/null
> Done
> Sleep for 10 seconds
> Suspend to mem 5/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-5/10 -O /dev/null
> Done
> Sleep for 10 seconds
> Suspend to mem 6/10:
> /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tp://inn:80/~lkp/cgi-bin/lkp-jobfile-append-var?job_file=3D/lkp/jobs/schedu=
led/lkp-bdw-nuc1/suspend-stress-10-mem-debian-x86_64-20180403.cgz-e86e383f2=
854234129c66e90f84ac2c74b2b1828-20200517-66267-13fgkna-8.yaml&job_state=3Ds=
uspending-6/10 -O /dev/null
> Failed
> =

> =

> =

> To reproduce:
> =

>        git clone https://github.com/intel/lkp-tests.git
>        cd lkp-tests
>        bin/lkp install job.yaml  # job file is attached in this email
>        bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
> =

> <config-5.7.0-rc4-01618-ge86e383f28542><job-script.txt><kmsg.xz><suspend-=
stress.txt><job.yaml>

--===============6971643188894582787==--

