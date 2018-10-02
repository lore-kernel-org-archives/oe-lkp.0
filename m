Content-Type: multipart/mixed; boundary="===============8066541090813090129=="
MIME-Version: 1.0
From: David Arcari <darcari@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mailbox] afd0b1fb22: kmsg.Error_parsing_PCC_subspaces_from_PCCT
Date: Tue, 02 Oct 2018 08:06:18 -0400
Message-ID: <639587bc-bbdc-8ff4-6e3d-7ef4c0a4a034@redhat.com>
In-Reply-To: <20180930031715.GH15893@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8066541090813090129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Hi,

Can someone help me interpret this email?  I was expecting this to be about=
 a
dmesg change which is expected, but the content doesn't seem to indicate th=
at.

For the record, the commit shouldn't really introduce any functional change=
s.
It merely avoids calling kcalloc with count=3D=3D-EINVAL.  In both cases, a=
n error
should be returned from  acpi_pcc_probe to pcc_init, which should in turn a=
lways
return -ENODEV.

So with the commit in place, this would be logged:

[    3.957345] ACPI: [PCCT:0x00] Invalid zero length
[    3.962340] Error parsing PCC subspaces from PCCT

instead of:

[    3.957345] ACPI: [PCCT:0x00] Invalid zero length
[    3.962340] Could not allocate space for PCC mbox channels


On 09/29/2018 11:17 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: afd0b1fb22269f48d68fdf269891c653818c8047 ("mailbox: PCC: handle p=
arse error")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: ftq
> with following parameters:
> =

> 	nr_task: 100%
> 	samples: 6000ss
> 	test: cache
> 	freq: 20
> 	ucode: 0x200004d
> 	cpufreq_governor: performance
> =

> test-description: The FTQ benchmarks measure hardware and software interf=
erence or 'noise' on a node from the applications perspective.
> test-url: https://github.com/rminnich/ftq
> =

> =

> on test machine: 104 threads Intel(R) Xeon(R) Platinum 8170 CPU @ 2.10GHz=
 with 192G memory
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> =

> =

> 2018-09-21 23:31:26 ./ftq_cache -f 20 -n 6000 -t 104 -a 360448
> ticks per ns 2.09508

This ^^^ appears to be the actual error, but I don't understand what the
expected result should be or what this really means.

Thanks,

-Dave


> =

> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> =

> Thanks,
> Rong Chen
> =



--===============8066541090813090129==--

